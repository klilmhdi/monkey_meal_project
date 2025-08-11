import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
class OrderSuccessBottomSheet extends StatelessWidget {
  const OrderSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset('assets/images/order_done.png',
             width: Helper.getScreenWidth(context),
             height: Helper.getScreenHeight(context)*0.3,),
            const SizedBox(height: 16),
            const Text(
              'Thank You!',
              style: TextStyle(
                fontFamily: 'Metropolis',fontWeight: FontWeight.w900,
                fontSize: 24,
    
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'for your order',
                style: TextStyle(
            fontFamily: 'Metropolis',fontWeight: FontWeight.w900,
                  fontSize: 24,
    
            ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(title: 'Track my order'),
           SizedBox(height: 8,),
           InkWell(
               onTap: (){
                 Navigator.popAndPushNamed(context, HomeScreen.routeName);
    
               },
               child: Text('Back to home',style: TextStyle(
                 fontFamily: 'Metropolis',fontWeight: FontWeight.w900
    
               ),),
           ),
    
    
            const SizedBox(height: 24),
    
          ],
        ),
      ),
    );
  }
}