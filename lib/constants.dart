import 'package:flutter/material.dart';

// Colors
const colorPrimary = Color(0xFF023D45);
const colorAccent = Color(0xFFFFFFFF);
const colorAccentSecondary = Color(0xFFE8F54A);
const colorText1 = Color(0xFFF5F5FF);
const colorText2 = Color(0xFF095661);
const colorText3 = Color(0xFF040810);
const colorText4 = Color(0xFF667085);
const colorText5 = Color(0xFF98A2B3);
const colorText6 = Color(0xFF6662FF);
const colorText7 = Color(0xFF333741);
const colorText8 = Colors.black;
const colorText9 = Color(0xFF181534);
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
const colorPageBackground = Color(0xFFF3F3F3);
const colorAppBarBackground = Color(0xFF115C67);
const colorFeedItemMoreIcon = Color(0xFF232A37);
const colorWriteForFeedBorder = Color(0x33004852);
const colorCreatePostFormBorder = Color(0xFFE1E1E1);
const colorCreatePostCommentIcon = Color(0xFF1B1B35);
const colorNoReaction = Color(0xFF1B1B35);
const colorReactionLike = Color(0xFF6662FF);
const colorReactionLove = Color(0xFFF04438);
const colorReactionCare = Color(0xFFF69B30);
const colorReactionHaha = Color(0xFFF69B30);
const colorReactionWow = Color(0xFFF69B30);
const colorReactionSad = Color(0xFFF69B30);
const colorReactionAngry = Color(0xFFE04300);

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
const textStyleHomeAppBarTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorAccent,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
  height: 1.2,
);

final textStyleHomeAppBarSubtitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorAccent.withValues(alpha: 0.7),
  fontWeight: FontWeight.w500,
  fontSize: 14.0,
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

const textStyleFeedItemTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText3,
  fontWeight: FontWeight.w600,
  fontSize: 16.0,
);

const textStyleFeedItemSubtitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText4,
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
);

const textStyleFeedItemBodyRegular = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorBottomBarNotSelected,
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  height: 1.643,
);

const textStyleFeedItemBodyLink = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText6,
  fontWeight: FontWeight.w500,
  fontSize: 14.0,
  height: 1.643,
  decoration: TextDecoration.underline,
);

const textStyleWriteForFeedTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText5,
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  height: 1.2,
);

const textStyleFeedItemCommentCount = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText7,
  fontWeight: FontWeight.w600,
  fontSize: 14.0,
);

const textStyleCreatePostAppBarTitle = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText8,
  fontWeight: FontWeight.w500,
  fontSize: 18.0,
  height: 1.2,
);

const textStyleCreatePostAppBarLeading = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorFeedItemMoreIcon,
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  height: 1.2,
);

const textStyleCreatePostAppBarAction = TextStyle(
  fontFamily: fontFamilyFigtree,
  color: colorText6,
  fontWeight: FontWeight.w500,
  fontSize: 18.0,
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

abstract class ApiKey {
  static const email = "email";
  static const password = "password";
  static const appToken = "app_token";
  static const feedText = "feed_txt";
  static const communityId = "community_id";
  static const spaceId = "space_id";
  static const uploadType = "uploadType";
  static const activityType = "activity_type";
  static const hasBackground = "is_background";
  static const backgroundColor = "bg_color";
  static const status = "status";
  static const more = "more";
  static const feedId = "feed_id";
  static const reactionType = "reaction_type";
}

abstract class ApiValue {
  static const defaultCommunityId = 2914;
  static const defaultSpaceId = 5883;
  static const defaultUploadType = "text";
  static const defaultActivityType = "group";
  static const defaultHasBackgroundValue = 1;
  static const feed = "feed";
}

abstract class AppKey {
  static const flavor = "flavor";
}

abstract class AppValue {
  static const dev = "dev";
  static const prod = "prod";
}

abstract class Regex {
  static const emailAddressRegex =
      r'^[a-zA-Z\d._%+-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$';
  static const passwordRegex = r"(^[a-zA-Z0-9]{4,}$)";
  static const linkRegex = r'((https?|ftp):\/\/[^\s/$.?#].[^\s]*)';
}

abstract class UserReaction {
  static const like = "LIKE";
  static const love = "LOVE";
  static const care = "CARE";
  static const haha = "HAHA";
  static const wow = "WOW";
  static const sad = "SAD";
  static const angry = "ANGRY";
}

// Pagination
const paginationRatio = 0.75;

// API End-points
// Auth
const urlLogin = "/student/auth/login";
const urlLogOut = "/student/auth/logout";
const urlToCreatePost = "/teacher/community/createFeedWithUpload";
const urlToGetFeed = "/teacher/community/getFeed";
const urlToReactOnFeedPost = "/teacher/community/createLike";
