import 'package:card_swiper/card_swiper.dart';
import 'package:coffee_app/components/my_textfield.dart';
import 'package:coffee_app/pages/constant.dart';
import 'package:coffee_app/pages/detail_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  late AnimationController _rotationController;
  late AnimationController _containerController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _containerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    );
    _animation = CurvedAnimation(
      parent: _containerController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  double bigContainerHeight = 0;
  double smallContainerHeight = 0;

  List coffeeType = [
    [
      'Cappucciono',
      true,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Latte',
      false,
    ],
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

  int whichCardClicked = 0;

  bool isFabPressed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
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
                    SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(0, -0.5), end: Offset.zero)
                          .animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          'Find the best\ncoffee for you',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                      // color: _colorAnimation.value,
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
                                setState(() {
                                  whichCardClicked = index;
                                  if (index == 0) {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          title: 'Cappucino',
                                        );
                                      },
                                    ));
                                  }
                                  if (index == 1) {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          title: 'Espresso',
                                        );
                                      },
                                    ));
                                  }
                                  if (index == 2) {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          title: 'Latte',
                                        );
                                      },
                                    ));
                                  }
                                });
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
          floatingActionButton: Container(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              child: isFabPressed
                  ? RotationTransition(
                      turns: _rotationController,
                      child: Image.asset('images/cross.png'))
                  : RotationTransition(
                      turns: _rotationController,
                      child: Image.asset(
                        'images/Scanner.png',
                      ),
                    ),
              onPressed: () {
                setState(() {
                  isFabPressed = !isFabPressed;
                  isFabPressed
                      ? _rotationController.forward()
                      : _rotationController.reverse();
                  bigContainerHeight = isFabPressed ? 190 : 0;
                  smallContainerHeight = isFabPressed ? 45 : 0;
                  isFabPressed
                      ? _containerController.forward()
                      : _containerController.reverse();
                });
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
        ),
        Positioned(
          bottom: 140,
          left: MediaQuery.of(context).size.width / 3.2,
          child: SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
                .animate(_containerController),
            child: FadeTransition(
              opacity: _containerController,
              child: Container(
                height: bigContainerHeight,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: smallContainerHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        height: smallContainerHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        height: smallContainerHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
