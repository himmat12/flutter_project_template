import 'package:flutter/material.dart';
import 'package:toppicks/src/controllers/base_controller.dart';

class WidgetBuilderHelper extends StatelessWidget {
  final Widget builder;
  final Widget loadingBuilder;
  final Widget errorBuilder;
  final VIEWSTATE state;

  const WidgetBuilderHelper({
    Key? key,
    required this.state,
    required this.loadingBuilder,
    required this.errorBuilder,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case VIEWSTATE.loading:
        return loadingBuilder;
      case VIEWSTATE.error:
        return errorBuilder;
      case VIEWSTATE.retrived:
      default:
        return builder;
    }
  }
}
