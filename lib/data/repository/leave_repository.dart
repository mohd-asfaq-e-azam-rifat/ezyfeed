import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:ezyfeed/data/model/remote/response/leave/leave.dart';
import 'package:ezyfeed/data/provider/local/leave_local_provider.dart';
import 'package:ezyfeed/data/provider/remote/leave_remote_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class LeaveRepository {
  final LeaveLocalProvider _localProvider;
  final LeaveRemoteProvider _remoteProvider;

  LeaveRepository(
    this._localProvider,
    this._remoteProvider,
  );

  Future<ApiResponse<LeaveSummary?>?> getMyLeaveSummary() async {
    return _remoteProvider.getMyLeaveSummary();
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
    return _remoteProvider.getMyLeaveRequests(
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
    return _remoteProvider.requestLeaveForMe(
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
    return _remoteProvider.cancelMyLeave(
      leaveId: leaveId,
      statusChangeReason: statusChangeReason,
    );
  }

  Future<ApiResponse<LeaveList?>?> getMyTeamLeaves({
    int page = 0,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _remoteProvider.getMyTeamLeaves(
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
    return _remoteProvider.getAwaitingLeaves(
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
    return _remoteProvider.processAwaitingLeave(
      leaveId: leaveId,
      leaveStatus: leaveStatus,
      statusChangeReason: statusChangeReason,
    );
  }
}
