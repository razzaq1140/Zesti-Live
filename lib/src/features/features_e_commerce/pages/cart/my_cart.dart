import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/audio_live.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CartItem {
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;
  bool isChecked;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
    this.isChecked = false,
  });
}

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<CartItem> cartItems = [
    CartItem(
      name: "Levi's Jeans",
      color: "Dark Grey",
      size: "L",
      price: 76.0,
    ),
    CartItem(
      name: "Nike T-Shirt",
      color: "White",
      size: "M",
      price: 45.0,
    ),
    CartItem(
      name: "Adidas Shoes",
      color: "Black",
      size: "9",
      price: 120.0,
    ),
  ];

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      setState(() {
        cartItems[index].quantity--;
      });
    }
  }

  double calculateSubTotal() {
    return cartItems.fold(
      0.0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: 
      AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme(context).primary,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: colorScheme(context).surface,
                    size: 14, // Adjust icon size to fit
                  ),
                ),
              ),
            ),
            Text(
              "My Cart",
              style: textTheme(context).bodyMedium?.copyWith(
                  color: colorScheme(context)
                      .outline
                      .withOpacity(0.7), // Contrast color
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              onTap: () {
                // Navigation Handle
              },
              child: Center(child: Icon(Icons.more_vert)),
            ),
          ],
        ),
      ),
      
      
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Dismissible(
                        key: ValueKey(item.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          removeItem(index);
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: item.isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        item.isChecked = value ?? false;
                                      });
                                    },
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://imgv3.fotor.com/images/slider-image/A-blurry-close-up-photo-of-a-woman.jpg",
                                      height: 100, // Required height
                                      width: 100, // Required width
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item.name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  removeItem(index),
                                              icon: Icon(Icons.delete,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Color: ${item.color}",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Size: ${item.size}",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "\$${item.price.toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 35, // Adjusted height
                                          width: 120, // Adjusted width
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    decrementQuantity(index),
                                                child: Container(
                                                  width: 35,
                                                  height: 35,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      right: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 18,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${item.quantity}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                    incrementQuantity(index),
                                                child: Container(
                                                  width: 35,
                                                  height: 35,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      left: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 18,
                                                    color: Colors.grey,
                                                  ),
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
                              Divider(
                                color: const Color.fromARGB(255, 202, 202, 202),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(),
                                  Text(
                                    "Sub Total:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(width: 40),
                                  Text(
                                    "\$${calculateSubTotal().toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SubTotal",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "\$${calculateSubTotal().toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: CustomButton(
                              buttonText: 'CHECK OUT',
                              onPressed: () {
                                context.pushNamed(AppRoute.payment);
                              }))
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
