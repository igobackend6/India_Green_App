import '../../../../core/utils/result.dart';

abstract class IFinanceRepository {
  Future<Result<Map<String, dynamic>>> getWalletBalance();
  Future<Result<List<dynamic>>> getLoans();
}
