import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/pages/modules/search/views/ViewSearchContentView.dart';

/// 搜索页
class SearchPage extends StatefulWidget {
  final Widget child;

  SearchPage({Key key, this.child}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with CommonNavigator {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			title: Center(
			child: Text('SIENCE TECHNOLOGY',
				style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 20.0
				)
			),
			),
			elevation: 0.0,
			backgroundColor: Colors.white
		),
		body: BlocProvider(
			bloc: BlocNewsList(),
			child: ViewSearchContentView(),
		),
	);
  }

}
