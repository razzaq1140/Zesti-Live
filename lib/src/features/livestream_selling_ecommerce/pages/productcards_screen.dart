import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

import '../widgets/product_category_selection.dart';

class ProductGridScreen extends StatelessWidget {
  // Sample product data
  final List<Map<String, String>> products = [
    {
      'name': 'Printed crop top',
      'image': AppNetworkImages.networkOne,
      'price': '\$23.50',
      'originalPrice': '\$30',
    },
    {
      'name': 'Stripe knit top',
      'image': AppNetworkImages.networkTwo,
      'price': '\$23.50',
      'originalPrice': '\$30',
    },
    {
      'name': 'Ruffled satin shirt',
      'image': AppNetworkImages.networkThree,
      'price': '\$23.50',
      'originalPrice': '\$30',
    },
    {
      'name': 'Ruffled satin shirt',
      'image': AppNetworkImages.networkFour,
      'price': '\$23.50',
      'originalPrice': '\$30',
    },
    {
      'name': 'V-neck top',
      'image': AppNetworkImages.networkFive,
      'price': '\$23.50',
      'originalPrice': '\$30',
    },
    {
      'name': 'V-neck top',
      'image': AppNetworkImages.networkSix,
      'price': '\$23.50',
      'originalPrice': '\$30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Tops for women',
          style: textTheme(context).titleSmall,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return const ProductCategorySelection();
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: colorScheme(context).onSurface.withOpacity(0.5))),
              child: Row(
                children: [
                  Text(
                    'sort',
                    style: textTheme(context).labelSmall?.copyWith(
                        color: colorScheme(context).onSurface.withOpacity(0.5)),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined,
                      size: 12,
                      color: colorScheme(context).onSurface.withOpacity(0.5)),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.76),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                context.pushNamed(AppRoute.productPage);
              },
              child: Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Expanded(
                      child: Image.network(
                        product['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    // Product Info
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name']!,
                            style: textTheme(context).bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(product['price']!,
                                  style:
                                      textTheme(context).bodyMedium?.copyWith(
                                            fontSize: 13,
                                            color: colorScheme(context).primary,
                                          )),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(product['originalPrice']!,
                                  style:
                                      textTheme(context).bodyMedium?.copyWith(
                                            fontSize: 13,
                                            color: colorScheme(context)
                                                .onSurface
                                                .withOpacity(0.5),
                                          )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
