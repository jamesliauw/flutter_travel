import 'package:flutter/material.dart';
import 'package:flutter_travel/styles/StyleColors.dart';

class LoadingScreen extends StatelessWidget {
    
    LoadingScreen({Key key}): super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
                        backgroundColor: colorStyles['gray'],
                        strokeWidth: 2.0
                    ),
                ),
            ),
        );
    }

}