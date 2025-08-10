import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
class SavedCardWidget extends StatelessWidget {
  const SavedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1200px-Visa_Inc._logo.svg.png',
                      height: 24,
                      width: Helper.getScreenWidth(context)*.15,
                    ),
                  ),
                  SizedBox(
                    width: Helper.getScreenWidth(context)*.3,

                    child: const Text(
                      '**** **** **** 2187',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Delete Card',style: TextStyle(
                    fontSize: 12
                  ),),
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          const Text(
            'Other Methods',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],

      ),
    );  }
}
