import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';


import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? const HomePageWidget() : const EnterPageWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const EnterPageWidget(),
        ),
        FFRoute(
          name: 'loginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'ProfileUser',
          path: '/profileUser',
          requireAuth: true,
          builder: (context, params) => ProfileUserWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['User'],
            ),
          ),
        ),
        FFRoute(
          name: 'EnterPage',
          path: '/enterPage',
          builder: (context, params) => const EnterPageWidget(),
        ),
        FFRoute(
          name: 'registerPage',
          path: '/registerPage',
          builder: (context, params) => const RegisterPageWidget(),
        ),
        FFRoute(
          name: 'PasswordResetPage',
          path: '/passwordResetPage',
          builder: (context, params) => const PasswordResetPageWidget(),
        ),
        FFRoute(
          name: 'eventPageBackup',
          path: '/eventPageBackup',
          requireAuth: true,
          builder: (context, params) => EventPageBackupWidget(
            eventId: params.getParam(
              'eventId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Event'],
            ),
            prListId: params.getParam(
              'prListId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PrList'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrganizationPagev3',
          path: '/OrganizationPage',
          builder: (context, params) => OrganizationPagev3Widget(
            organizationReference: params.getParam(
              'organizationReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'EventCreate',
          path: '/eventCreate',
          requireAuth: true,
          builder: (context, params) => const EventCreateWidget(),
        ),
        FFRoute(
          name: 'OrganizerCreateList',
          path: '/organizerCreateList',
          requireAuth: true,
          builder: (context, params) => const OrganizerCreateListWidget(),
        ),
        FFRoute(
          name: 'OrganizationCreate',
          path: '/organizationCreate',
          requireAuth: true,
          builder: (context, params) => const OrganizationCreateWidget(),
        ),
        FFRoute(
          name: 'ProfileUserPublic',
          path: '/profileUserPublic',
          requireAuth: true,
          builder: (context, params) => const ProfileUserPublicWidget(),
        ),
        FFRoute(
          name: 'OrganizationEdit',
          path: '/organizationEdit',
          requireAuth: true,
          builder: (context, params) => OrganizationEditWidget(
            orgRef: params.getParam(
              'orgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrganizationPrEdit',
          path: '/organizationPrEdit',
          requireAuth: true,
          builder: (context, params) => OrganizationPrEditWidget(
            orgRef: params.getParam(
              'orgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrganizationMemberEdit',
          path: '/organizationMemberEdit',
          requireAuth: true,
          builder: (context, params) => OrganizationMemberEditWidget(
            orgRef: params.getParam(
              'orgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'PrListEdit',
          path: '/prListEdit',
          requireAuth: true,
          builder: (context, params) => PrListEditWidget(
            listRef: params.getParam(
              'listRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PrList'],
            ),
          ),
        ),
        FFRoute(
          name: 'AdminAdd',
          path: '/adminAdd',
          requireAuth: true,
          builder: (context, params) => const AdminAddWidget(),
        ),
        FFRoute(
          name: 'AdminBan',
          path: '/adminBan',
          requireAuth: true,
          builder: (context, params) => const AdminBanWidget(),
        ),
        FFRoute(
          name: 'AdminSelectOrganizer',
          path: '/adminSelectOrganizer',
          requireAuth: true,
          builder: (context, params) => const AdminSelectOrganizerWidget(),
        ),
        FFRoute(
          name: 'EventEdit',
          path: '/eventEdit',
          requireAuth: true,
          asyncParams: {
            'eventRef': getDoc(['Event'], EventRecord.fromSnapshot),
          },
          builder: (context, params) => EventEditWidget(
            eventRef: params.getParam(
              'eventRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'LocationCreate',
          path: '/locationCreate',
          requireAuth: true,
          builder: (context, params) => const LocationCreateWidget(),
        ),
        FFRoute(
          name: 'TagCreate',
          path: '/tagCreate',
          requireAuth: true,
          builder: (context, params) => const TagCreateWidget(),
        ),
        FFRoute(
          name: 'TagEdit',
          path: '/tagEdit',
          requireAuth: true,
          asyncParams: {
            'tagRef': getDoc(['Tag'], TagRecord.fromSnapshot),
          },
          builder: (context, params) => TagEditWidget(
            tagRef: params.getParam(
              'tagRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'LocationEdit',
          path: '/locationEdit',
          requireAuth: true,
          asyncParams: {
            'locationRef': getDoc(['Location'], LocationRecord.fromSnapshot),
          },
          builder: (context, params) => LocationEditWidget(
            locationRef: params.getParam(
              'locationRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileAdmin',
          path: '/profileAdmin',
          requireAuth: true,
          builder: (context, params) => const ProfileAdminWidget(),
        ),
        FFRoute(
          name: 'AdminAddFounder',
          path: '/adminAddFounder',
          requireAuth: true,
          builder: (context, params) => const AdminAddFounderWidget(),
        ),
        FFRoute(
          name: 'AdminSelectLocation',
          path: '/adminSelectLocation',
          requireAuth: true,
          builder: (context, params) => const AdminSelectLocationWidget(),
        ),
        FFRoute(
          name: 'HomeLocationPage',
          path: '/HomeLocationPage',
          requireAuth: true,
          builder: (context, params) => const HomeLocationPageWidget(),
        ),
        FFRoute(
          name: 'OrganizerAdd',
          path: '/organizerAdd',
          requireAuth: true,
          builder: (context, params) => const OrganizerAddWidget(),
        ),
        FFRoute(
          name: 'AdminSelectTag',
          path: '/adminSelectTag',
          requireAuth: true,
          builder: (context, params) => const AdminSelectTagWidget(),
        ),
        FFRoute(
          name: 'SelectorPage',
          path: '/SelectorPage',
          builder: (context, params) => SelectorPageWidget(
            organizationReference: params.getParam(
              'organizationReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'PrPage',
          path: '/PrPage',
          builder: (context, params) => PrPageWidget(
            organizationReference: params.getParam(
              'organizationReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'EventPage',
          path: '/eventPage',
          builder: (context, params) => EventPageWidget(
            eventId: params.getParam(
              'eventId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Event'],
            ),
            list: params.getParam(
              'list',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PrList'],
            ),
            table: params.getParam(
              'table',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Tables'],
            ),
            ticketTable: params.getParam(
              'ticketTable',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Ticket'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrganizerSelectEvent',
          path: '/organizerSelectEvent',
          requireAuth: true,
          builder: (context, params) => OrganizerSelectEventWidget(
            orgRef: params.getParam(
              'orgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        ),
        FFRoute(
          name: 'analytichs',
          path: '/analytichs',
          builder: (context, params) => AnalytichsWidget(
            orgRef: params.getParam(
              'orgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
            prList: params.getParam(
              'prList',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PrList'],
            ),
          ),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'ProfileGod',
          path: '/profileGod',
          requireAuth: true,
          builder: (context, params) => const ProfileGodWidget(),
        ),
        FFRoute(
          name: 'GodSelectUser',
          path: '/godSelectUser',
          requireAuth: true,
          builder: (context, params) => const GodSelectUserWidget(),
        ),
        FFRoute(
          name: 'PrSelectList',
          path: '/prSelectList',
          requireAuth: true,
          builder: (context, params) => const PrSelectListWidget(),
        ),
        FFRoute(
          name: 'OrganizerEditList',
          path: '/OrganizerEditList',
          requireAuth: true,
          builder: (context, params) => OrganizerEditListWidget(
            refPrList: params.getParam(
              'refPrList',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PrList'],
            ),
          ),
        ),
        FFRoute(
          name: 'OrganizarSelectList',
          path: '/organizarSelectList',
          requireAuth: true,
          builder: (context, params) => const OrganizarSelectListWidget(),
        ),
        FFRoute(
          name: 'manageticket',
          path: '/manageticket',
          builder: (context, params) => ManageticketWidget(
            eventRef: params.getParam(
              'eventRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Event'],
            ),
          ),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => const SearchPageWidget(),
        ),
        FFRoute(
          name: 'LocationPage',
          path: '/locationPage',
          builder: (context, params) => LocationPageWidget(
            locationRef: params.getParam(
              'locationRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Location'],
            ),
          ),
        ),
        FFRoute(
          name: 'tagPage',
          path: '/tagPage',
          asyncParams: {
            'tagSelected': getDoc(['Tag'], TagRecord.fromSnapshot),
          },
          builder: (context, params) => TagPageWidget(
            tagSelected: params.getParam(
              'tagSelected',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'NotificationPage',
          path: '/notificationPage',
          builder: (context, params) => const NotificationPageWidget(),
        ),
        FFRoute(
          name: 'feedback',
          path: '/feedback',
          builder: (context, params) => const FeedbackWidget(),
        ),
        FFRoute(
          name: 'OrganizationPage',
          path: '/OrganizationPageCopy',
          builder: (context, params) => OrganizationPageWidget(
            organizationReference: params.getParam(
              'organizationReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Organization'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/enterPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingCube(
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
