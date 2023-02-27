import 'package:flutter/material.dart';
import 'package:app_energy_storage_cloud/common/localization/default_localizations.dart';
import 'package:app_energy_storage_cloud/common/net/interceptors/log_interceptor.dart';
import 'package:app_energy_storage_cloud/common/style/gsy_style.dart';
import 'package:app_energy_storage_cloud/common/utils/common_utils.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  static List<Map<String, dynamic>?> sErrorStack = [];
  static List<String?> sErrorName = [];

  final TextEditingController textEditingController =
      new TextEditingController();

  addError(FlutterErrorDetails details) {
    try {
      var map = Map<String, dynamic>();
      map["error"] = details.toString();
      LogsInterceptors.addLogic(
          sErrorName, details.exception.runtimeType.toString());
      LogsInterceptors.addLogic(sErrorStack, map);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return Container(
      color: GSYColors.primaryValue,
      child: new Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: width,
          decoration: new BoxDecoration(
            color: Colors.white.withAlpha(30),
            gradient:
                RadialGradient(tileMode: TileMode.mirror, radius: 0.1, colors: [
              Colors.white.withAlpha(10),
              GSYColors.primaryValue.withAlpha(100),
            ]),
            borderRadius: BorderRadius.all(Radius.circular(width / 2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image(
                  image: new AssetImage(GSYICons.DEFAULT_USER_ICON),
                  width: 90.0,
                  height: 90.0),
              new SizedBox(
                height: 11,
              ),
              Material(
                child: new Text(
                  "Error Occur",
                  style: new TextStyle(fontSize: 24, color: Colors.white),
                ),
                color: GSYColors.primaryValue,
              ),
              new SizedBox(
                height: 40,
              ),
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: GSYColors.white.withAlpha(100),
                    ),
                    onPressed: () {},
                    child: Text("Report"),
                  ),
                  new SizedBox(
                    width: 40,
                  ),
                  new TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withAlpha(100)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Back")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
