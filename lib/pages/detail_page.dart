import 'dart:async';

import 'package:coffee_app/pages/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailPage extends StatefulWidget {
  static String id = 'DetailPage';
  final String title;

  DetailPage({
    required this.title,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    Timer(Duration(milliseconds: 200), (() => _animationController.forward()));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: appbarColor,
          title: Hero(
            tag: 'CoffeeText',
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Hero(
                    tag: 'Swiper',
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appbarColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, 5),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Container(
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                              color: appbarColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position:
                            Tween<Offset>(begin: Offset(0, 5), end: Offset.zero)
                                .animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Container(
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                              color: appbarColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 1),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Container(
                          decoration: BoxDecoration(
                            color: appbarColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
