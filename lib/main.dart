import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_code/test_code.dart';

import 'core/Services/shared_preference/shared_preference_helper.dart';
import 'core/app/abb_bloc_observer.dart';
import 'core/app/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper().instantiatePreferences();
  await setupInjector();
  Bloc.observer = MyBlocObserver();
  runApp(const TestCode());
}



