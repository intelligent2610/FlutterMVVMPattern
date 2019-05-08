import 'package:share_your_christmas/model/apiResponse.dart';
import 'package:share_your_christmas/model/config/config.dart';
import 'package:share_your_christmas/model/scan/scanModel.dart';
import 'package:share_your_christmas/model/user/userData.dart';
import 'package:share_your_christmas/data/network/myFuture.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

class DataManager {
  static DataManager instance = new DataManager();

  static DataManager getInstance() {
    return instance;
  }

  Future<APIResponse> doLogin(
      String us, String pas, bool isRemember) async {
    return await createLogin(us, pas, isRemember).then((response) => response);
  }

  Future<APIResponse> doConfig() async {
    return await getConfig().then((response) => response);
  }

  Future<APIResponse> doRegister(
      String us, String email, String pass) async {
    return await createRegister(us, email, pass).then((response) => response);
  }
}
