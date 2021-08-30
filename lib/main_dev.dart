import 'package:flutter/material.dart';

import 'package:learn_brinvestyuk/app_config.dart';
import 'package:learn_brinvestyuk/constant/variable.dart' as Const;
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/main.dart';
import 'package:learn_brinvestyuk/services/api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageManagement().init();

  await Api().init(Const.dev);

  var configuredApp = AppConfig(
    appTitle: Const.appDev,
    buildFlavor: Const.dev,
    child: MyApp(),
  );

  runApp(configuredApp);
}
