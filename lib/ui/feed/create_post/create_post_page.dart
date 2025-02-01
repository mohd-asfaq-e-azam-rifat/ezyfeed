import 'package:ezyfeed/base/helper/debounce.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:ezyfeed/ui/feed/feed_bloc.dart';
import 'package:ezyfeed/ui/feed/feed_event.dart';
import 'package:ezyfeed/ui/feed/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // Gradients
  static const List _backgroundGradients = [
    LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ],
    ),
    LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFFff00ea),
        Color(0xFFff7300),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      transform: GradientRotation(-135),
      colors: [
        Color.fromRGBO(72, 229, 169, 1),
        Color.fromRGBO(143, 199, 173, 1),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(116, 167, 126, 1),
        Color.fromRGBO(24, 175, 78, 1),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFff7f11),
        Color(0xFFff7f11),
      ],
    ),
    LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFF00ffe1),
        Color(0xFFe9ff42),
      ],
    )
  ];

  static const _backgroundGradientValues = [
    "{\"backgroundImage\": \"linear-gradient(90deg, rgb(255, 255, 255), rgb(255, 255, 255))\"}",
    "{\"backgroundImage\": \"linear-gradient(90deg, rgb(255, 0, 234), rgb(255, 115, 0))\"}",
    "{\"backgroundImage\": \"linear-gradient(-135deg, rgb(72, 229, 169), rgb(143, 199, 173))\"}",
    "{\"backgroundImage\": \"linear-gradient(135deg, rgb(116, 167, 126), rgb(24, 175, 78))\"}",
    "{\"backgroundImage\": \"linear-gradient(135deg, rgb(255, 127, 17), rgb(255, 127, 17))\"}",
    "{\"backgroundImage\": \"linear-gradient(90deg, rgb(0, 255, 225), rgb(233, 255, 66))\"}",
  ];

  late int _gradientIndex;
  late bool _isGradientsExpanded;

  // Post
  late TextEditingController _postController;
  late DebounceHelper _postDebounceHelper;

  // Action buttons
  late bool _isActiveButton;

  @override
  void initState() {
    _postController = TextEditingController();
    _postController.addListener(_onPostChanged);
    _postDebounceHelper = DebounceHelper();

    _isActiveButton = false;
    _gradientIndex = 0; // first gradient by default
    _isGradientsExpanded = true; // show gradients by default

    super.initState();
  }

  @override
  void dispose() {
    _postController.removeListener(_onPostChanged);
    _postController.dispose();
    _postDebounceHelper.dispose();
    super.dispose();
  }

  void _onPostChanged() {
    _postDebounceHelper.run(
      () {
        setState(() {
          _isActiveButton = _validateForm();
        });
      },
      milliseconds: 300,
    );
  }

  bool _validateForm() {
    final post = _postController.text.trim();
    final isValidPost = post.isNotEmpty;

    return isValidPost;
  }

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Post"),
        leadingWidth: 96.0,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Close",
                style: textStyleCreatePostAppBarLeading,
              ),
            ),
          ),
        ),
        actions: [
          BlocBuilder<FeedBloc, FeedState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: _isActiveButton == true
                    ? () {
                        context.read<FeedBloc>().add(
                              PostCreationRequested(
                                text: _postController.text.trim(),
                                backgroundColor:
                                    _backgroundGradientValues[_gradientIndex],
                              ),
                            );

                        context.pop();
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
                    child: Text(
                      "Create",
                      style: textStyleCreatePostAppBarAction.copyWith(
                        color: _isActiveButton ? colorText6 : colorDisabled1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
        titleTextStyle: textStyleCreatePostAppBarTitle,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: appBarTheme.systemOverlayStyle?.copyWith(
          systemNavigationBarColor: colorPageBackground,
          systemNavigationBarContrastEnforced: false,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: false,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                border: Border.fromBorderSide(
                  BorderSide(color: colorCreatePostFormBorder),
                ),
                gradient: _backgroundGradients[_gradientIndex],
              ),
              height: 170.0,
              margin: const EdgeInsets.only(
                top: 8.0,
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                style: textStyleFormText.copyWith(
                  fontSize: 16.0,
                  color: colorText9,
                  height: 1.5,
                ),
                minLines: 1,
                maxLines: null,
                controller: _postController,
                onTapOutside: (event) {
                  context.hideKeyboard();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "What's on your mind?",
                  counterText: "",
                  contentPadding: const EdgeInsets.all(20.0),
                  hintStyle: textStyleFormText.copyWith(
                    fontSize: 16.0,
                    color: colorText9.withValues(alpha: 0.3),
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 8.0,
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              width: double.maxFinite,
              height: 26.0,
              child: Row(
                spacing: 6.0,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 26.0,
                      height: 26.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                      ),
                      child: Icon(
                        _isGradientsExpanded
                            ? Icons.arrow_back_ios_outlined
                            : Icons.arrow_forward_ios_outlined,
                        size: 16.0,
                      ),
                    ),
                    onTap: () {
                      // Toggle the expansion
                      setState(() {
                        _isGradientsExpanded = !_isGradientsExpanded;
                      });
                    },
                  ),
                  Expanded(
                    child: _isGradientsExpanded
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: _backgroundGradients.length,
                            itemBuilder: (context, index) {
                              final item = _backgroundGradients[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _gradientIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    gradient: item,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 6.0);
                            },
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
