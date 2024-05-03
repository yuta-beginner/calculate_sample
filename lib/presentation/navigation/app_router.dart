import 'package:calculate_sample/presentation/navigation/routes.dart';
import 'package:calculate_sample/presentation/page/calculation_page.dart';
import 'package:calculate_sample/presentation/page/comparison_page.dart';
import 'package:calculate_sample/presentation/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../page/error_page.dart';
import '../widgets/app_navigation_bar.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final calculationNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'calculation');
final comparisonNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'comparison');
final settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

final appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.calculation,
    routes: [
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return AppNavigationBar(navigationShell: navigationShell);
          },
          branches: [
            // 計算ブランチ
            StatefulShellBranch(
              navigatorKey: calculationNavigatorKey,
              routes: [
                GoRoute(
                  path: Routes.calculation,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: CalculationPage(),
                  ),
                )
              ],
            ),
            // 比較ブランチ
            StatefulShellBranch(
              navigatorKey: comparisonNavigatorKey,
              routes: [
                GoRoute(
                  path: Routes.comparison,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const ComparisonPage(),
                  ),
                )
              ],
            ),
            // 設定ブランチ
            StatefulShellBranch(
              navigatorKey: settingsNavigatorKey,
              routes: [
                GoRoute(
                  path: Routes.settings,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SettingsPage(),
                  ),
                )
              ],
            ),
          ]),
    ]
);
