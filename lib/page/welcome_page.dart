import 'dart:async';

import 'package:app_energy_storage_cloud/common/localization/default_localizations.dart';
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
 * 欢迎页
 */

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GSYState>(
      builder: (context, store) {
        return Flex(
          direction: Axis.vertical,
          children: <Widget>[
            //图片
            Image(image: AssetImage("images/ic_logo_pager.png")),
            //欢迎标语
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                            GSYLocalizations.i18n(context)!.welcomeTitleA)),
                    SizedBox(height: 10),
                    Text(GSYLocalizations.i18n(context)!.welcomeTitleB)
                  ],
                )),
            //注册
            SizedBox(height: 30),
            ElevatedButton(
              child: Text(GSYLocalizations.i18n(context)!.welcomeBtnRegister),
              onPressed: () {},
            ),
            //登录
            SizedBox(height: 30),
            ElevatedButton(
              child: Text(GSYLocalizations.i18n(context)!.welcomeBtnLogin),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
