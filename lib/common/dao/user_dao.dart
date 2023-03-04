import 'dart:convert';
import 'package:app_energy_storage_cloud/common/dao/dao_result.dart';
import 'package:app_energy_storage_cloud/common/net/address.dart';
import 'package:app_energy_storage_cloud/common/net/api.dart';
import 'package:app_energy_storage_cloud/model/user/User.dart';
import 'package:app_energy_storage_cloud/redux/user_redux.dart';
import 'package:redux/redux.dart';
import 'package:app_energy_storage_cloud/redux/gsy_state.dart';
import 'package:app_energy_storage_cloud/common/local/local_storage.dart';
import 'package:app_energy_storage_cloud/common/config/config.dart';

class UserDao {
  ///初始化用户信息
  static initUserInfo(Store<GSYState> store) async {
    var token = await LocalStorage.get(Config.TOKEN_KEY);
    var res = await getUserInfoLocal();
    if (res != null && res.result && token != null) {
      store.dispatch(UpdateUserAction(res.data));
    }
  }

  ///获取本地登录用户信息
  static getUserInfoLocal() async {
    var userText = await LocalStorage.get(Config.USER_INFO);
    if (userText != null) {
      var userMap = json.decode(userText);
      User user = User.fromJson(userMap);
      return new DataResult(user, true);
    } else {
      return new DataResult(null, false);
    }
  }

  ///获取用户详细信息
  static getUserInfo(userName, {needDb = false}) async {
    // UserInfoDbProvider provider = new UserInfoDbProvider();
    next() async {
      var res;
      if (userName == null) {
        res = await httpManager.netFetch(
            Address.getMyUserInfo(), null, null, null);
      } else {
        res = await httpManager.netFetch(
            Address.getUserInfo(userName), null, null, null);
      }
      if (res != null && res.result) {
        User user = User.fromJson(res.data);
        if (userName == null) {
          LocalStorage.save(Config.USER_INFO, json.encode(user.toJson()));
        } else {
          // if (needDb) {
          //   provider.insert(userName, json.encode(user.toJson()));
          // }
        }
        return new DataResult(user, true);
      } else {
        return new DataResult(res.data, false);
      }
    }

    return await next();
  }
}
