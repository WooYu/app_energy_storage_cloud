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
        return Material(
          child: new Container(
            color: GSYColors.white,
            constraints: BoxConstraints(
                maxWidth: double.infinity, maxHeight: double.infinity),
            child: new ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: double.infinity, maxWidth: double.infinity),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  //图片
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Image(
                        image: AssetImage("static/images/ic_logo_pager.png")),
                  ),

                  //欢迎标语
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  GSYLocalizations.i18n(context)!.welcomeTitleA,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: GSYColors.textBlack,
                                      fontSize: 18)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  GSYLocalizations.i18n(context)!.welcomeTitleB,
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 15)),
                            ),
                          ],
                        ),
                      )),

                  //注册、登录
                  Container(
                    color: GSYColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          //注册
                          Container(
                            margin: EdgeInsets.only(left: 10.0, right: 10),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                onPressed: () {},
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: GSYColors.primaryValue,
                                  ),
                                  child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minWidth: double.infinity),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                            GSYLocalizations.i18n(context)!
                                                .welcomeBtnRegister,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: GSYColors.white,
                                                fontSize: 15)),
                                      )),
                                )),
                          ),

                          //登录
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                onPressed: () {},
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: GSYColors.primaryValue,
                                  ),
                                  child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minWidth: double.infinity),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                            GSYLocalizations.i18n(context)!
                                                .welcomeBtnLogin,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: GSYColors.white,
                                                fontSize: 15)),
                                      )),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
