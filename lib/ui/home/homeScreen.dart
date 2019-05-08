import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/ui/basic/baseWidget.dart';
import 'package:share_your_christmas/utils/uiUtil.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';
import 'package:share_your_christmas/ui/home/homeModel.dart';

class HomeScreen extends BaseWidget {
  static final routeName = "/HomeScreen";

  final void Function() onInit;

  HomeScreen(Store<MyAppState> store, Function() onInit) : onInit = onInit;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseState<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    return makeParent(StoreConnector<MyAppState, HomeModel>(
      converter: (Store<MyAppState> store) =>
          HomeModel.fromStore(store, context),
      builder: (context, vm) {
        return Scaffold(
          body: Container(
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                    children: <Widget>[
                      GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        color: Colors.red,
                        padding: EdgeInsets.only(
                            left:
                                ScreenUtil.getInstance().getWidthPercent(0.04),
                            top:
                                ScreenUtil.getInstance().getWidthPercent(0.04)),
                        iconSize: ScreenUtil.getInstance().getWidthPercent(0.1),
                      ),
                    ],
                  ),
            ),
          ),
          drawer: Drawer(
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text(vm.userProfile.userData.username),
                      accountEmail: Text(vm.userProfile.userData.email),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? Colors.blue
                                : Colors.white,
                        child: Text(
                          "A",
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Ttem 1"),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text("Item 2"),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: ListTile(
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app),
                    onTap: () {
                      vm.onLogout(context);
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.gif),
          ),
        );
      },
    ));
  }
}
