import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:luminously/src/common/models/user.dart';
import 'package:luminously/src/common/providers/user_provider.dart';
import 'package:luminously/src/common/resources/assets.dart';
import 'package:luminously/src/common/resources/constants.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';
import 'package:luminously/src/common/widgets/loading_widget.dart';
import 'package:luminously/src/common/widgets/main_button.dart';
import 'package:luminously/src/features/dashboard_page/view/dashboard_page.dart';
import 'package:luminously/src/features/login/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginViewModel(),
      builder: (context, child) {
        return const _LoginPage();
      },
    );
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordObscure = true;
  bool saveLogin = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future _login() async {
    if (_loginKey.currentState!.validate()) {
      LoginViewModel loginProvider = context.read<LoginViewModel>();
      UserProvider userProvider = context.read<UserProvider>();
      User? user = await loginProvider.login(
        email: usernameController.text,
        password: passwordController.text,
      );
      if (user != null) {
        userProvider.setUser(user);
        Navigator.popUntil(context, (route) => false);
        context.pushNamed(DashboardPage.routeName);
      } else {
        context.showSnackBar(
          message: context.localizations.invalidLoginCredential,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = context.watch();
    return Stack(
      children: [
        Scaffold(
          body: Form(
            key: _loginKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: [
                SizedBox(height: context.screenHeight * 0.20),
                Lottie.asset(
                  AppLottie.login,
                  width: 150,
                  height: 150,
                  repeat: false,
                ),
                const SizedBox(height: 50),
                Text(
                  context.localizations.pleaseLogin,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.localizations.welcomeBack,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? v) =>
                      v != null && RegExp(Constants.emailRegEx).hasMatch(v)
                          ? null
                          : context.localizations.invalidEmail,
                  decoration: InputDecoration(
                    labelText: context.localizations.email,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: passwordController,
                  obscureText: passwordObscure,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? v) =>
                      v != null && v.isNotEmpty ? null : '*',
                  decoration: InputDecoration(
                    hintText: context.localizations.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () => setState(
                        () => passwordObscure = !passwordObscure,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                AppButton(
                  onPressed: _login,
                  label: context.localizations.login,
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        if (loginViewModel.isLoading) const LoadingWidget()
      ],
    );
  }
}
