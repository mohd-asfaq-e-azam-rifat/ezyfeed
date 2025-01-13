import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:ezyfeed/data/model/remote/response/leave/leave.dart';
import 'package:ezyfeed/data/service/local/leave_local_service.dart';
import 'package:ezyfeed/data/service/remote/leave_remote_service.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class LeaveRepository {
  final LeaveLocalService _localService;
  final LeaveRemoteService _remoteService;

  LeaveRepository(
    this._localService,
    this._remoteService,
  );

  Future<ApiResponse<LeaveSummary?>?> getMyLeaveSummary() async {
    return _remoteService.getMyLeaveSummary();
  }

  Future<ApiResponse<LeaveList?>?> getMyLeaveRequests({
    int page = 0,
    int size = 20,
    String sortBy = DatabaseKey.startFrom,
    String direction = "ASC",
    List<LeaveStatus> statusList = const [],
    List<LeaveType> typeList = const [],
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return _remoteService.getMyLeaveRequests(
      page: page,
      size: size,
      sortBy: sortBy,
      direction: direction,
      statusList: statusList,
      typeList: typeList,
      startDate: startDate?.toYearMonthDayFormat(),
      endDate: endDate?.toYearMonthDayFormat(),
    );
  }

  Future<ApiResponse<Leave?>?> requestLeaveForMe({
    required LeaveType leaveType,
    required String reason,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _remoteService.requestLeaveForMe(
      leaveType: leaveType,
      reason: reason,
      startDate: startDate.toYearMonthDayFormat(),
      endDate: endDate.toYearMonthDayFormat(),
    );
  }

  Future<ApiResponse<Leave?>?> cancelMyLeave({
    required int leaveId,
    required String statusChangeReason,
  }) {
    return _remoteService.cancelMyLeave(
      leaveId: leaveId,
      statusChangeReason: statusChangeReason,
    );
  }

  Future<ApiResponse<LeaveList?>?> getMyTeamLeaves({
    int page = 0,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _remoteService.getMyTeamLeaves(
      page: page,
      startDate: startDate.toYearMonthDayFormat(),
      endDate: endDate.toYearMonthDayFormat(),
    );
  }

  Future<ApiResponse<LeaveList?>?> getAwaitingLeaves({
    int page = 0,
    int size = 20,
    LeaveStatus? leaveStatus,
    LeaveType? leaveType,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _remoteService.getAwaitingLeaves(
      page: page,
      size: size,
      leaveStatus: leaveStatus,
      leaveType: leaveType,
      startDate: startDate.toYearMonthDayFormat(),
      endDate: endDate.toYearMonthDayFormat(),
    );
  }

  Future<ApiResponse<Leave?>?> processAwaitingLeave({
    required int leaveId,
    required LeaveStatus leaveStatus,
    String? statusChangeReason,
  }) {
    return _remoteService.processAwaitingLeave(
      leaveId: leaveId,
      leaveStatus: leaveStatus,
      statusChangeReason: statusChangeReason,
    );
  }
}
