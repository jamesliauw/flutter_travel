import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/discover/blocs/BlocDiscoverDetail.dart';
import 'package:flutter_travel/modules/discover/models/ModelDetail.dart';
import 'package:flutter_travel/modules/discover/views/components/CommentDiscoverCover.dart';
import 'package:flutter_travel/modules/discover/views/components/ComponentDiscoverCoverItem.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/services/ServiceApiOpen.dart';

class PageDiscoverDetail extends StatefulWidget {
	final Widget child;
	final ModelNewsItem item;

	PageDiscoverDetail({Key key, this.child, this.item}) : super(key: key);

	_PageDiscoverDetailState createState() => _PageDiscoverDetailState();
}

/// 详情页
class _PageDiscoverDetailState extends State<PageDiscoverDetail> with CommonNavigator, CommonTimeFormate {

	ServiceApiOpen serviceApiOpen;
	String coverUrl;
	ModelDiscoverDetail modelDetail;
	List<ModelContent> displayList;
	List<ModelContent> fullDisplayList;

	_PageDiscoverDetailState() {
		this.modelDetail = new ModelDiscoverDetail();
	}

	@override
	void initState() {
		super.initState();
		
		this.displayList = this.modelDetail.getDisplayList(widget.item.content, size: 4);
		this.fullDisplayList = this.modelDetail.getDisplayList(widget.item.content);

		// 设置首页
		if (displayList.length > 0) {
			this.coverUrl = displayList[0].data.small.url;
		}

	}

	@override
	Widget build(BuildContext context) {
		return BlocProvider<BlocDiscoverDetail>(
			bloc: blocDiscoverDetail,
			child: AnnotatedRegion<SystemUiOverlayStyle>(
				value: SystemUiOverlayStyle.light,
				child: Scaffold(
						appBar: PreferredSize(
							child: Offstage(
								offstage: true,
								child: AppBar(
									title: Text('test'),
									brightness: Brightness.light,
								),
							),
							preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 007),
						),
						body: this.getBody(),
				)
			),
		);
  	}
	
	/// 页面布局
	Widget getBody() {
		return Stack(
			children: [
				ListView(
					children: <Widget>[
						Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							this.buildCover(),
							this.buildTitle(widget.item.title, 'Architect'),
							this.buildScrollList(),
							// this.buildScrollTile(),
							this.buildBottomText(widget.item.abs, widget.item.ts)
						],
						)
					],
				),
				Stack(
					children: [
						Padding(
							padding: EdgeInsets.fromLTRB(15, 45, 0, 0),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text(widget.item.site, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white))
								]
							),
						),
						Padding(
							padding: EdgeInsets.fromLTRB(15, 45, 0, 0),
							child: GestureDetector(
								child: Icon(Icons.arrow_back_ios, size: 23, color: Colors.white),
								onTap: () {
									this.navigateBack(context);
								},
							),
						)
					]
				),
			]
		);
	}

	/// 底部文本
	Widget buildBottomText(String descTitle, String dateTitle) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						height: 1,
						decoration: BoxDecoration(
							color: Colors.black.withOpacity(0.3),
							shape: BoxShape.rectangle
						),
					),
					SizedBox(height: 15),
					Text(
						descTitle, 
						overflow: TextOverflow.ellipsis,
						maxLines: 4,
						style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black)
					),
					SizedBox(height: 5),
					Row(
						children: [
							Icon(Icons.brightness_4, size: 10, color: Colors.grey),
							SizedBox(width: 5),
							Text(this.getFullTime(dateTitle), style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey))
						]
					),
				]
			),
		);
	}

	/// 横向选择列表
	Widget buildScrollList() {

		List<Widget> renderList = [];
		for (var i = 0; i < this.displayList.length; i++) {
			renderList.add(this.buildCoverSlectItem(this.displayList[i], index: i));
		}

		// 更多按钮
		renderList.add(this.buildRectMore(this.fullDisplayList.length));

		return Padding(
			padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children: renderList
			)
		);
	}

	/// 横向排列图片
	Widget buildCoverSlectItem(ModelContent item, {int index}) {
		return ComponentDiscoverCoverItem(item: item, index: index);
	}

	/// 封面
	Widget buildCover() {
		return ComponentDiscoverCover(item: widget.item, coverUrl: this.coverUrl);
	}

	/// 点击添加更多
	Widget buildRectMore(int moreLength) {
		return GestureDetector(
			onTap: () {
				// 展开所有小图
			},
			child: Container(
				width: 60.0,
				height: 60.0,
				child: ClipRRect(
					borderRadius: BorderRadius.circular(8),
					child: Container(
						width: 60,
						height: 60,
						decoration: BoxDecoration(
							color: Colors.grey,
							shape: BoxShape.rectangle
						),
						child: Center(
							child: Text(
								'+${moreLength.toString()}', 
								style: TextStyle(
									fontSize: 15, 
									fontWeight: FontWeight.normal, 
									color: Colors.white
								)
							)
						),
					)
				),
			)
		);
	}

	Widget buildScrollTile() {
		return Text('');
	}

	/// 标题
	Widget buildTitle(String title, String desc) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15, 25, 10, 20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text(
						title, 
						overflow: TextOverflow.ellipsis,
						maxLines: 2,
						style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
					),
					SizedBox(height: 5),
					Text(desc, style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey)),
				],
			)
		);
	}

}
