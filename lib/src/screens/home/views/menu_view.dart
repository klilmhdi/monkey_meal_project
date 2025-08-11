import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_search_app_bar.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/selected_menu_item_screen/selected_menu_item_screen.dart.dart';


class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [  CustomAppBar(
            text: "Menu",
            textColor: AppColor.primary,
            iconColor: AppColor.primary,
            onCartPressed: () {
              // Handle cart button press
            },
          ),
          SizedBox(height: 14.h,),
          CustomSearchBar(),
           SizedBox(height: 14.h,),


        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    LongSideBar(),
                    ..._buildMenuItems(30.h,  true, () {
                      Helper.navTo(context, SelectedMenuItemScreen());
                    }),
                    ..._buildMenuItems(140.h,  false, () {}),
                    ..._buildMenuItems(250.h, false, () {}),
                    ..._buildMenuItems(360.h,  false, () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

  List<Widget> _buildMenuItems(double topOffset,bool  useRoundedTriangle,void Function()? onTap) {
    // ignore: unused_local_variable
    final Widget widget;
    if(useRoundedTriangle){
      
      widget = ClipPath(
        clipper: RoundedTriangleClipper(),
        child: Container(
          width: 70.w,
          height: 70.h,
          color: Colors.white,
         
        ),
      );
    }else{
      widget=CircularImage();
    }
    return [
      Positioned(
        left: 55.sp,
        top: topOffset,
        child: HorizintalBar(onTap: onTap,),
      ),
      Positioned(
        left: 20.sp,
        top: topOffset,
        child: CircularImage(),
      ),
      Positioned(
        right: 1.sp,
        top: topOffset +25.h ,
        child:ClockIcon()
      ),
    ];
  }

class ClockIcon extends StatelessWidget {
  const ClockIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: 
            [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ]
            ,
      ),
      child: Icon(
        Icons.watch_later_outlined,
        color: AppColor.orange,
        size: 20,
      ),
      
    );
  }
}

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      image: DecorationImage(
          image: AssetImage("images/burger_image.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      
    );
  }
}

class HorizintalBar extends StatelessWidget {
  const HorizintalBar({super.key, this.onTap});
  final void Function()? onTap;  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 280.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            bottomLeft: Radius.circular(35.r),
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
      
        ),
        child: Row(children: [
          Expanded(child: SizedBox()),    
          Expanded(child: Column(
            children: [
              Expanded(child: SizedBox()),
              Text("Food",style: TextStyle(
                color: AppColor.primary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )),
               Text("120 Items",style: TextStyle(
                color: AppColor.placeholder,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              )),
               Expanded(child: SizedBox()),
            ],
          )),    
          Expanded(child: SizedBox()),
          Expanded(child: SizedBox())
      
              ],),
      ),
    );
  }
}

class LongSideBar extends StatelessWidget {
  const LongSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 485.h,
      width: 97.w,
      decoration: BoxDecoration(
        color: AppColor.orange,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
      ),
    );
  }
}
class RoundedTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

   Path path = Path();
    path.moveTo(w * 0.25, 0); // top-left start
    path.quadraticBezierTo(w * 1.05, h * 0.05, w * 0.95, h * 0.5); // top to right curve
    path.quadraticBezierTo(w * 0.95, h * 0.95, w * 0.3, h); // right to bottom curve
    path.quadraticBezierTo(-w * 0.05, h * 0.95, 0, h * 0.4); // bottom to left curve
    path.quadraticBezierTo(0, 0, w * 0.25, 0); // left to top curve

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}