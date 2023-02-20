import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luminously/src/common/lang/lang.dart';
import 'package:luminously/src/common/models/user.dart';
import 'package:luminously/src/common/providers/locale_provider.dart';
import 'package:luminously/src/common/providers/theme_provider.dart';
import 'package:luminously/src/common/providers/user_provider.dart';
import 'package:luminously/src/common/resources/app_theme.dart';
import 'package:luminously/src/common/utils/ui/app_route.dart';
import 'package:luminously/src/features/dashboard_page/view/dashboard_page.dart';
import 'package:luminously/src/features/landing/view/landing_page.dart';
import 'package:luminously/src/features/login/view/login_page.dart';
import 'package:luminously/src/features/settings/views/settings_page.dart';
import 'package:provider/provider.dart';

class ApplicationMaterial extends StatelessWidget {
  const ApplicationMaterial({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    final user = this.user;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LocaleProvider(),
        ),
      ],
      builder: (context, child) {
        final localeProvider = context.watch<LocaleProvider>();
        final themeProvider = context.watch<ThemeProvider>();
        final UserProvider userProvider = context.watch<UserProvider>();
        if (user != null) {
          userProvider.setUser(user, notify: false);
        }
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
          child: MaterialApp(
            supportedLocales: Lang.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            locale: localeProvider.locale,
            themeMode: themeProvider.themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            onGenerateRoute: (RouteSettings routeSettings) {
              switch (routeSettings.name) {
                case LandingPage.routeName:
                  if (userProvider.user == null) {
                    return AppRoute.pageRoute<void>(
                      context: context,
                      widget: const LandingPage(),
                    );
                  } else {
                    return AppRoute.pageRoute<void>(
                      context: context,
                      widget: const DashboardPage(),
                    );
                  }
                case DashboardPage.routeName:
                  return AppRoute.pageRoute<void>(
                    context: context,
                    widget: const DashboardPage(),
                  );
                case SettingsPage.routeName:
                  return AppRoute.pageRoute<void>(
                    context: context,
                    widget: const SettingsPage(),
                  );
                case LoginPage.routeName:
                  return AppRoute.pageRoute<void>(
                    context: context,
                    widget: const LoginPage(),
                  );
                default:
                  return AppRoute.pageRoute<void>(
                    context: context,
                    widget: const LandingPage(),
                  );
              }
            },
          ),
        );
      },
    );
  }
}
