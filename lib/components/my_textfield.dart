import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
      cursorColor: Colors.grey.shade400,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'images/search.png',
            width: 20,
            height: 20,
            fit: BoxFit.fill,
            color: Colors.grey.shade600,
          ),
        ),
        fillColor: Color(0xFF141921),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        hintText: 'Find Your Coffee...',
        hintStyle:
            TextStyle(color: Colors.grey.shade600, fontFamily: 'poppins'),
      ),
    );
  }
}
