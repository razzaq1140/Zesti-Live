import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class AllItemEcommerceModels {
  final String title;
  final String price;
  final double rating;
  final List<String> images;
  bool isFavorite;

  AllItemEcommerceModels({
    this.title = "",
    this.price = "",
    this.rating = 0.0,
    this.images = const [],
    this.isFavorite = false,
  });
}

final List<AllItemEcommerceModels> items = [
  AllItemEcommerceModels(
    title: "Orange Summer",
    price: "97",
    rating: 4.9,
    images: [
      'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
];

class AllItemDetailPage extends StatefulWidget {
  final AllItemEcommerceModels item;

  AllItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  _AllItemDetailPageState createState() => _AllItemDetailPageState();
}

class _AllItemDetailPageState extends State<AllItemDetailPage> {
  String selectedSize = 'M';
  String selectedColor = 'red';
  int quality = 1;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                color: Colors.red,
              )
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Container(
                  height: 600,
                  child: PageView.builder(
                    itemCount: widget.item.images.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: widget.item.images[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                // Heart Icon
                Positioned(
                  bottom: 130,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.item.isFavorite = !widget.item.isFavorite;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            widget.item.isFavorite ? Colors.red : Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 450,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.item.images.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPage == index
                          ? colorScheme(context).primary
                          : colorScheme(context).surface),
                );
              }),
            ),
          ),
          // Draggable Scrollable Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.4, // Initial height (40% of screen)
            minChildSize: 0.3, // Minimum height (30% of screen)
            maxChildSize: 0.5, // Maximum height (80% of screen)
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                                colorScheme(context).outline.withOpacity(0.3),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Orange Summer",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 7),

                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: widget.item.rating,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: AppColor.appYellow),
                            itemCount: 5,
                            itemSize: 20,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.item.rating.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "\$${widget.item.price}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Size Selection
                      Row(
                        children: [
                          Text(
                            "Size:",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Row(
                            children: ['S', 'M', 'L', 'XL'].map((size) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: selectedSize == size
                                        ? Colors.teal
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    size,
                                    style: TextStyle(
                                      color: selectedSize == size
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Color Selection
                      Row(
                        children: [
                          Text(
                            "Choose a color:",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Row(
                            children: ['red', 'blue', 'green'].map((color) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: color == 'red'
                                        ? Colors.red
                                        : color == 'blue'
                                            ? Colors.blue
                                            : Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selectedColor == color
                                          ? Colors.teal
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "Select Quality:",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quality > 1) quality--;
                                      });
                                    },
                                    child: Icon(Icons.remove),
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  quality.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quality++;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer maximus accumsan erat id facilisis.",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 16),
                      Center(
                          child: CustomButton(
                              buttonText: 'Add To Cart', onPressed: () {})),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
