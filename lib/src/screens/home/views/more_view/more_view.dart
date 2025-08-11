import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/about_screen/about_screen.dart';
import 'package:monkey_meal_project/src/screens/inbox_screen/inbox_screen.dart';
import 'package:monkey_meal_project/src/screens/notifications_screen/notification_screen.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/order_screen.dart';
import 'package:monkey_meal_project/src/screens/payment/payment_screen.dart';

import 'component/more_item.dart';
class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More'),
        actions: [IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Helper.navTo(context, PaymentScreen());          },
        )],),
      body: ListView(

        padding: const EdgeInsets.all(16.0),
        children:  [
          MoreItem(
            icon: Icons.monetization_on,
            title: 'Payment Details',
onTap:(){Helper.navTo(context, PaymentScreen());

            /*  Navigator.pushReplacement(context,PaymentScreen.routeName
              );*/
              },
          ),
          MoreItem(
            icon: Icons.shopping_bag,
            title: 'My Orders',
            onTap:() {
              Helper.navTo(context, OrderScreen());
            }
          ),
          MoreItem(
            icon: Icons.notifications,
            title: 'Notifications',
            badge: 15,
            onTap:() {
              Helper.navTo(context, NotificationScreen());
              //  Navigator.pushNamed(context,NotificationScreen.routeName);},
            }
          ),
          MoreItem(
            icon: Icons.inbox,
            title: 'Inbox',
            onTap:(){
             // Navigator.pushNamed(context,InboxScreen.routeName);
              Helper.navTo(context, InboxScreen());
            },
          ),
          MoreItem(
            icon: Icons.info,
            title: 'About Us',
              onTap:(){
                Helper.navTo(context, AboutScreen());
                //Navigator.pushNamed(context,AboutScreen.routeName);
    //
    }
          ),
        ],
      ),
    );
  }
}