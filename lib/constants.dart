import 'package:flutter/material.dart';

// Colors
const colorPrimary = Color(0xFF023D45);
const colorAccent = Color(0xFFFFFFFF);
const colorAccentSecondary = Color(0xFFE8F54A);
const colorText1 = Color(0xFFF5F5FF);
const colorText2 = Color(0xFF095661);
const colorBorder1 = Color(0xFFD0D5DD);
const colorBottomBarBackground = Color(0xFFF2F4F7);
const colorBottomBarSelected = Color(0xFF004852);
const colorBottomBarNotSelected = Color(0xFF101828);
const colorDialogTitle = Color(0xFF1A1336);
const colorDialogSubtitle = Color(0xFF28243C);
const colorDialogPositiveAction = Color(0xFF5D5BE9);
const colorDialogNegativeAction = Color(0xFF686868);
final colorBackgroundDim = Color(0xFF101828).withValues(alpha: 0.6);
const colorDialogDivider = Color(0xFFBCBCBC);

const colorDisabled1 = Color(0xFFE0E0E0);
const colorDisabled2 = Color(0xFFAAA9A9);
const colorBackground1 = Color(0xFF023D45);
const colorBackground2 = Color(0xFFEBF7FF);
const colorBackground3 = Color(0xFFF3F3F3);
const colorBackground4 = Color(0xFFE8F6FF);
const colorBackground5 = Color(0xFFEAFFF1);
const colorBackground6 = Color(0xFFFFFFEF);
const colorBackground7 = Color(0xFFFFF2E7);
const colorBackground8 = Color(0xFFFCFCFC);
const colorError1 = Color(0xFFE30000);
const colorError2 = Color(0xFFEB5757);
const colorError3 = Color(0xFFF74134);
const colorRedAccent1 = Color(0xFFFFEBEB);
const colorRedAccent2 = Color(0xFFFFCACA);
const colorGray1 = Color(0xFF333333);
const colorGray100 = Color(0xFFF4F4F6);
const colorGray2 = Color(0xFF808A98);
const colorGray3 = Color(0xFF828282);
const colorGray300 = Color(0xFFD3D5DA);
const colorGray4 = Color(0xFFBDBDBD);
const colorGray500 = Color(0xFF6C727F);
const colorGray6 = Color(0xFFF2F2F2);
const colorGray600 = Color(0xFF4D5461);
const colorGray700 = Color(0xFF394150);
const colorGray8 = Color(0xFF292D32);
const colorGray9 = Color(0xFF676767);
const colorBlack = Color(0xFF111113);
const colorText3 = Color(0xFF212121);
const colorText4 = Color(0xFF56607A);
const colorShadow1 = Color(0xFF646466);
const colorGreen1 = Color(0xFF219653);
const colorGreen2 = Color(0xFF3CC35A);
const colorGreen3 = Color(0xFF12B76A);
const colorGreen4 = Color(0xFF98F2B7);
const colorWhite = Color(0xFFFFFFFF);
const colorSelectedTab = Color(0xFF252E3B);
const colorBlueAccent1 = Color(0xFF9EDAFF);
const colorOlive1 = Color(0xFFB1B41E);
const colorOlive2 = Color(0xFFDFE239);
const colorOrange1 = Color(0xFFFF8C21);
const colorOrange2 = Color(0xFFFFD8B4);
const colorYellow1 = Color(0xFFF2C94C);

// Font-family
const fontFamilyFigtree = "Figtree";

// Regular Text Styles
const textStyleAppBarTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorWhite,
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
  height: 1.2,
);

const textStyleVerySmallBody = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorGray1,
  fontWeight: FontWeight.w400,
  fontSize: 10.0,
  height: 1.172,
);

const textStyleSmallBody = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorGray1,
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
  height: 1.172,
);

const textStyleRegularBody = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorAccent,
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  height: 1.2,
);

const textStyleTabLabel = TextStyle(
  fontFamily: fontFamilyFigtree,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  height: 1.4285,
);

const textStyleSectionSubtitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorAccentSecondary,
  fontWeight: FontWeight.w600,
  fontSize: 19.0,
  height: 1.47,
);

const textStyleSectionHeader = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorAccent,
  fontWeight: FontWeight.w600,
  fontSize: 38.0,
  height: 1.2,
);

const textStyleFormTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText1,
  fontWeight: FontWeight.w500,
  fontSize: 17.06,
  height: 1.43,
);

const textStyleFormText = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText1,
  fontWeight: FontWeight.w400,
  fontSize: 19.5,
);

const textStyleBottomBarItemSelected = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorBottomBarSelected,
  fontWeight: FontWeight.w700,
  fontSize: 12.0,
  height: 1.2,
);

const textStyleBottomBarItemNotSelected = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorBottomBarNotSelected,
  fontWeight: FontWeight.w600,
  fontSize: 12.0,
  height: 1.2,
);

const textStyleDialogTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorDialogTitle,
  fontWeight: FontWeight.w700,
  fontSize: 26.0,
  height: 1.2,
);

const textStyleDialogSubtitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorDialogSubtitle,
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
  height: 1.2,
);

const textStyleDialogAction = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorDialogPositiveAction,
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
  height: 1.2,
);

abstract class CustomHttpHeader {
  static const serviceName = "x-service-name";
  static const uuid = "x-request-uuid";
  static const theme = "accept-theme";
  static const settingsHash = "x-settings-hash";
  static const token = "token";
  static const requiresAuth = "requires-auth";
  static const authorization = "Authorization";
}

abstract class CustomHttpHeaderValue {
  static const applicationJson = "application/json";
  static const app = "app";
}

abstract class PageIndex {
  static const dashboard = 0;
  static const attendance = 1;
  static const leave = 2;
  static const profile = 3;
}

abstract class PageSubIndex {
  static const myAttendance = 0;
  static const contactDirectory = 1;
  static const leadAwaiting = 0;
  static const leadMyTeam = 1;
  static const leadMyRequests = 2;
  static const regularMyTeam = 0;
  static const regularMyRequests = 1;
}

abstract class LocalKey {
  static const medium = "medium";
  static const authProcess = "auth-process";
  static const authProvider = "auth-provider";
  static const shouldShowLeading = "should-show-leading";
  static const appBarTitle = "app-bar-title";
  static const url = "url";
  static const otp = "otp";
  static const index = "index";
  static const subIndex = "sub_index";
  static const hash = "hash";
  static const secret = "secret";
}

abstract class RemoteKey {
  static const status = "status";
}

abstract class RemoteValue {
  static const accepted = "ACCEPTED";
  static const rejected = "REJECTED";
}

abstract class ApiKey {
  static const provider = "provider";
  static const type = "type";
  static const methods = "methods";
  static const reference = "reference";
  static const credential = "credential";
  static const email = "email";
  static const password = "password";
  static const appToken = "app_token";
  static const mobileNumber = "mobile_number";
  static const operator = "operator";
  static const amount = "amount";
  static const telType = "tel_type";
  static const newPassword = "new_password";
  static const page = "page";
  static const limit = "limit";
  static const code = "code";
  static const hash = "hash";
  static const token = "token";
  static const fcmToken = "fcmToken";
  static const deviceId = "deviceId";
  static const loginType = "loginType";
  static const appPlatform = "appPlatform";
  static const sortBy = "sort_by";
  static const direction = "direction";
  static const status = "status";
  static const startFrom = "startFrom";
  static const endAt = "endAt";
  static const reason = "reason";
  static const leaveId = "leaveId";
  static const statusChangeReason = "statusChangeReason";
  static const size = "size";
  static const createdOnStartFrom = "createdOnStartFrom";
  static const createdOnEndAT = "createdOnEndAT";
  static const lastUpdatedOnStartFrom = "lastUpdatedOnStartFrom";
  static const lastUpdatedOnEndAt = "lastUpdatedOnEndAt";
}

abstract class DatabaseKey {
  static const startFrom = "startFrom";
  static const endAt = "endAt";
  static const createdOn = "createdOn";
  static const lastUpdatedOn = "lastUpdatedOn";
  static const durationInDays = "durationInDays";
}

abstract class NotificationAction {
  static const attendance = "attendance";
  static const leaveRequest = "leave-request";
  static const leaveApproved = "leave-approved";
  static const leaveDeclined = "leave-declined";
  static const leaveNotice = "leave-notice";
  static const contactDirectory = "contact-directory";
}

abstract class Regex {
  static const mobileNumberRegex = r"(^(\\+88)?(01)[2-9][0-9]{8,8}$)";
  static const emailAddressRegex =
      r'^[a-zA-Z\d._%+-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$';
  static const passwordRegex = r"(^[a-zA-Z0-9]{4,}$)";
  static const websiteUrlRegex =
      "(http|ftp|https)://[\\w-]+(\\.[\\w-]+)+([\\w.,@?^=%&amp;:/~+#-]*[\\w@?^=%&amp;/~+#-])?";
}

// Pagination
const paginationRatio = 0.75;

// Notification
const notificationChannelId = "exabyting_aladin";
const notificationChannelName = "Aladin";
const notificationIcon = "@drawable/ic_notification";

// Contact
const maxLimitOfSelfContacts = 3;

// Leave
const maxRangeOfLeave = 90;

// API End-points
// Auth
const urlLogin = "/student/auth/login";
const urlLogOut = "/student/auth/logout";
// Leave
const urlMyLeaveList = "/api/leave/list";
const urlMyLeaveSummary = "/api/leave/summary";
const urlRequestMyLeave = "/api/leave/request";
const urlCancelMyLeave = "/api/leave/request/cancel";
const urlMyTeamLeaves = "/api/leave/approved/team-members/list";
const urlAwaitingLeaves = "/api/leave/lead/list";
const urlActionToLeaveOfJunior = "/api/leave/lead/action";
