import 'package:ezyfeed/base/app_config/app_config_bloc.dart';
import 'package:ezyfeed/base/app_config/app_config_event.dart';
import 'package:ezyfeed/base/helper/debounce.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/base/widget/button/base_filled_button.dart';
import 'package:ezyfeed/base/widget/form/base_text_form_field.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/ui/authentication/auth_bloc.dart';
import 'package:ezyfeed/ui/authentication/auth_event.dart';
import 'package:ezyfeed/ui/authentication/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.uiState.isError == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }
          }

          if (state is LoggedInSuccessfully) {
            final globalBloc = context.read<AppConfigBloc>();
            globalBloc.add(UserAuthStateUpdated());
          }
        },
        builder: (context, state) {
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
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: BrandingWidget(),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: SignInWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
  // Email
  late TextEditingController _emailController;
  late DebounceHelper _emailDebounceHelper;

  // Password
  late TextEditingController _passwordController;
  late DebounceHelper _passwordDebounceHelper;

  late bool _shouldRemember;
  late bool _isActiveButton;

  @override
  void initState() {
    // Email
    _emailController = TextEditingController(text: "soniamalik@gmail.com");
    _emailController.addListener(_onEmailChanged);
    _emailDebounceHelper = getIt<DebounceHelper>();

    // Password
    _passwordController = TextEditingController(text: "7654321");
    _passwordController.addListener(_onPasswordChanged);
    _passwordDebounceHelper = getIt<DebounceHelper>();

    _shouldRemember = false;
    _isActiveButton = false;

    super.initState();
  }

  @override
  void dispose() {
    // Email
    _emailController.removeListener(_onEmailChanged);
    _emailController.dispose();
    _emailDebounceHelper.dispose();

    // Password
    _passwordController.removeListener(_onPasswordChanged);
    _passwordController.dispose();
    _passwordDebounceHelper.dispose();

    super.dispose();
  }

  void _onEmailChanged() {
    _emailDebounceHelper.run(
      () {
        setState(() {
          _isActiveButton = _validateForm();
        });
      },
      milliseconds: 700,
    );
  }

  void _onPasswordChanged() {
    _passwordDebounceHelper.run(
      () {
        setState(() {
          _isActiveButton = _validateForm();
        });
      },
      milliseconds: 700,
    );
  }

  bool _validateForm() {
    final email = _emailController.text.trim();
    final regexEmail = RegExp(Regex.emailAddressRegex);
    final validEmail = email.isNotEmpty && regexEmail.hasMatch(email);

    final password = _passwordController.text.trim();
    final regexPassword = RegExp(Regex.passwordRegex);
    final validPassword =
        password.isNotEmpty && regexPassword.hasMatch(password);

    return validEmail && validPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
          top: 24.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Column(
          spacing: 24.0,
          children: [
            Text(
              "Sign In",
              style: textStyleSectionHeader,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                    SizedBox(height: 16.0),
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return BaseFilledButton(
                          title: "Login",
                          onPressed: _isActiveButton == true
                              ? () {
                                  _logIn(context);
                                }
                              : null,
                          buttonHeight: 60.0,
                          buttonWidth: double.maxFinite,
                          backgroundColor: colorAccentSecondary,
                          progressColor: colorPrimary,
                          textColor: colorText2,
                          fontSize: 18.0,
                          isLoading: state.uiState.isLoading,
                        );
                      },
                    ),
                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logIn(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    bloc.add(
      LoginRequested(email: email, password: password),
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
