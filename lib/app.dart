import 'package:aurastate/core/responsive/responsive_config.dart';
import 'package:aurastate/core/routes/router.dart';
import 'package:flutter/material.dart';

class AuraState extends StatelessWidget {
  const AuraState({super.key});
  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    return MaterialApp.router(
      routerConfig: AppRouter.approuter,
      title: 'AuraState',
    );
  }
}
