import '../../../../core/utils/result.dart';

abstract class IJobsRepository {
  Future<Result<List<dynamic>>> getJobs();
}
