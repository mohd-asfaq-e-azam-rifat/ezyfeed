import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class EmployeeRemoteProvider {
  final Dio _client;

  EmployeeRemoteProvider(this._client);
}
