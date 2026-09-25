import 'package:aurastate/app.dart';
import 'package:aurastate/core/services/service_locator.dart';
import 'package:aurastate/core/services/shared_prefrence.dart';
import 'package:aurastate/core/utils/app_bloc_observer.dart';
import 'package:aurastate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.instance.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  setupGetIt();
  runApp(const AuraState());
}

class SharedPrefrenceSingletone {}
