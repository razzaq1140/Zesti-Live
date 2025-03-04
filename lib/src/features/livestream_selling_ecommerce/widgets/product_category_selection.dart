import 'package:flutter/material.dart';
import '../../../common/const/global_variables.dart';

class ProductCategorySelection extends StatelessWidget {
  const ProductCategorySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 44,
            decoration: BoxDecoration(
                color: colorScheme(context).onSurface.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(
            width: double.infinity,
            height: 40,
          ),
          Text('SORT BY', style: textTheme(context).titleSmall),
          _buildSortOption(context, 'Relevance'),
          _buildSortOption(context, 'Price High to Low'),
          _buildSortOption(context, 'Price Low to High'),
          _buildSortOption(context, 'Fastest Shipping'),
          _buildSortOption(context, 'Newest First'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSortOption(BuildContext context, String label) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(label,
          style: textTheme(context).bodyMedium?.copyWith(
              color: colorScheme(context).onSurface.withOpacity(0.5))),
    );
  }
}
