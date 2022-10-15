import 'package:coffee_app/pages/constant.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static String id = 'DetailPage';
  final String title;

  DetailPage({
    required this.title,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );

    _controller.forward();

    _controller.addListener(() {
      print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appbarColor,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    color: appbarColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    color: appbarColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: appbarColor,
                borderRadius: BorderRadius.circular(12),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
