import 'package:flutter/material.dart';
import 'package:ios_willpop_transition_theme/ios_willpop_transition_theme.dart';

/// WillPopPageRoute
class WillPopPageRoute<T> extends PageRoute<T> {
  WillPopPageRoute({
    required this.builder,
    this.maintainState = true,
    this.pageTransitionDuration = const Duration(milliseconds: 300),
    this.pageBarrierColor,
    this.pageBarrierLabel,
    this.transitionsBuilder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog) {
    assert(opaque);
  }

  final WidgetBuilder builder;

  final Duration pageTransitionDuration;

  final Color? pageBarrierColor;

  final String? pageBarrierLabel;

  final RouteTransitionsBuilder? transitionsBuilder;

  @override
  Color? get barrierColor => pageBarrierColor;

  @override
  String? get barrierLabel => pageBarrierLabel;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return transitionsBuilder?.call(
          context,
          animation,
          secondaryAnimation,
          child,
        ) ??
        IOSWillPopTransitionsMixin.buildPageTransitions<T>(
          this,
          context,
          animation,
          secondaryAnimation,
          child,
        );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  final bool maintainState;

  @override
  Duration get transitionDuration => pageTransitionDuration;
}
