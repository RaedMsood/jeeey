import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsOfAppbarDetailsWidget extends StatelessWidget {
  const IconsOfAppbarDetailsWidget({super.key,required this.icon, this.onPressed});
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 30.h,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white60.withOpacity(0.7),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black,size: 19.sp,), // لون الأيقونة
        onPressed: onPressed,
      ),
    );
  }
}
