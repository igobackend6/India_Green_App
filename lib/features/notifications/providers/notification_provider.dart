import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notification type severity levels.
enum NotificationType { info, warning, success, urgent }

/// A single in-app notification.
class IgoNotification {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final NotificationType type;
  final String targetRoute;
  final bool isNew;

  const IgoNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
    required this.targetRoute,
    this.isNew = true,
  });

  IgoNotification copyWith({bool? isNew}) => IgoNotification(
        id: id,
        title: title,
        description: description,
        timestamp: timestamp,
        type: type,
        targetRoute: targetRoute,
        isNew: isNew ?? this.isNew,
      );

  String get timeAgo {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inSeconds < 60) return 'Just Now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

/// State holding the notification list and heads-up display state.
class NotificationState {
  final List<IgoNotification> notifications;
  final IgoNotification? currentHeadsUp;
  final bool isHeadsUpVisible;

  const NotificationState({
    this.notifications = const [],
    this.currentHeadsUp,
    this.isHeadsUpVisible = false,
  });

  NotificationState copyWith({
    List<IgoNotification>? notifications,
    IgoNotification? currentHeadsUp,
    bool? isHeadsUpVisible,
  }) =>
      NotificationState(
        notifications: notifications ?? this.notifications,
        currentHeadsUp: currentHeadsUp ?? this.currentHeadsUp,
        isHeadsUpVisible: isHeadsUpVisible ?? this.isHeadsUpVisible,
      );
}

/// Simulated notification pool matching the Kotlin app's alerts.
const _simulationPool = [
  (
    title: '⚠️ Sudden Rain Advisory',
    desc: 'Heavy rain expected in Salem district within 3 hours. Cover harvested produce!',
    type: NotificationType.warning,
    route: '/home',
  ),
  (
    title: '⚖️ Mandi Basmati Price Spike',
    desc: 'Premium paddy surged to ₹4,550/Qtl at Salem Mandi, hitting your target!',
    type: NotificationType.urgent,
    route: '/mandi',
  ),
  (
    title: '💰 PM-KISAN Subsidy Transferred',
    desc: '₹2,500 Central Scheme Grant credited to your IGO Farm Wallet.',
    type: NotificationType.success,
    route: '/hubs/finance',
  ),
  (
    title: '🎓 Academy Certificate',
    desc: 'Completed the Scientific Paddy Cultivation course. Grab your certificate!',
    type: NotificationType.success,
    route: '/hubs/learn',
  ),
  (
    title: '💼 Precision Agri Job Matched',
    desc: 'IGO Farmlands listed an Operations Lead role matching your profile.',
    type: NotificationType.info,
    route: '/hubs/jobs',
  ),
  (
    title: '🤖 Soil Doctor Crop Advice',
    desc: 'Tomato Septoria leaf spots found. Liquid copper soap spray recommended.',
    type: NotificationType.info,
    route: '/ai-doctor',
  ),
  (
    title: '🔥 15% Off Seeds Coupon Live',
    desc: 'Weekly deals: 15% discount on bio-fertilizers and paddy seeds. Ends tonight!',
    type: NotificationType.info,
    route: '/market',
  ),
  (
    title: '🤝 Cold Chain Freight Pickup',
    desc: 'IGO Logistics truck scheduled near Salem for fresh export loads. Reserve space!',
    type: NotificationType.urgent,
    route: '/market',
  ),
];

/// Manages notification lifecycle with periodic simulated alerts.
class NotificationNotifier extends StateNotifier<NotificationState> {
  Timer? _simTimer;
  Timer? _dismissTimer;
  int _simIndex = 0;

  NotificationNotifier() : super(const NotificationState()) {
    // Initial welcome notification
    push(IgoNotification(
      id: 'welcome_${DateTime.now().millisecondsSinceEpoch}',
      title: '🌱 Welcome to INDIA GREEN APP',
      description:
          'Successfully logged in. Explore AgriMart or check Live Mandi prices.',
      timestamp: DateTime.now(),
      type: NotificationType.success,
      targetRoute: '/home',
    ));

    // Start simulation after 12 seconds
    Future.delayed(const Duration(seconds: 12), () {
      _simTimer = Timer.periodic(const Duration(seconds: 40), (_) {
        _generateSimulated();
      });
    });
  }

  void _generateSimulated() {
    final template = _simulationPool[_simIndex % _simulationPool.length];
    _simIndex++;
    push(IgoNotification(
      id: 'sim_${DateTime.now().millisecondsSinceEpoch}',
      title: template.title,
      description: template.desc,
      timestamp: DateTime.now(),
      type: template.type,
      targetRoute: template.route,
    ));
  }

  void push(IgoNotification notification) {
    state = state.copyWith(
      notifications: [notification, ...state.notifications],
      currentHeadsUp: notification,
      isHeadsUpVisible: true,
    );

    // Auto-dismiss heads-up after 6.5 seconds
    _dismissTimer?.cancel();
    _dismissTimer = Timer(const Duration(milliseconds: 6500), dismissHeadsUp);
  }

  void dismissHeadsUp() {
    state = state.copyWith(isHeadsUpVisible: false);
  }

  void markRead(String id) {
    final updated = state.notifications.map((n) {
      return n.id == id ? n.copyWith(isNew: false) : n;
    }).toList();
    state = state.copyWith(notifications: updated);
  }

  void markAllRead() {
    final updated =
        state.notifications.map((n) => n.copyWith(isNew: false)).toList();
    state = state.copyWith(notifications: updated);
  }

  void clearAll() {
    state = state.copyWith(notifications: []);
  }

  @override
  void dispose() {
    _simTimer?.cancel();
    _dismissTimer?.cancel();
    super.dispose();
  }
}

final notificationStateProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier();
});
