import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class ProductCard extends StatefulWidget {
  final product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false; // Track whether the product is favorited or not

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 173,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Product image
          Stack(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.imagePath,
                    placeholder: (context, url) => Center(
                      child:
                          CircularProgressIndicator(), // Optional: Replace with a custom loader
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error, color: Colors.red), // Error icon
                    ),
                    fit: BoxFit.fill, // Ensures the UI remains the same
                  ),
                ),
              ),
              // Discount tag
              Positioned(
                right: 8,
                child: ClipPath(
                  clipper: TagClipper(),
                  child: Container(
                    height: 51,
                    width: 42,
                    color: AppColor.pureOrange,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Column(
                      children: [
                        Text(
                          'Disc',
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 10,
                                color: colorScheme(context)
                                    .surface, // Visible color
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          '${widget.product.discountPercentage}%',
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 12,
                                color: colorScheme(context)
                                    .surface, // Visible color
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 12, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 12,
                        color: colorScheme(context)
                            .outline
                            .withOpacity(0.5), // Visible color
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 4,
                ),
                // Pricing
                Row(
                  children: [
                    Text(
                      '\$${widget.product.discountedPrice}',
                      style: textTheme(context).bodySmall?.copyWith(
                            fontSize: 14,
                            color:
                                colorScheme(context).primary, // Visible color
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Original price with line-through
                    Text(
                      '\$${widget.product.originalPrice}',
                      style: textTheme(context).bodySmall?.copyWith(
                            fontSize: 10,
                            color:
                                colorScheme(context).outline, // Visible color
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Spacer(),
                    // Heart icon (for favorites)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite; // Toggle favorite status
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        // color: Colors.red,
                        color: isFavorite
                            ? Colors.red
                            : Colors.grey, // Toggle color

                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Start at the top-left corner
    path.lineTo(0, 0);

    // Go to the top-right corner
    path.lineTo(size.width, 0);

    // Go to the bottom-right corner (straight line)
    path.lineTo(size.width, size.height - 10);

    // Create the inward indentation at the bottom center
    path.lineTo(size.width / 2, size.height - 16); // Right inward point
    // path.lineTo(size.width / 2 - 10, size.height - 20); // Left inward point

    // Go to the bottom-left corner (straight line)
    path.lineTo(0, size.height - 10);

    // Close the path to complete the shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
