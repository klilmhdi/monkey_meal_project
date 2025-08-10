import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_bottom_sheet/custom_text_form_field.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        //bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text(
              "Add Credit/Debit Card",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(hint: 'Card Number',keyboardType: TextInputType.number,)
          ,const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: CustomTextFormField(hint: 'MM',keyboardType: TextInputType.number,))

             , const SizedBox(width: 10),
              Expanded(child: CustomTextFormField(hint: 'YY',keyboardType: TextInputType.number,))
            ],
          ),
          const SizedBox(height: 10),

          CustomTextFormField(hint: 'Security Code',
            keyboardType: TextInputType.number,
          obscureText: true,),

          const SizedBox(height: 10),
          CustomTextFormField(hint: 'First Name',
            keyboardType: TextInputType.name,),

          const SizedBox(height: 10),
          CustomTextFormField(hint: 'Last Name',keyboardType: TextInputType.number,)

          ,            const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("You can remove this card at anytime"),
              Switch(
                value: false,
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(title: '+ \t Add Card',)

        ],
      ),
    );  }
}
