import 'package:valoku_app/core/network/network.dart';
import 'package:valoku_app/features/agent/data/models/models.dart';

abstract class AgentDataSource extends BaseRemoteDataSource {
  AgentDataSource({
    required super.dio,
    required super.apiBaseUrl,
  });

  Future<ApiResult<ListResult<AgentModel>>> getListAgent();
  Future<ApiResult<AgentModel>> getAgent();
}

class AgentDataSourceImpl extends AgentDataSource {
  AgentDataSourceImpl({
    required super.dio,
    required super.apiBaseUrl,
  });

  @override
  Future<ApiResult<ListResult<AgentModel>>> getListAgent() async {
    final response = await get(
      'agents',
    );

    return ApiResult.fromResponseListResult(
      response.data,
      (json) => AgentModel.fromJson(json),
    );
  }

  @override
  Future<ApiResult<AgentModel>> getAgent() async {
    final response = await get(
      'agents/e370fa57-4757-3604-3648-499e1f642d3f',
    );

    return ApiResult.fromResponse(
      response.data,
      (json) => AgentModel.fromJson(json),
    );
  }
}
