import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/models/popular_item.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/widgets/custom_category.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/widgets/custom_product.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/models/sales.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/menu_item.dart';

class MainOnePage extends StatefulWidget {
  const MainOnePage({super.key});

  @override
  State<MainOnePage> createState() => _MainOnePageState();
}

class _MainOnePageState extends State<MainOnePage> {
  final List<PopularItem> popularItems = [
    PopularItem(
        title: 'Vinta Backpack',
        price: 78.0,
        rating: 4.9,
        image:
            "https://workspace.com.pk/wp-content/uploads/2022/08/IMG_1856.jpg"),
    PopularItem(
        title: 'Travel Bag',
        price: 65.0,
        rating: 4.8,
        image:
            "https://workspace.com.pk/wp-content/uploads/2022/08/IMG_1856.jpg"),
    PopularItem(
        title: 'Gym Backpack',
        price: 50.0,
        rating: 4.7,
        image:
            "https://workspace.com.pk/wp-content/uploads/2022/08/IMG_1856.jpg"),
  ];

  // Variable to track the visibility of the "More" section
  bool isMoreVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        toolbarHeight: 80,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme(context).surface,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [],
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlignVertical:
                        TextAlignVertical.center, // Ensures vertical alignment
                    decoration: InputDecoration(
                      isDense: true, // Removes extra vertical padding
                      hintText: "Find a bank or account",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: colorScheme(context).outline.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical:
                            0, // Adjust vertical padding to center the text
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 51,
                  decoration: BoxDecoration(
                    color: colorScheme(context).primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.myCart);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: colorScheme(context).primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(AppIcons.cart),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 245, 245, 245),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 92),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 20,
                        color: colorScheme(context).outline.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.shoe,
                        label: 'Women\nFashion',
                      ),
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.shirt,
                        label: 'Men\nFashion',
                      ),
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.cloth,
                        label: 'Child\nFashion',
                      ),
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.food,
                        label: 'Food\n& Fashion',
                      ),
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.kitchen,
                        label: 'Kitchen\nTools',
                      ),
                      CategoryWidget(
                        ontap: () {
                          context.pushNamed(AppRoute.allItemPage);
                        },
                        imagePath: AppImages.furniture,
                        label: 'Furniture\n',
                      ),
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.guitar,
                        label: 'Hobby\n',
                      ),
                      CategoryWidget(
                        ontap: () {},
                        imagePath: AppImages.electronic,
                        label: 'Electronics\n',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: AppColor.lightOrange,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.purse),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "\$1.500",
                              style: textTheme(context).bodySmall?.copyWith(
                                    fontSize: 14,
                                    color: colorScheme(context)
                                        .surface, // Visible color
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.payPageOne);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.pay),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Pay",
                                style: textTheme(context).bodySmall?.copyWith(
                                      fontSize: 14,
                                      color: colorScheme(context).surface,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.balanceTopUpPage);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.topup),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Top Up",
                                style: textTheme(context).bodySmall?.copyWith(
                                      fontSize: 14,
                                      color: colorScheme(context).surface,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMoreVisible =
                                  !isMoreVisible; // Toggle visibility
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.morenew),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "More",
                                style: textTheme(context).bodySmall?.copyWith(
                                      fontSize: 14,
                                      color: colorScheme(context).surface,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isMoreVisible)
                  SizedBox(
                    height: 6,
                  ),
                if (isMoreVisible)
                  Stack(
                    clipBehavior:
                        Clip.none, // Ensures no clipping of the triangle
                    children: [
                      Positioned(
                        top:
                            -17, // Adjust to align the triangle with the orange container
                        left: MediaQuery.of(context).size.width / 2 -
                            10, // Center the triangle
                        child: CustomPaint(
                          size: Size(16, 20), // Size of the triangle
                          painter: TrianglePainter(
                            color: colorScheme(context).surface,
                            offsetX: 115,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          width: MediaQuery.sizeOf(context).width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: colorScheme(context).surface,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuItem(
                                  title: "Charge",
                                  svgIconPath: AppIcons.charge),
                              MenuItem(
                                  title: "Transfer",
                                  svgIconPath: AppIcons.transfer),
                              MenuItem(
                                  title: "Credit",
                                  svgIconPath: AppIcons.credit),
                              MenuItem(
                                  title: "Pay Later",
                                  svgIconPath: AppIcons.paylater),
                              MenuItem(
                                  title: "Settings",
                                  svgIconPath: AppIcons.settingSvg),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Sale Discount",
                  style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 20,
                        color: colorScheme(context).outline.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: dummyProducts
                        .map((product) => ProductCard(product: product))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Popular",
                  style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 20,
                        color: colorScheme(context).outline.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: popularItems
                      .map((item) => PopularItemCard(item: item))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularItemCard extends StatefulWidget {
  final PopularItem item;

  const PopularItemCard({Key? key, required this.item}) : super(key: key);

  @override
  State<PopularItemCard> createState() => _PopularItemCardState();
}

class _PopularItemCardState extends State<PopularItemCard> {
  bool isFavorite = false; // Track whether the product is favorited or not

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 102,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2, right: 12, left: 112),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.title,
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 16,
                                color: colorScheme(context)
                                    .outline
                                    .withOpacity(0.5), // Visible color
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "\$${widget.item.price.toString()}",
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 16,
                                color: colorScheme(context)
                                    .primary, // Visible color
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            Icon(Icons.star_half,
                                size: 14, color: Colors.amber),
                            const SizedBox(width: 5),
                            Text(
                              widget.item.rating.toString(),
                              style: textTheme(context).bodySmall?.copyWith(
                                    fontSize: 10,
                                    color: colorScheme(context).outline.withOpacity(
                                        0.5), // Visible color                              fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 51,
                        decoration: BoxDecoration(
                            color: AppColor.appGreen,
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(AppImages.cart),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 105,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.item.image,
                placeholder: (context, url) => Center(
                  child:
                      CircularProgressIndicator(), // Show a loader while fetching
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error, color: Colors.red), // Error icon
                ),
                fit: BoxFit.cover, // Optional: Adjust based on your design
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final double offsetX; // Amount to shift the triangle to the right

  TrianglePainter({required this.color, this.offsetX = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path()
      ..moveTo(offsetX, size.height) // Bottom-left
      ..lineTo(size.width / 2 + offsetX, 0) // Top-center
      ..lineTo(size.width + offsetX, size.height) // Bottom-right
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}






















// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
// import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
// import 'package:flutter_application_zestilive/src/features/create_profile/models/popular_item.dart';
// import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/widgets/custom_category.dart';
// import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/widgets/custom_product.dart';
// import 'package:flutter_application_zestilive/src/models/sales.dart';
// import 'package:flutter_application_zestilive/src/router/go_route.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import '../widgets/menu_item.dart';

// class MainOnePage extends StatefulWidget {
//   const MainOnePage({super.key});

//   @override
//   State<MainOnePage> createState() => _MainOnePageState();
// }

// class _MainOnePageState extends State<MainOnePage> {
//   final List<PopularItem> popularItems = [
//     PopularItem(
//         title: 'Vinta Backpack',
//         price: 78.0,
//         rating: 4.9,
//         image:
//             "https://workspace.com.pk/wp-content/uploads/2022/08/IMG_1856.jpg"),
//     PopularItem(
//         title: 'Travel Bag',
//         price: 65.0,
//         rating: 4.8,
//         image:
//             "https://workspace.com.pk/wp-content/uploads/2022/08/IMG_1856.jpg"),
//     PopularItem(
//         title: 'Gym Backpack',
//         price: 50.0,
//         rating: 4.7,
//         image:
//             "https://workspace.com.pk/wp-content/uploads/2022/08/IMG_1856.jpg"),
//   ];

//   // Variable to track the visibility of the "More" section
//   bool isMoreVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color.fromARGB(255, 245, 245, 245),
//         elevation: 0,
//         toolbarHeight: 80,
//         title: Container(
//           height: 40,
//           decoration: BoxDecoration(
//             color: colorScheme(context).surface,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [],
//           ),
//           child: Center(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     textAlignVertical:
//                         TextAlignVertical.center, // Ensures vertical alignment
//                     decoration: InputDecoration(
//                       isDense: true, // Removes extra vertical padding
//                       hintText: "Find a bank or account",
//                       hintStyle: TextStyle(
//                         fontSize: 12,
//                         color: colorScheme(context).outline.withOpacity(0.3),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 15,
//                         vertical:
//                             0, // Adjust vertical padding to center the text
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 40,
//                   width: 51,
//                   decoration: BoxDecoration(
//                     color: colorScheme(context).primary,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Center(
//                     child: IconButton(
//                       icon: Icon(Icons.search, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               context.pushNamed(AppRoute.myCart);
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: colorScheme(context).primary,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SvgPicture.asset(AppIcons.cart),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 5),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: const Color.fromARGB(255, 245, 245, 245),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 92),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Category",
//                   style: textTheme(context).bodySmall?.copyWith(
//                         fontSize: 20,
//                         color: colorScheme(context).outline.withOpacity(0.7),
//                         fontWeight: FontWeight.w500,
//                       ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.shoe,
//                         label: 'Women\nFashion',
//                       ),
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.shirt,
//                         label: 'Men\nFashion',
//                       ),
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.cloth,
//                         label: 'Child\nFashion',
//                       ),
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.food,
//                         label: 'Food\n& Fashion',
//                       ),
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.kitchen,
//                         label: 'Kitchen\nTools',
//                       ),
//                       CategoryWidget(
//                         ontap: () {
//                           context.pushNamed(AppRoute.allItemPage);
//                         },
//                         imagePath: AppImages.furniture,
//                         label: 'Furniture\n',
//                       ),
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.guitar,
//                         label: 'Hobby\n',
//                       ),
//                       CategoryWidget(
//                         ontap: () {},
//                         imagePath: AppImages.electronic,
//                         label: 'Electronics\n',
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),

//                 Container(
//                   height: 65,
//                   decoration: BoxDecoration(
//                       color: AppColor.lightOrange,
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset(AppImages.purse),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               "\$1.500",
//                               style: textTheme(context).bodySmall?.copyWith(
//                                     fontSize: 14,
//                                     color: colorScheme(context)
//                                         .surface, // Visible color
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                             ),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             context.pushNamed(AppRoute.payPageOne);
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(AppImages.pay),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "Pay",
//                                 style: textTheme(context).bodySmall?.copyWith(
//                                       fontSize: 14,
//                                       color: colorScheme(context).surface,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             context.pushNamed(AppRoute.balanceTopUpPage);
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(AppImages.topup),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "Top Up",
//                                 style: textTheme(context).bodySmall?.copyWith(
//                                       fontSize: 14,
//                                       color: colorScheme(context).surface,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isMoreVisible =
//                                   !isMoreVisible; // Toggle visibility
//                             });
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(AppImages.morenew),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "More",
//                                 style: textTheme(context).bodySmall?.copyWith(
//                                       fontSize: 14,
//                                       color: colorScheme(context).surface,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // if (isMoreVisible)
//                 //   SizedBox(
//                 //     height: 4,
//                 //   ),
//                 if (isMoreVisible)
//                   ClipPath(
//                     clipper: CustomTriangleClipper(),
//                     child: Container(
//                       padding: EdgeInsets.all(16.0),
//                       width: MediaQuery.sizeOf(context).width,
//                       height: 84,
//                       decoration: BoxDecoration(
//                         color: colorScheme(context).surface,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 6.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             MenuItem(
//                                 title: "Charge", svgIconPath: AppIcons.charge),
//                             MenuItem(
//                                 title: "Transfer",
//                                 svgIconPath: AppIcons.transfer),
//                             MenuItem(
//                                 title: "Credit", svgIconPath: AppIcons.credit),
//                             MenuItem(
//                                 title: "Pay Later",
//                                 svgIconPath: AppIcons.paylater),
//                             MenuItem(
//                                 title: "Settings",
//                                 svgIconPath: AppIcons.settingSvg),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Text(
//                   "Sale Discount",
//                   style: textTheme(context).bodySmall?.copyWith(
//                         fontSize: 20,
//                         color: colorScheme(context).outline.withOpacity(0.7),
//                         fontWeight: FontWeight.w500,
//                       ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: dummyProducts
//                         .map((product) => ProductCard(product: product))
//                         .toList(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   "Popular",
//                   style: textTheme(context).bodySmall?.copyWith(
//                         fontSize: 20,
//                         color: colorScheme(context).outline.withOpacity(0.7),
//                         fontWeight: FontWeight.w500,
//                       ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Column(
//                   children: popularItems
//                       .map((item) => PopularItemCard(item: item))
//                       .toList(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PopularItemCard extends StatefulWidget {
//   final PopularItem item;

//   const PopularItemCard({Key? key, required this.item}) : super(key: key);

//   @override
//   State<PopularItemCard> createState() => _PopularItemCardState();
// }

// class _PopularItemCardState extends State<PopularItemCard> {
//   bool isFavorite = false; // Track whether the product is favorited or not

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: 102,
//           child: Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             elevation: 2,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 2.0, bottom: 2, right: 12, left: 112),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.item.title,
//                           style: textTheme(context).bodySmall?.copyWith(
//                                 fontSize: 16,
//                                 color: colorScheme(context)
//                                     .outline
//                                     .withOpacity(0.5), // Visible color
//                                 fontWeight: FontWeight.w500,
//                               ),
//                         ),
//                         SizedBox(
//                           height: 3,
//                         ),
//                         Text(
//                           "\$${widget.item.price.toString()}",
//                           style: textTheme(context).bodySmall?.copyWith(
//                                 fontSize: 16,
//                                 color: colorScheme(context)
//                                     .primary, // Visible color
//                                 fontWeight: FontWeight.w700,
//                               ),
//                         ),
//                         SizedBox(
//                           height: 3,
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.star, size: 14, color: Colors.amber),
//                             Icon(Icons.star, size: 14, color: Colors.amber),
//                             Icon(Icons.star, size: 14, color: Colors.amber),
//                             Icon(Icons.star, size: 14, color: Colors.amber),
//                             Icon(Icons.star_half,
//                                 size: 14, color: Colors.amber),
//                             const SizedBox(width: 5),
//                             Text(
//                               widget.item.rating.toString(),
//                               style: textTheme(context).bodySmall?.copyWith(
//                                     fontSize: 10,
//                                     color: colorScheme(context).outline.withOpacity(
//                                         0.5), // Visible color                              fontWeight: FontWeight.w400,
//                                   ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             isFavorite = !isFavorite;
//                           });
//                         },
//                         child: Icon(
//                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                           color: Colors.red,
//                           size: 20,
//                         ),
//                       ),
//                       Container(
//                         height: 24,
//                         width: 51,
//                         decoration: BoxDecoration(
//                             color: AppColor.appGreen,
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Image.asset(AppImages.cart),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               width: 100,
//               height: 105,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl: widget.item.image,
//                 placeholder: (context, url) => Center(
//                   child:
//                       CircularProgressIndicator(), // Show a loader while fetching
//                 ),
//                 errorWidget: (context, url, error) => Center(
//                   child: Icon(Icons.error, color: Colors.red), // Error icon
//                 ),
//                 fit: BoxFit.cover, // Optional: Adjust based on your design
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomTriangleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final Path path = Path();
//     final double triangleHeight = 16.0;
//     final double triangleOffset = 134.0; // Move triangle to the right
//     final double arcRadius = 0.5; // Radius for rounding the tip

//     // Start at top-left corner
//     path.moveTo(0, triangleHeight);

//     // Adjust the triangle's position by applying the offset
//     path.lineTo(size.width / 2 + triangleOffset - 10,
//         triangleHeight); // Left side of the triangle

//     // Create an arc for the rounded tip
//     path.arcToPoint(
//       Offset(size.width / 2 + triangleOffset + 10,
//           triangleHeight), // End of the arc
//       radius: Radius.circular(arcRadius), // Arc radius
//       clockwise: true, // Arc direction
//     );

//     // Draw line to top-right corner
//     path.lineTo(size.width, triangleHeight);

//     // Draw lines to bottom-right and bottom-left corners
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);

//     // Close the path
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
