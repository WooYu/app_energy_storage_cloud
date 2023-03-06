import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_energy_storage_cloud/app.dart';
import 'package:app_energy_storage_cloud/env/config_wrapper.dart';
import 'package:app_energy_storage_cloud/env/env_config.dart';
import 'package:app_energy_storage_cloud/page/error_page.dart';

import 'env/dev.dart';

void main() {
  ///屏幕刷新率和显示率不一致时的优化
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);

      ///此处仅为展示，正规的实现方式参考 _defaultErrorWidgetBuilder 通过自定义 RenderErrorBox 实现
      return ErrorPage("${details.exception}\n ${details.stack}", details);
    };
    runApp(ConfigWrapper(
      child: FlutterReduxApp(),
      config: EnvConfig.fromJson(config),
    ));
    GestureBinding.instance.resamplingEnabled = true;
  }, (Object obj, StackTrace stack) {
    ///do not thing
  });
}
