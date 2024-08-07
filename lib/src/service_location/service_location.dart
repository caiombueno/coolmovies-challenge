import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_location.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async =>
    await serviceLocator.init(environment: Environment.prod);
