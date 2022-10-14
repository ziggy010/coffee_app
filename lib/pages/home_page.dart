import 'package:card_swiper/card_swiper.dart';
import 'package:coffee_app/components/my_textfield.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

  SwiperController _mySwipperController = SwiperController();

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
                // SizedBox(
                //   height: 30.h,
                // ),
                TweenAnimationBuilder(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 700),
                  tween: Tween<double>(begin: 0, end: 1),
                  child: Text(
                    'Find the best\ncoffee for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: value * 30,
                        ),
                        child: child,
                      ),
                    );
                  },
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
                          right: 40.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                changeCoffeeSelection(index);
                                _mySwipperController.move(index);
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
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    height: 400.h,
                    child: Swiper(
                      controller: _mySwipperController,
                      axisDirection: AxisDirection.right,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print('clicked value: ${index}');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20.r,
                            ),
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      itemCount: imageList.length,
                      layout: SwiperLayout.STACK,
                      itemWidth: 300.w,
                      onIndexChanged: (value) {
                        changeCoffeeSelection(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   color: Color.fromARGB(255, 47, 53, 71),
      //   backgroundColor: Color(0xFF0D0F15),
      //   buttonBackgroundColor: Color(0xFFD27742),
      //   items: <Widget>[
      //     Icon(
      //       Icons.add,
      //       size: 30,
      //       color: Colors.grey.shade600,
      //     ),
      //     Icon(
      //       Icons.list,
      //       size: 30,
      //       color: Colors.grey.shade600,
      //     ),
      //     Icon(
      //       Icons.compare_arrows,
      //       size: 30,
      //       color: Colors.grey.shade600,
      //     ),
      //   ],
      //   onTap: (index) {
      //     //Handle button tap
      //   },
      // ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Color.fromARGB(255, 28, 31, 41),
        child: Container(
          height: 50,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
