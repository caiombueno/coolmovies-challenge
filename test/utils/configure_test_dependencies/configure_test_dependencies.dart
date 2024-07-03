import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'configure_test_dependencies.config.dart';

final testServiceLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'testInit',
  preferRelativeImports: true,
  generateForDir: ['test', 'lib'],
)
void configureTestDependencies() =>
    testServiceLocator.testInit(environment: Environment.test);
