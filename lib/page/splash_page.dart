import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:app_energy_storage_cloud/common/dao/user_dao.dart';
import 'package:app_energy_storage_cloud/redux/gsy_state.dart';
import 'package:app_energy_storage_cloud/common/style/gsy_style.dart';
import 'package:app_energy_storage_cloud/common/utils/navigator_utils.dart';
import 'package:app_energy_storage_cloud/widget/diff_scale_text.dart';
import 'package:app_energy_storage_cloud/widget/mole_widget.dart';
import 'package:redux/redux.dart';
import 'package:rive/rive.dart';

/**
 * 启动页
 */

class SplashPage extends StatefulWidget {
  static final String sName = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    Store<GSYState> store = StoreProvider.of(context);

    new Future.delayed(const Duration(seconds: 2), () {
      UserDao.initUserInfo(store).then((res) {
        if (res != null && res.result) {
          NavigatorUtils.goHome(context);
        } else {
          NavigatorUtils.goWelcome(context);
        }
        return true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GSYState>(
      builder: (context, store) {
        return Material(
          child: new Container(
            color: GSYColors.white,
            child: Stack(
              children: <Widget>[
                new Center(
                  child: new Image(
                    image: new AssetImage('static/images/logo_autel.png'),
                    width: 250,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
