import 'package:flutter/material.dart';

/// 持续改进提示
class CircleImproving extends StatefulWidget {
	CircleImproving({Key key}) : super(key: key);

	_CircleImprovingState createState() => _CircleImprovingState();
}

class _CircleImprovingState extends State<CircleImproving> {
	@override
	Widget build(BuildContext context) {
	return Padding(
		padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
		child: this.buidCircleIconBar('98%',
			'Keep improving!',
			Color(0xFF5474e8),
			Color(0xFFcac0f8),
			Color(0xFFfeabb5)
		)
		);
	}

	/// 构建圆角横条
	Widget buidCircleIconBar(
		String startCount, String hotelName, Color colorValue, Color colorCenter, Color shapeColor) {
		return Container(
			// RadialGridient圆形渐变效果
			decoration: BoxDecoration(
				color: colorValue,
				borderRadius: BorderRadius.circular(8.0),
				gradient: RadialGradient(
					center: Alignment(-0.9, 3),
					radius: 3.7,
					colors: [colorValue, colorCenter, shapeColor],
					stops: [0.3, 0.7, 1.5])),
			child: Padding(
				padding: EdgeInsets.fromLTRB(25.0, 13.0, 25.0, 13.0),
				child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text(hotelName, style: TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
							Text('You are current score', style: TextStyle(fontSize: 13.0, color: Colors.white, fontFamily: 'Montserrat')),
						],
					),
					Spacer(),
					Container(
						width: 60.0,
						height: 60.0,
						decoration: BoxDecoration(
							color: Color(0xFFfeabb5),
							borderRadius: BorderRadius.circular(50.0),
							boxShadow: [
							BoxShadow(
								color: Colors.white.withOpacity(0.5),
								offset: Offset(0.0, 0.0),
								blurRadius: 0.0,
								spreadRadius: 1.8)
							],
						),
						child: Center(
							child: Text(startCount,
								style: TextStyle(
									fontSize: 20.0,
									color: Colors.white,
									fontWeight: FontWeight.bold)),
					),
					),
				],
				),
			),
		);
	}
}