import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/pages/common/CommonGalleryItem.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';
import 'package:flutter_travel/services/ServiceJsonPlaceHolder.dart';
import '../../common/CommonTravelItem.dart';

/// 搜索页
class SearchPage extends StatefulWidget {
  final Widget child;

  SearchPage({Key key, this.child}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with CommonTravelItem {
  bool get wantKeepAlive => null;
  ServiceJsonPlaceHolder serviceJsonPlaceHolder;

  _SearchPageState() {
	  this.serviceJsonPlaceHolder = new ServiceJsonPlaceHolder();
  }

  @override
  void initState() {
	super.initState();
	// 调用数据
	this.serviceJsonPlaceHolder.getPostsData().then((onValue) {
		print(onValue.data);
	});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: this.getSearchTitle(),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          // leading: IconButton(
          // 	tooltip: 'Search Page',
          // 	icon: Icon(Icons.arrow_back_ios),
          // 	color: Colors.grey,
          // 	onPressed: () {
          // 		// hole
          // 	},
          // ),
          // actions: <Widget>[
          // 	IconButton(
          // 		color: Colors.grey,
          // 		icon: Icon(Icons.menu),
          // 		tooltip: 'Settings',
          // 		onPressed: () {
          // 			// hole
          // 		},
          // 	)
          // ],
        ),
        body: this.buildSearchLayout());
  }

  /// 绑定动态标题
  Widget getSearchTitle() {
    return StoreConnector<StateGlobal, int>(
        converter: (store) => store.state.count,
        builder: (context, count) {
          return Text('Maldives - 12 Days ${count.toString()}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0));
        });
  }

  /// 基础页面结构
  Widget buildSearchLayout() {
    List<CommonGalleryItem> list1 = [
      CommonGalleryItem(
          id: 0.toString(), image: 'assets/p1.jpg', description: 'Sun Bath'),
      CommonGalleryItem(
          id: 1.toString(),
          image: 'assets/beach5.jpg',
          description: 'Blue oceans'),
      CommonGalleryItem(
          id: 2.toString(),
          image: 'assets/p2.jpg',
          description: 'Mihiri Island.'),
    ];

    List<CommonGalleryItem> list2 = [
      CommonGalleryItem(
          id: 0.toString(),
          image: 'assets/p3.jpg',
          description: 'The Sun Raise'),
      CommonGalleryItem(
          id: 1.toString(),
          image: 'assets/p5.jpg',
          description: 'Tiland buject'),
      CommonGalleryItem(
          id: 2.toString(),
          image: 'assets/p6.jpg',
          description: 'Beach Baros.'),
    ];

    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            this.buildMarkTitle(),
            this.buildStartIcon(),
            this.buildTravelDate('Aug 12, 2012 - Baros Island'),
            this.buildTravelSep(),
            this.buildImageGrid(context, list1, paddingTop: 0.0),
            this.buildImgGalleryDetail(
                context, 'Day 1- Sun Bath', 'Teresa Soto', ''),
            SizedBox(height: 45.0),
            this.buildTravelDate('Aug 13, 2012 - Mihiri Island'),
            this.buildTravelSep(),
            this.buildImageGrid(context, list2, paddingTop: 0.0),
            this.buildImgGalleryDetail(
                context, 'Day 2- Sun Raise', 'Tiland buject', ''),
          ],
        ));
  }

  /// 顶部标题
  Widget buildMarkTitle() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Mark, 4 Others',
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 17.0, color: Colors.black.withOpacity(0.7)),
        ));
  }

  /// 构建START图标
  Widget buildStartIcon() {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Image.asset('assets/start.png', width: 150.0, height: 150.0),
    );
  }

  /// 旅行日志时间
  Widget buildTravelDate(String travelTitle) {
    return Text(travelTitle,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black.withOpacity(0.8)));
  }

  /// 旅行日志分隔
  Widget buildTravelSep() {
    return Image.asset('assets/dot.png', width: 10.0, height: 80.0);
  }
}
