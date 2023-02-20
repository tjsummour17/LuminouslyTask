import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminously/src/common/providers/theme_provider.dart';
import 'package:luminously/src/common/providers/user_provider.dart';
import 'package:luminously/src/common/resources/app_colors.dart';
import 'package:luminously/src/common/services/local_database.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';
import 'package:luminously/src/common/widgets/main_button.dart';
import 'package:luminously/src/features/login/view/login_page.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String routeName = '/Settings';

  void _onLogout(BuildContext context) {
    UserProvider userProvider = context.read<UserProvider>();
    userProvider.setUser(null);
    Navigator.popUntil(context, (route) => false);
    context.pushNamed(LoginPage.routeName);
    LocaleDatabase.clearInfoKey();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.settings,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_medium),
            title: Text(context.localizations.theme),
            onTap: () {
              context.openBottomSheet<void>(
                bottomSheet: (context.theme.platform == TargetPlatform.iOS)
                    ? CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheet(
                            title: Text(
                              context.localizations.theme,
                              style: context.textTheme.bodyLarge,
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () =>
                                    themeProvider.themeMode = ThemeMode.system,
                                child:
                                    Text(context.localizations.systemDefault),
                              ),
                              CupertinoDialogAction(
                                onPressed: () =>
                                    themeProvider.themeMode = ThemeMode.light,
                                child: Text(context.localizations.light),
                              ),
                              CupertinoDialogAction(
                                onPressed: () =>
                                    themeProvider.themeMode = ThemeMode.dark,
                                child: Text(context.localizations.dark),
                              ),
                            ],
                            cancelButton: CupertinoButton(
                              color: context.colorScheme.surface,
                              onPressed: context.pop,
                              child: Text(
                                context.localizations.cancel,
                                style: context.textTheme.bodyMedium!
                                    .copyWith(color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      )
                    : BottomSheet(
                        onClosing: () {},
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                context.localizations.theme,
                                style: context.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 10),
                              const Divider(),
                              RadioListTile<ThemeMode>(
                                value: ThemeMode.system,
                                groupValue: themeProvider.themeMode,
                                onChanged: (ThemeMode? v) =>
                                    themeProvider.themeMode = v!,
                                title: Text(
                                  context.localizations.systemDefault,
                                ),
                              ),
                              RadioListTile<ThemeMode>(
                                value: ThemeMode.dark,
                                groupValue: themeProvider.themeMode,
                                onChanged: (v) => themeProvider.themeMode = v!,
                                title: Text(context.localizations.dark),
                              ),
                              RadioListTile<ThemeMode>(
                                value: ThemeMode.light,
                                groupValue: themeProvider.themeMode,
                                onChanged: (v) => themeProvider.themeMode = v!,
                                title: Text(context.localizations.light),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.localizations.logout),
            onTap: () {
              context.openPopUp(
                popUpWidget: (context.theme.platform == TargetPlatform.iOS)
                    ? CupertinoAlertDialog(
                        title: Text(context.localizations.logout),
                        content: Text(context.localizations.areYouSureToLogout),
                        actions: [
                          AppButton.text(
                            label: context.localizations.ok,
                            textStyle: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.error),
                            onPressed: () => _onLogout(context),
                          ),
                          AppButton.text(
                            label: context.localizations.cancel,
                            onPressed: context.pop,
                          ),
                        ],
                      )
                    : AlertDialog(
                        title: Text(context.localizations.logout),
                        content: Text(context.localizations.areYouSureToLogout),
                        actions: [
                          AppButton.text(
                            label: context.localizations.ok,
                            textStyle: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.error),
                            onPressed: () => _onLogout(context),
                          ),
                          AppButton.text(
                            label: context.localizations.cancel,
                            onPressed: context.pop,
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
