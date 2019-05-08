//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:redux/redux.dart';
//
//import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
//import 'package:redux_dev_tools/redux_dev_tools.dart';
//
//import 'package:tooniesfluttere/model/newAppState.dart';
//import 'package:tooniesfluttere/data/redux/action.dart';
//import 'package:tooniesfluttere/data/redux/reducer.dart';
//import 'package:tooniesfluttere/data/redux/login/authMiddleware.dart';
//import 'package:tooniesfluttere/ui/home/homeScreen.dart';
//
//void main() {
//  SystemChrome.setEnabledSystemUIOverlays([]);
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
////
//    final DevToolsStore<NewAppState> store = DevToolsStore<AppState>(
//        appStateReducer,
//        initialState: AppState.initialState(),
//        middleware: appStateMiddleware());
//
//    return StoreProvider<AppState>(
//      store: store,
//      child: MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: StoreBuilder<AppState>(
//            onInit: (store) => store.dispatch(GetItemsAction()),
//            builder: (BuildContext context, Store<AppState> store) =>
//                HomeScreen()),
//      ),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  final DevToolsStore<AppState> store;
//
//  MyHomePage(this.store);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Redux Item"),
//      ),
//      body: StoreConnector<AppState, _ViewModel>(
//        converter: (Store<AppState> store) => _ViewModel.create(store),
//        builder: (BuildContext context, _ViewModel viewModel) => Column(
//          children: <Widget>[
//            AddItemWidget(viewModel),
//            Expanded(
//              child: ItemListWidget(viewModel),
//            ),
//            RemoveItemsButton(viewModel)
//          ],
//        ),
//      ),
//      drawer: Container(
//        child: ReduxDevTools(store),
//      ),
//    );
//  }
//}
//
//class RemoveItemsButton extends StatelessWidget {
//  final _ViewModel model;
//
//  RemoveItemsButton(this.model);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return RaisedButton(
//      child: Text('Delete all items'),
//      onPressed: () => model.onRemoveItems(),
//    );
//  }
//}
//
//class ItemListWidget extends StatelessWidget {
//  final _ViewModel model;
//
//  ItemListWidget(this.model);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ListView(
//      children: model.items
//          .map((Item item) => ListTile(
//        title: Text(item.body),
//        leading: IconButton(
//            icon: Icon(Icons.delete),
//            onPressed: () => model.onRemoveItem(item)),
//        trailing: Checkbox(
//            value: item.completed,
//            onChanged: (b) => model.onItemCompleted(item)),
//      ))
//          .toList(),
//    );
//  }
//}
//
//class AddItemWidget extends StatefulWidget {
//  final _ViewModel model;
//
//  AddItemWidget(this.model);
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _AddItemState();
//  }
//}
//
//class _AddItemState extends State<AddItemWidget> {
//  final TextEditingController controller = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return TextField(
//      controller: controller,
//      decoration: InputDecoration(hintText: 'add an Item'),
//      onSubmitted: (String s) {
//        widget.model.onAddItem(s);
//        controller.text = '';
//      },
//    );
//  }
//}
//
//class _ViewModel {
//  final List<Item> items;
//  final Function(String) onAddItem;
//  final Function(Item) onRemoveItem;
//  final Function() onRemoveItems;
//  final Function(Item) onItemCompleted;
//
//  _ViewModel(
//      {this.items,
//        this.onAddItem,
//        this.onRemoveItem,
//        this.onRemoveItems,
//        this.onItemCompleted});
//
//  factory _ViewModel.create(Store<AppState> store) {
//    _onAddItem(String body) {
//      store.dispatch(AddItemAction(body));
//    }
//
//    _onRemoveItem(Item item) {
//      store.dispatch(RemoveItemAction(item));
//    }
//
//    _onRemoveItems() {
//      store.dispatch(RemoveItemsAction());
//    }
//
//    _onItemCompleted(Item item) {
//      store.dispatch(ItemCompletedAction(item));
//    }
//
//    return _ViewModel(
//        items: store.state.items,
//        onAddItem: _onAddItem,
//        onRemoveItem: _onRemoveItem,
//        onItemCompleted: _onItemCompleted,
//        onRemoveItems: _onRemoveItems);
//  }
//}
