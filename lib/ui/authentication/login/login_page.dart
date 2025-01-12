import 'package:ezyfeed/base/widget/button/base_filled_button.dart';
import 'package:ezyfeed/base/widget/form/base_text_form_field.dart';
import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorBackground1,
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF004852), // First color
                  Color(0xFF156A76), // Second color
                  Color(0xFF014852), // Third color
                ],
                begin: Alignment.topLeft, // From top-left corner
                end: Alignment.bottomRight, // To bottom-right corner
                stops: [0.0, 0.5, 1.0], // Percentages for each color
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/icons/ic_background_bubbles.svg",
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: Center(
                        child: BrandingWidget(),
                      ),
                    ),
                    SignInWidget(),
                    // Expanded(
                    //   child: Center(
                    //     child: BrandingWidget(),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: SizedBox.shrink(),
                    // ),
                    // Expanded(
                    //   child: SignInWidget(),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    super.key,
  });

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late bool _shouldRemember;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _shouldRemember = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        border: Border(
          top: BorderSide(
            color: colorPrimary,
            width: 4.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 32.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          children: [
            Text(
              "Sign In",
              style: textStyleSectionHeader,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 36.0),
            BaseTextFormField(
              title: "Email",
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              maxLength: 320,
            ),
            SizedBox(height: 24.0),
            BaseTextFormField(
              title: "Password",
              controller: _passwordController,
              textInputType: TextInputType.visiblePassword,
              maxLength: 50,
            ),
            SizedBox(height: 20.0),
            Row(
              spacing: 6.0,
              children: [
                SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Checkbox(
                    value: _shouldRemember,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          _shouldRemember = value;
                        }
                      });
                    },
                    activeColor: colorPrimary,
                    checkColor: Colors.white,
                    side: BorderSide(
                      color: colorBorder1,
                      width: 1.0,
                    ),
                    //activeColor: Colors.white,
                  ),
                ),
                Text(
                  "Remember me",
                  style: textStyleRegularBody,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: 24.0),
            BaseFilledButton(
              title: "Login",
              onPressed: () {},
              buttonHeight: 60.0,
              buttonWidth: double.maxFinite,
              backgroundColor: colorAccentSecondary,
              textColor: colorText2,
              fontSize: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}

class BrandingWidget extends StatelessWidget {
  const BrandingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48.0),
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_full_logo.svg",
            fit: BoxFit.contain,
            height: 57.71,
          ),
          Text(
            "The Best Online Learning Platform",
            style: textStyleSectionSubtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
