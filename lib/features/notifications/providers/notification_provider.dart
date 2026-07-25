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
    title: '🚜 New Livestock Projects',
    desc: 'Explore our newly added livestock setups and boost your farm\'s productivity.',
    type: NotificationType.info,
    route: '/projects',
  ),
  (
    title: '📦 Organic Products Restocked',
    desc: 'Premium organic nutrients are back in stock at IGO Agri Mart. Order now!',
    type: NotificationType.success,
    route: '/products',
  ),
  (
    title: '🔬 Soil Testing Service',
    desc: 'Book a comprehensive soil test today through Tech Farming Expert.',
    type: NotificationType.info,
    route: '/services',
  ),
  (
    title: '🎓 New Course: Hydroponics',
    desc: 'Enroll in the Modern Hydroponics certification course at IGO Academy.',
    type: NotificationType.info,
    route: '/courses',
  ),
  (
    title: '🌾 Discover IGO Farmlands',
    desc: 'Invest in premium, high-yield farmlands and secure consistent returns.',
    type: NotificationType.success,
    route: '/home',
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
