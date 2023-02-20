import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminously/src/common/providers/user_provider.dart';
import 'package:luminously/src/common/resources/assets.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';
import 'package:luminously/src/common/widgets/loading_widget.dart';
import 'package:luminously/src/features/dashboard_page/viewmodel/dashboard_viewmodel.dart';
import 'package:luminously/src/features/dashboard_page/widgets/doctor_card.dart';
import 'package:luminously/src/features/settings/views/settings_page.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const String routeName = '/Dashboard';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (BuildContext context) => DashboardViewModel(),
        builder: (BuildContext context, Widget? widget) {
          return const _DashboardPageWidget();
        },
      );
}

class _DashboardPageWidget extends StatefulWidget {
  const _DashboardPageWidget({Key? key}) : super(key: key);

  @override
  State<_DashboardPageWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<_DashboardPageWidget> {
  @override
  void initState() {
    super.initState();
    final DashboardViewModel dashboardViewModel = context.read();
    dashboardViewModel.fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final DashboardViewModel dashboardViewModel = context.watch();
    final UserProvider userProvider = context.watch();
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: ColoredBox(
              color: context.colorScheme.primary,
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            context.pushNamed(SettingsPage.routeName),
                        icon: Icon(
                          Icons.grid_view_rounded,
                          color: context.colorScheme.surface,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: context.colorScheme.surface,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.notifications_none,
                        color: context.colorScheme.surface,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: dashboardViewModel.isLoading
                      ? const LoadingWidget()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    context.theme.platform == TargetPlatform.iOS
                                        ? 40
                                        : 50,
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  text: context.localizations.helloUser(''),
                                  style: context.textTheme.titleMedium,
                                  children: [
                                    TextSpan(
                                      text: userProvider.user?.name ?? '',
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: const [
                                  Icon(Icons.location_pin),
                                  Text('Irbid - Jordan'),
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    context.theme.platform == TargetPlatform.iOS
                                        ? CupertinoIcons.search
                                        : Icons.search,
                                  ),
                                  hintText: context.localizations.searchDoctor,
                                ),
                                onChanged: dashboardViewModel.onSearchDoctor,
                              ),
                              const SizedBox(height: 10),
                              if (dashboardViewModel.doctors.isNotEmpty)
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    itemCount:
                                        dashboardViewModel.doctors.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return DoctorCard(
                                        doctor:
                                            dashboardViewModel.doctors[index],
                                      );
                                    },
                                  ),
                                )
                              else
                                Text(
                                  context.localizations.didNotFoundAnyDoctor,
                                ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            top: context.theme.platform == TargetPlatform.iOS ? 40 : 10,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  foregroundImage: AssetImage(AppImages.landing),
                  radius: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
