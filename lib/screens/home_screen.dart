import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/components/z_animated_toggle.dart';
import 'package:spotify_clone/models/provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: height * 0.1),
          child: Column(
            children: [
              Container(
                width: width * 0.35,
                height: width * 0.35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: themeProvider.themeMode().gradient,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
              SizedBox(height: height * 0.1),
              Text(
                'Choose a Style',
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
                width: width * 0.6,
                child: Text(
                  'Pop or subtle. Day and night. Customize your interface',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
              SizedBox(height: height * 0.1),
              ZAnimatedToggle(
                values: ['Light', 'Dark'],
                onToggleCallback: (v) async {
                  await themeProvider.toggleThemeData();
                  setState(() {
                    
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
