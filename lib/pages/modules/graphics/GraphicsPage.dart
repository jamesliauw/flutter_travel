import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/redux/actions/ActionGlobal.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';

/// 摄影
class GraphicsPage extends StatefulWidget {
  final Widget child;

  GraphicsPage({Key key, this.child}) : super(key: key);

  _GraphicsPageState createState() => _GraphicsPageState();
}

/// 摄影状态
class _GraphicsPageState extends State<GraphicsPage> {

	List<String> bgList = [
	'assets/road.jpg',
	'assets/bg1.jpg',
	'assets/bg2.jpg'
	];

  @override
  Widget build(BuildContext context) {
	return Scaffold(
		body: Container(
			// 背景装饰图片
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage(this.buildRandomBackground()),
					fit: BoxFit.cover,
				),
			),
			child: Container(
				// 背景图片上的渐变效果
				decoration: BoxDecoration(
					gradient: LinearGradient(
					begin: Alignment.topCenter,
					end: Alignment.bottomCenter,
					stops: [0.0, 0.5, 0.65, 0.9],
					colors: [
						Colors.white.withOpacity(0.0),
						Colors.white.withOpacity(0.25),
						Colors.white.withOpacity(0.95),
						Colors.white,
					],
					)
				),
				child: ListView(
					children: <Widget>[
						// 页面列表内容
						this.buildTopChildren(),
					],
				),
			),
		),
	);
  }

  /// 随机背景
  String buildRandomBackground() {
	int min = 0;
	int max = 3;
	int selection = min + (Random().nextInt(max-min));

	return this.bgList[selection];
  }

  /// 顶部内容
  Widget buildTopChildren() {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(15.0, 150.0, 15.0, 0.0),
		  child: Container(
			  decoration: BoxDecoration(
				  border: Border.all(
					  color: Color(0xFFFFFFFF), width: 0.5
				  ),
				  color: Color(0xFFFFFFFF),
				  shape: BoxShape.rectangle,
				  borderRadius: BorderRadius.circular(20.0),
			  ),
			  child: Column(
				children: <Widget>[

					// 第1行
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 35.0, 25.0, 15.0),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Container(
									decoration: BoxDecoration(
										border: Border.all(color: Color(0xFF86b9e0), width: 0.0),
										color: Color(0xFF86b9e0).withOpacity(0.3),
										shape: BoxShape.rectangle,
										borderRadius: BorderRadius.circular(15.0)
									),
									child: Padding(
										padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
										child: Column(
											children: <Widget>[
												Text('03', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(0xFF2f93e0), fontFamily: 'Montserrat')),
												Text('Mar', style: TextStyle(fontSize: 13.0, color: Colors.black, fontFamily: 'Montserrat')),
											],
										),
									),
								),
								SizedBox(width: 10.0),
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										Container(
											width: 150,
											child: Text(
												'Chichen Itza',
												overflow: TextOverflow.ellipsis,
												softWrap: true,
												style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Montserrat')
											)
										),
										Text('Mexico', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.blueGrey, fontFamily: 'Montserrat')),
									],
								),
								Spacer(),
								Container(
									width: 45.0,
									height: 45.0,
									decoration: BoxDecoration(
										image: DecorationImage(
											image: AssetImage('assets/arrow.png'),
											fit: BoxFit.cover,
										),
										borderRadius: BorderRadius.circular(50.0),
									),
								)
							],
						),
					),

					// 第二行
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 15.0, 25.0, 10.0),
						child: Row(
							children: <Widget>[
								this.buildRoundItemImage('assets/beach3.jpg'),
								SizedBox(width: 10.0),
								this.buildRoundItemImage('assets/beach2.jpg'),
								SizedBox(width: 10.0),
								this.buildRoundBlurImage('assets/beach1.jpg'),
							],
						),
					),

					// 第三行
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 0.0),
						child: Text(
							'UNESCO World heritage site inscription 1988',
							textAlign: TextAlign.left,
							style: TextStyle(fontSize: 13.0, color: Colors.black, fontFamily: 'Montserrat'),
							overflow: TextOverflow.ellipsis,
							softWrap: true,
							maxLines: 2,
						),
					),

					// 第四行
					Padding(
						padding: EdgeInsets.fromLTRB(27.0, 35.0, 20.0, 15.0),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.start,
							children: <Widget>[
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								Icon(Icons.star, color: Colors.yellow, size: 15.0),
								SizedBox(width: 6.0),
								Text('4.6', style: TextStyle(fontSize: 15.0, color: Colors.red, fontWeight: FontWeight.bold)),
								SizedBox(width: 10.0),
								Text('1455 critics reviews', style: TextStyle(fontSize: 12.0, color: Colors.black)),
							],
						),
					),

					// 第五行
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 0.0, 35.0, 0.0),
						child: Row(
							children: <Widget>[
								this.buildAvataImage('assets/chris.jpg'),
								SizedBox(width: 10.0),
								this.buildAvataImage('assets/p2.jpg'),
								SizedBox(width: 10.0),
								Container(
									width: 50.0,
									height: 20.0,
									decoration: BoxDecoration(
										color: Colors.grey.withOpacity(0.3),
										shape: BoxShape.rectangle,
										borderRadius: BorderRadius.circular(20.0)
									),
									child: Center(
										child: Text('+134', style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.bold))
									),
								),
								SizedBox(width: 10.0),
								Text('Liked this', style: TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(0.5))),
							],
						),
					),

					// 装饰圆角
					Container(
						width: MediaQuery.of(context).size.width - 30.0,
						height: 30.0,
						decoration: BoxDecoration(
							color: Color(0xFFFFFFFF),
							shape: BoxShape.rectangle,
							// 只有顶部圆角效果，底部无圆角效果
							borderRadius: BorderRadius.only(
								topLeft: Radius.circular(20.0),
								topRight: Radius.circular(20.0),
								bottomLeft: Radius.circular(0.0),
								bottomRight: Radius.circular(0.0),
							),
							boxShadow: [
								BoxShadow(
									color: Colors.black.withOpacity(0.1),
									blurRadius: 3.0,
									spreadRadius: 0.0,
									offset: Offset(0.0, 2.5),
								)
							]
						)
					),

					// 底部内容
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 20.0),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Text(
									'Our heritage itza',
									style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')
								),
								SizedBox(height: 10.0),
								Text(
									'Chichen Itza archaeological site in the Mexicon tate of Yucatrain.The building is more formally de add favorite logist, All I need is my text to be multi-line. Am giving the property of maxLines but its still getting RenderFlex overflowed error to the right as the next is not going to 2nd line',
									maxLines: 7,
									style: TextStyle(fontSize: 12.0, color: Colors.grey)
								),
								SizedBox(height: 25.0),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: <Widget>[
										this.buildFavoriteButtonAction(),
										this.buildBuyButtonAction(),
									]
								),
							],
						),
					)
				],
			 ),
		  ),
	  );
  }

	/// 包装收藏点击按钮
	Widget buildFavoriteButtonAction() {
		return StoreConnector<StateGlobal, VoidCallback>(
			converter: (store) {
				return () => store.dispatch(ActionGlobal.decrement);
			},
			builder: (context, callback) {
				return InkWell(
					child: this.buildFavoriteButton('Add favorite', Colors.white, Colors.black),
					onTap: callback,
				);
			},
		);
	}

	/// 包装购买点击按钮
	Widget buildBuyButtonAction() {
		return StoreConnector<StateGlobal, VoidCallback>(
			converter: (store) {
				return () => store.dispatch(ActionGlobal.increment);
			},
			builder: (context, callback) {
				return InkWell(
					child: this.buildFavoriteButton('Buy tickets', Colors.deepPurple, Colors.white),
					onTap: callback,
				);
			},
		);
	}

  /// 构建圆形按钮
  Widget buildFavoriteButton(String textLabel, Color colorContent, Color colorText) {
	  return Container(
		width: 110,
		height: 45,
		decoration: BoxDecoration(
			color: colorContent,
			shape: BoxShape.rectangle,
			borderRadius: BorderRadius.circular(50.0),
			boxShadow: [
			BoxShadow(
				color: Colors.black.withOpacity(0.3),
				blurRadius: 3.0,
				spreadRadius: 5.0,
				offset: Offset(0.0, 5.0)
			)
			]
		),
		child: Center(
			child: Text(
				textLabel,
				style: TextStyle(fontSize: 12.0, color: colorText, fontFamily: 'Montserrat')
			)
		),
	);
  }

  /// 构建圆形图片
  Widget buildAvataImage(String imageUrl) {
	  return Container(
		  width: 40.0,
		  height: 40.0,
		  decoration: BoxDecoration(
			  image: DecorationImage(
				  image: AssetImage(imageUrl),
				  fit: BoxFit.cover
			  ),
			  borderRadius: BorderRadius.circular(50.0),
			  border:Border.all(width: 1.0, color: Colors.grey.withOpacity(0.5))
		  ),
	  );
  }

  /// 构建圆角图片项
  Widget buildRoundItemImage(String imageUrl) {
	  return Container(
		  width: 80.0,
		  height: 80.0,
		  decoration: BoxDecoration(
			  image: DecorationImage(
				  image: AssetImage(imageUrl),
				  fit: BoxFit.cover
			  ),
			  borderRadius: BorderRadius.circular(10.0)
		  ),
	  );
  }

  /// 构建圆角模糊图片项
  /// * [String imageUrl] 图片地址
  Widget buildRoundBlurImage(String imageUrl) {
	  return Container(
			width: 80.0,
			height: 80.0,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: ExactAssetImage(imageUrl),
					fit: BoxFit.cover,
				),
				borderRadius: BorderRadius.circular(10.0)
			),
			child: BackdropFilter(
				filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
				child: Container(
					decoration: BoxDecoration(
						color: Colors.white.withOpacity(0.0),
						borderRadius: BorderRadius.circular(10.0),
					),
					child: Center(
						child: StoreConnector<StateGlobal, int>(
							converter: (store) => store.state.count,
							builder: (context, count) {
								return Text('+${count.toString()}', style: TextStyle(fontSize: 25.0, color: Colors.white));
							}
						),
					),
				),
			),
		);
  }
}