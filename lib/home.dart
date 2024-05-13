import 'package:shopping_screen/card_data.dart';
import 'package:shopping_screen/app_alert_box.dart';
import 'package:shopping_screen/check_out_button.dart';
import 'package:shopping_screen/home_screen_title.dart';
import 'package:shopping_screen/shopping_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late int totalPrice;

  @override
  void initState() {
    totalPrice = calculateTotalPrice();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            //portraitView
            margin: const EdgeInsets.all(10.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeScreenTitle(),
                SizedBox(
                  height: (orientation == Orientation.portrait) ? 25 : 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: imageData.length,
                    itemBuilder: (context, index) => ShoppingData(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      orientation: orientation,
                      index: index,
                      increasedButton: () =>
                          increasedButton(index, orientation),
                      decreasedButton: () => decreasedButton(index),
                    ),
                  ),
                ),
                CheckOutButton(
                  orientation: orientation,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  totalPrice: totalPrice,
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(showSnackBar());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
  int calculateTotalPrice() {
    totalPrice = 0;
    for (CardData data in imageData) {
      totalPrice += data.price;
    }
    return totalPrice;
  }
  void increasedButton(int index, Orientation orientation) {
    if (imageData[index].quantity < 5) {
      imageData[index].quantity = imageData[index].quantity + 1;
      totalPrice += imageData[index].price;
    }
    if (imageData[index].quantity == 5) {
      showAlertDialog(index, orientation);
    }
    setState((){});
  }
  void showAlertDialog(int index, Orientation orientation) {
    showDialog(
      context: context,
      builder: (context) {
        return AppAlertDialog(
            title: "Congratulations!",
            content:
            "You have added 5 ${imageData[index].name.toString()} in your bag!",
            orientation: orientation);
      },
    );
  }
  void decreasedButton(int index) {
    if (imageData[index].quantity > 1) {
     imageData[index].quantity = imageData[index].quantity - 1;
      totalPrice -= imageData[index].price;
    }
    setState((){});
  }
  SnackBar showSnackBar() {
    return const SnackBar(
      content:  Text(
        "Congratulations! Your purchasing process is done.",
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w700
        ),
      ),
      padding: EdgeInsets.all(20.00),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      elevation: 10,
    );
  }
}