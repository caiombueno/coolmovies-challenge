import 'dart:developer';
import 'dart:ui';
import 'package:coolmovies/src/app/app.dart';
import 'package:coolmovies/src/app/app_bloc_observer.dart';
import 'package:coolmovies/src/service_location/service_location.dart' as sl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.configureDependencies();

  Bloc.observer = AppBlocObserver();

  // https://docs.flutter.dev/testing/errors
  registerErrorHandlers();
  runApp(const App());
}

void registerErrorHandlers() {
  // Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  // Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    log(error.toString(), stackTrace: stack, error: error);
    return true;
  };
  // Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
