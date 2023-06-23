import 'package:flutter/material.dart';
import 'package:nurasoft_app/app/core/theme/color_theme.dart';
import 'package:nurasoft_app/app/modules/helper_modules/helper_modules.dart';
import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/auth_wrapper.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(
        title: 'Add Food',
      ),
      body: ListView.builder(
          itemCount: indianFoods.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 203, 194, 111)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow[50]),
              child: ListTile(
                leading: Image.network(
                    'https://source.unsplash.com/random/200x200?${indianFoods[index]}'),
                title: TextBMB(indianFoods[index]),
                subtitle: TextBSM(
                    'Calorie Value : ${calorieValues[index].toString()}'),
                trailing: GestureDetector(
                  onTap: () {
                    addFood();
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: blackColor),
                    child: const Icon(
                      Icons.add,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

List<String> indianFoods = [
  'Biryani', // Calorie: 400
  'Butter Chicken', // Calorie: 500
  'Paneer Tikka', // Calorie: 300
  'Samosa', // Calorie: 150
  'Dosa', // Calorie: 200
  'Idli', // Calorie: 60
  'Vada', // Calorie: 120
  'Chaat', // Calorie: 250
  'Rogan Josh', // Calorie: 350
  'Tandoori Chicken', // Calorie: 320
  'Naan', // Calorie: 180
  'Palak Paneer', // Calorie: 280
  'Dal Makhani', // Calorie: 320
  'Pani Puri', // Calorie: 80
  'Gulab Jamun', // Calorie: 150
  'Rasgulla', // Calorie: 100
  'Aloo Paratha', // Calorie: 250
  'Malai Kofta', // Calorie: 400
  'Pav Bhaji', // Calorie: 350
  'Mutton Curry', // Calorie: 450
];

List<int> calorieValues = [
  400,
  500,
  300,
  150,
  200,
  60,
  120,
  250,
  350,
  320,
  180,
  280,
  320,
  80,
  150,
  100,
  250,
  400,
  350,
  450
];

  // Printing the list of Indian foods with calorie information
//   for (int i = 0; i < indianFoods.length; i++) {
//     String food = indianFoods[i];
//     int calorie = calorieValues[i];
//     print('$food - $calorie calories');
//   }
// }
