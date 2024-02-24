import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffF44336);
const Color secondaryColor = Color(0xff4CAF50);

class ProductCard extends StatelessWidget {
  final String? imageURL;
  final String? name;
  final String? price;
  final int? quantity;
  final String? notification;
  final Function onAddCartTap;
  final Function onIncTap;
  final Function onDecTap;
  final TextStyle textStyle = TextStyle(
    fontFamily: "Lato",
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.grey[800],
  );

  ProductCard({
    this.imageURL = "",
    this.name = "",
    this.price = "",
    this.quantity = 0,
    this.notification,
    required this.onAddCartTap,
    required this.onIncTap,
    required this.onDecTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 10, right: 10),
          duration: Duration(milliseconds: 300),
          width: 180,
          height: (notification != null) ? 320 : 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(1, 1),
                color: Colors.black.withOpacity(0.3),
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: secondaryColor,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "${(notification != null) ? notification : ""}",
              style: textStyle.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageURL!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      name!,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      price!,
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 180,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => onIncTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: primaryColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: () => onDecTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: primaryColor,
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        onPressed: () => onAddCartTap(),
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            backgroundColor: primaryColor,
                            disabledBackgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
