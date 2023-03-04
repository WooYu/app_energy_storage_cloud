import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:app_energy_storage_cloud/common/localization/default_localizations.dart';
import 'package:app_energy_storage_cloud/common/style/gsy_style.dart';
import 'package:app_energy_storage_cloud/common/utils/navigator_utils.dart';
import 'package:app_energy_storage_cloud/widget/gsy_tabbar_widget.dart';
import 'package:app_energy_storage_cloud/widget/gsy_title_bar.dart';

/**
 * 主页
 */
class HomePage extends StatefulWidget {
  static final String sName = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }

    return Future.value(false);
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(
          GSYICons.MAIN_DT, GSYLocalizations.i18n(context)!.home_dynamic),
      _renderTab(GSYICons.MAIN_QS, GSYLocalizations.i18n(context)!.home_trend),
      _renderTab(GSYICons.MAIN_MY, GSYLocalizations.i18n(context)!.home_my),
    ];

    ///增加返回按键监听
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new Container(
        color: GSYColors.white,
        child: Stack(
          children: <Widget>[
            new Center(
              child: new Image(
                  image: new AssetImage('static/images/logo_autel.png')),
            )
          ],
        ),
      ),
    );
  }
}
