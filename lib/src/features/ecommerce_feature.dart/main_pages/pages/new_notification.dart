import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';


class PopularItem {
  final String title;
  final double price;
  final double rating;
  final String image;

  PopularItem(
      {required this.title,
      required this.price,
      required this.rating,
      required this.image});
}

class NewNotificationPage extends StatefulWidget {
  const NewNotificationPage({super.key});

  @override
  State<NewNotificationPage> createState() => _NewNotificationPageState();
}

class _NewNotificationPageState extends State<NewNotificationPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Ntofication Screen"),
    ));
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
          child: Container(
            width: 100,
            // height: 132,
            height: 105,

            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
