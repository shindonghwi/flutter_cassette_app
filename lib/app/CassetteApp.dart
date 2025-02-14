import 'package:cassette/navigation/Route.dart';
import 'package:cassette/presentation/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CassetteApp extends StatelessWidget {
  const CassetteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth != 0) {
          return MaterialApp(
            // app default option
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,

            // 시스템 테마 설정 (라이트, 다크 모드)
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,

            // 앱 Localization ( 한국어 지원 )
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,

            debugShowCheckedModeBanner: true,

            initialRoute: RoutingScreen.Splash.route,
            routes: RoutingScreen.getAppRoutes(),

            navigatorKey: CassetteGlobalVariable.naviagatorState,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class CassetteGlobalVariable {
  static final GlobalKey<NavigatorState> naviagatorState = GlobalKey<NavigatorState>();
}
