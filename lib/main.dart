import 'package:aurastate/app.dart';
import 'package:aurastate/core/services/shared_prefrence.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.instance.init();
  runApp(const AuraState());
}
