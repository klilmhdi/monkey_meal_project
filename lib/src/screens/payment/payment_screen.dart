import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';
import 'package:monkey_meal_project/src/screens/payment/component/payment_card_widget.dart';
class PaymentScreen extends StatefulWidget {
  static String routeName='/paymentRoute';

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Details'),
      actions: [InkWell(
        onTap: (){},
        child:     IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      )],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Customize your payment method',
              style: TextStyle(fontFamily: 'Metropolis',fontWeight: FontWeight.w900),),
            SizedBox(height: 16,),
            PaymentCardWidget(),
            SizedBox(height: 16,),
CustomButton(title: '+ Add Another Credit/Debit Card',onPressed: (){
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // so it can expand when keyboard opens
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
    ),
    builder: (_) =>  CustomBottomSheet(onPressed: (){

      Navigator.pop(context);
    },),
  );
},)
          ],
        ),
      ),
    );  }
}
