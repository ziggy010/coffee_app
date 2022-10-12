import 'package:card_swiper/card_swiper.dart';
import 'package:coffee_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List coffeeType = [
    ['Cappucciono', true],
    ['Espresso', false],
    ['Latte', false],
    ['Flat wine', false],
  ];

  List imageList = [
    'images/coffee1.jpeg',
    'images/coffee2.jpeg',
    'images/coffee3.jpeg',
  ];

  void changeCoffeeSelection(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0F15),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              24.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF21252D),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Icon(
                            Icons.widgets_rounded,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/cvhero.jpg',
                          ),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 78, 82, 90),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Find the best\ncoffee for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const MyTextfield(),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: 30.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                changeCoffeeSelection(index);
                              },
                              child: Text(
                                coffeeType[index][0],
                                style: TextStyle(
                                  color: coffeeType[index][1]
                                      ? Color(0xFFD27742)
                                      : Colors.grey.shade600,
                                  fontFamily: 'poppins',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              color: coffeeType[index][1]
                                  ? Color(0xFFD27742)
                                  : Colors.transparent,
                              height: 3.h,
                              width: 50.w,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: Container(
                    height: 400.h,
                    child: Swiper(
                      axisDirection: AxisDirection.right,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(40.r),
                          child: Image.asset(
                            imageList[index],
                          ),
                        );
                      },
                      itemCount: imageList.length,
                      layout: SwiperLayout.STACK,
                      itemWidth: 300.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
