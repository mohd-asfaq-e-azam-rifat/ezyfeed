import 'package:dio/dio.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:ezyfeed/data/model/remote/response/leave/leave.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class LeaveRemoteService {
  final Dio _client;

  LeaveRemoteService(this._client);

  Future<ApiResponse<LeaveSummary?>?> getMyLeaveSummary() async {
    Response? response;

    response = await _client.getRequest(endPoint: urlMyLeaveSummary);

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => json != null
                ? LeaveSummary.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }

  Future<ApiResponse<LeaveList?>?> getMyLeaveRequests({
    int page = 0,
    int size = 20,
    String sortBy = DatabaseKey.startFrom,
    String direction = "ASC",
    List<LeaveStatus> statusList = const [],
    List<LeaveType> typeList = const [],
    String? startDate,
    String? endDate,
  }) async {
    Response? response;

    String startDateKey, endDateKey;
    if (sortBy == DatabaseKey.createdOn) {
      startDateKey = ApiKey.createdOnStartFrom;
      endDateKey = ApiKey.createdOnEndAT;
    } else if (sortBy == DatabaseKey.lastUpdatedOn) {
      startDateKey = ApiKey.lastUpdatedOnStartFrom;
      endDateKey = ApiKey.lastUpdatedOnEndAt;
    } else {
      startDateKey = ApiKey.startFrom;
      endDateKey = ApiKey.endAt;
    }

    response = await _client.getRequest(
      endPoint: urlMyLeaveList,
      queryParameters: {
        ApiKey.page: page,
        ApiKey.size: size,
        ApiKey.sortBy: sortBy,
        ApiKey.direction: direction,
        if (statusList.isNotEmpty) ApiKey.status: statusList.concatItems(),
        if (typeList.isNotEmpty) ApiKey.type: typeList.concatItems(),
        if (startDate != null) startDateKey: startDate,
        if (endDate != null) endDateKey: endDate,
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
          (json) => json != null
                ? LeaveList.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }

  Future<ApiResponse<Leave?>?> requestLeaveForMe({
    required LeaveType leaveType,
    required String reason,
    required String startDate,
    required String endDate,
  }) async {
    Response? response;

    response = await _client.postRequest(
      endPoint: urlRequestMyLeave,
      data: {
        ApiKey.type: leaveType.toJson(),
        ApiKey.reason: reason,
        ApiKey.startFrom: startDate,
        ApiKey.endAt: endDate,
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => json != null
                ? Leave.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }

  Future<ApiResponse<Leave?>?> cancelMyLeave({
    required int leaveId,
    required String statusChangeReason,
  }) async {
    Response? response;

    response = await _client.putRequest(
      endPoint: urlCancelMyLeave,
      data: {
        ApiKey.leaveId: leaveId,
        ApiKey.statusChangeReason: statusChangeReason,
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => json != null
                ? Leave.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }

  Future<ApiResponse<LeaveList?>?> getMyTeamLeaves({
    int page = 0,
    int size = 20,
    String sortBy = DatabaseKey.startFrom,
    String direction = "ASC",
    required String startDate,
    required String endDate,
  }) async {
    Response? response;

    response = await _client.getRequest(
      endPoint: urlMyTeamLeaves,
      queryParameters: {
        ApiKey.page: page,
        ApiKey.size: size,
        ApiKey.sortBy: sortBy,
        ApiKey.direction: direction,
        ApiKey.startFrom: startDate,
        ApiKey.endAt: endDate,
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
          (json) => json != null
                ? LeaveList.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }

  Future<ApiResponse<LeaveList?>?> getAwaitingLeaves({
    int page = 0,
    int size = 20,
    String sortBy = DatabaseKey.startFrom,
    String direction = "ASC",
    LeaveStatus? leaveStatus,
    LeaveType? leaveType,
    required String startDate,
    required String endDate,
  }) async {
    Response? response;

    response = await _client.getRequest(
      endPoint: urlAwaitingLeaves,
      queryParameters: {
        ApiKey.page: page,
        ApiKey.size: size,
        ApiKey.sortBy: sortBy,
        ApiKey.direction: direction,
        if (leaveStatus != null) ApiKey.status: leaveStatus.toJson(),
        if (leaveType != null) ApiKey.type: leaveType.toJson(),
        ApiKey.startFrom: startDate,
        ApiKey.endAt: endDate,
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
          (json) => json != null
                ? LeaveList.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }

  Future<ApiResponse<Leave?>?> processAwaitingLeave({
    required int leaveId,
    required LeaveStatus leaveStatus,
    String? statusChangeReason,
  }) async {
    Response? response;

    response = await _client.putRequest(
      endPoint: urlActionToLeaveOfJunior,
      data: {
        ApiKey.leaveId: leaveId,
        ApiKey.status: leaveStatus.toJson(),
        if (statusChangeReason?.trim().isNotEmpty == true)
          ApiKey.statusChangeReason: statusChangeReason,
      },
    );

    return response?.data != null
        ? ApiResponse.fromJson(
            response?.data,
            (json) => json != null
                ? Leave.fromJson(json as Map<String, dynamic>)
                : null,
          )
        : null;
  }
}
