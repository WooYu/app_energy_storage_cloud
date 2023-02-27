import 'package:flutter/material.dart';
import 'package:app_energy_storage_cloud/common/localization/default_localizations.dart';
import 'package:app_energy_storage_cloud/model/Event.dart';
import 'package:app_energy_storage_cloud/common/style/gsy_style.dart';
import 'package:app_energy_storage_cloud/common/utils/common_utils.dart';
import 'package:app_energy_storage_cloud/common/utils/event_utils.dart';
import 'package:app_energy_storage_cloud/common/utils/navigator_utils.dart';
import 'package:app_energy_storage_cloud/widget/gsy_card_item.dart';

/**
 * 事件Item
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class GSYEventItem extends StatelessWidget {
  final EventViewModel eventViewModel;

  final VoidCallback? onPressed;

  final bool needImage;

  GSYEventItem(this.eventViewModel, {this.onPressed, this.needImage = true})
      : super();

  @override
  Widget build(BuildContext context) {
    Widget des = (eventViewModel.actionDes == null ||
            eventViewModel.actionDes!.length == 0)
        ? new Container()
        : new Container(
            child: new Text(
              eventViewModel.actionDes!,
              style: GSYConstant.smallSubText,
              maxLines: 3,
            ),
            margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
            alignment: Alignment.topLeft);

    return new Container(
      child: new GSYCardItem(
          child: new TextButton(
              onPressed: onPressed,
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text(eventViewModel.actionUser!,
                                style: GSYConstant.smallTextBold)),
                        new Text(eventViewModel.actionTime,
                            style: GSYConstant.smallSubText),
                      ],
                    ),
                    new Container(
                        child: new Text(eventViewModel.actionTarget!,
                            style: GSYConstant.smallTextBold),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    des,
                  ],
                ),
              ))),
    );
  }
}

class EventViewModel {
  String? actionUser;
  String? actionUserPic;
  String? actionDes;
  late String actionTime;
  String? actionTarget;

  EventViewModel.fromEventMap(Event event) {
    // actionTime = CommonUtils.getNewsTimeStr(event.createdAt!);
    // actionUser = event.actor!.login;
    // actionUserPic = event.actor!.avatar_url;
    // var other = EventUtils.getActionAndDes(event);
    // actionDes = other["des"];
    // actionTarget = other["actionStr"];
  }
}
