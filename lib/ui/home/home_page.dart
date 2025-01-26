import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/ui/community/community_page.dart';
import 'package:ezyfeed/ui/home/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final int pageIndex;

  const HomePage({
    super.key,
    this.pageIndex = 0,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _indexCommunity = 0;
  static const _indexLogout = 1;

  late int _pageIndex;

  @override
  void initState() {
    _pageIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16.0,
            children: [
              SvgPicture.asset(
                "assets/icons/ic_menu.svg",
                fit: BoxFit.contain,
                width: 32.0,
                height: 32.0,
              ),
              Column(
                spacing: 4.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Python Developer Community",
                    style: textStyleAppBarTitle,
                  ),
                  Text(
                    "#General",
                    style: textStyleAppBarSubtitle,
                  ),
                ],
              ),
            ],
          ),
        ),
        toolbarHeight: 112.0,
        backgroundColor: colorAppBarBackground,
        systemOverlayStyle: appBarTheme.systemOverlayStyle?.copyWith(
          systemNavigationBarColor: colorBottomBarBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: <Widget>[
        CommunityPage(),
      ][_pageIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 12.0,
        onDestinationSelected: (int index) {
          _onNavigationBarItemTapped(context, index);
        },
        selectedIndex: _pageIndex,
        destinations: <Widget>[
          BottomBarItemWidget(
            iconPath: "assets/icons/ic_community.svg",
            label: "Community",
            isSelected: _pageIndex == _indexCommunity,
          ),
          BottomBarItemWidget(
            iconPath: "assets/icons/ic_logout.svg",
            label: "Logout",
            isSelected: _pageIndex == _indexLogout,
          ),
        ],
      ),
    );
  }

  void _onNavigationBarItemTapped(BuildContext context, int index) {
    if (index == _indexLogout) {
      showDialog(
        context: context,
        builder: (context) => LogoutDialog(),
        barrierColor: colorBackgroundDim,
      );

      return;
    }

    setState(() {
      _pageIndex = index;
    });
  }
}

class BottomBarItemWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const BottomBarItemWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        fit: BoxFit.contain,
        width: 24.0,
        height: 24.0,
        colorFilter: ColorFilter.mode(
          isSelected ? colorBottomBarSelected : colorBottomBarNotSelected,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
