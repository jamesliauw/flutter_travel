import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CirclerSearchContent.dart';
import 'package:flutter_travel/pages/modules/graphics/blocs/GraphicsBlocMyInfo.dart';

/// 搜索结果页
class CircleSearchResultPage extends StatefulWidget {

	final String searchContent;

	CircleSearchResultPage({Key key, this.searchContent}) : super(key: key);

  	_CircleSearchResultPageState createState() => _CircleSearchResultPageState(this.searchContent);
}

class _CircleSearchResultPageState extends State<CircleSearchResultPage> {

	String _searchContent;

	_CircleSearchResultPageState(String searchContent): super() {
		this._searchContent = searchContent;
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
					child: Text('Search Result', style: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.bold,
						fontSize: 20.0
					))
				),
				elevation: 0.0,
				centerTitle: true,
				backgroundColor: Color(0xffebeff8),
			),
			body: BlocProvider(
				bloc: GraphicsBlocMyInfo(),
				child: CirclerSearchContent(searchContent: this._searchContent),
			),
		);
	}
}