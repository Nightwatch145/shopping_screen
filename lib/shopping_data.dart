import 'package:shopping_screen/card_quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:shopping_screen/card_data.dart';

class ShoppingData extends StatelessWidget {
  final double screenHeight, screenWidth;
  final Orientation orientation;
  final int index;
  final Function increasedButton;
  final Function decreasedButton;

  const ShoppingData({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.orientation,
    required this.index,
    required this.increasedButton,
    required this.decreasedButton,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: (orientation == Orientation.portrait)
          ? screenHeight * 0.16
          : screenHeight * 0.4,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.00),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurStyle: BlurStyle.normal,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.34,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.00),
                  bottomLeft: Radius.circular(10.00)),
              color: const Color(0xFFE3E3E3),
              image: DecorationImage(
                  image: NetworkImage(imageData[index].image),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            imageData[index].name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Metropolis"
                            ),
                          ),
                        ],
                      ),
                      const Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        Wrap(
                          children: [
                            const Text(
                             'Color:',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 11,
                                fontFamily: 'Metropolis',
                                fontWeight: FontWeight.w900
                              )
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                imageData[index].color,
                                style:const  TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w900
                                )
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                           const Text(
                                'Size:',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 11,
                                  fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w900
                                )
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                imageData[index].size,
                                style:const TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w900
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: (orientation == Orientation.portrait)
                        ? MediaQuery.of(context).size.height * 0.05
                        : MediaQuery.of(context).size.height * 0.16,
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: QuantityButton(
                              icon: Icons.remove,
                              onPressed: decreasedButton,
                            ),
                          ),
                          //const SizedBox(width:40 ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: Wrap(
                                children: [
                                  Text(
                                    imageData[index].quantity.toString(),
                                    style: const TextStyle(fontSize: 17,fontFamily: "Metropolis", fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: QuantityButton(
                                icon: Icons.add,
                                onPressed:increasedButton,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    alignment: WrapAlignment.end,
                                    children: [
                                      Text(
                                        "${imageData[index].price * imageData[index].quantity}\$",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

