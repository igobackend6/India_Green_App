import '../../../../core/utils/result.dart';

abstract class IAgrimartRepository {
  Future<Result<List<dynamic>>> getProducts();
}
