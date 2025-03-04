import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/widgets/live_selling_header.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../pk/widgets/heart_pop.dart';
import '../provider/live_selling_provider.dart';

class LiveSellingScreen extends StatefulWidget {
  const LiveSellingScreen({super.key});

  @override
  State<LiveSellingScreen> createState() => _LiveSellingScreenState();
}

class _LiveSellingScreenState extends State<LiveSellingScreen> {
  final GlobalKey<HeartPopWidgetState> heartPopKey =
      GlobalKey<HeartPopWidgetState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.liveSelling,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                const LiveSellingHeader(),
                const Spacer(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return _buildChatMessage(context);
                    },
                  ),
                ),
                _buildBottomRow(context, heartPopKey),
              ],
            ),
            Consumer<LiveSellingProvider>(
              builder: (context, provider, child) {
                if (!provider.isProductPromoVisible)
                  return const SizedBox.shrink();
                return Positioned(
                  left: 20,
                  bottom: 80,
                  child: ProductPromoContainer(onClose: () {
                    provider.hideProductPromo();
                  }),
                );
              },
            ),
            Positioned(
              right: -90,
              bottom: 50,
              child: IgnorePointer(
                child: HeartPopWidget(
                  key: heartPopKey,
                ),
              ),
            ),
          ],
        ),
        endDrawer: Drawer(
          width: 80,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildProductList(context),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatMessage(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: AppImages.allPopularScreen,
          ),
        ),
      ),
      title: Text(
        'Jane Smith',
        style: textTheme(context).labelSmall?.copyWith(
              color: colorScheme(context).onPrimary,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
      ),
      subtitle: Text(
        'How many colors are available',
        style: textTheme(context).labelSmall?.copyWith(
              letterSpacing: 0,
              color: colorScheme(context).onPrimary,
            ),
      ),
    );
  }

  Widget _buildBottomRow(BuildContext context, GlobalKey heartpopkey) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: CustomTextFormField(
            height: 36,
            hint: 'Write here...',
            hintColor: colorScheme(context).onPrimary,
            borderRadius: 18,
            fillColor: colorScheme(context).surface.withOpacity(0.2),
          ),
        ),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: colorScheme(context).surface.withOpacity(0.2),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.liveSellingForward),
        ),
        const Spacer(),
        Stack(
          children: [
            IconButton.filled(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: colorScheme(context).surface.withOpacity(0.2),
              ),
              icon: SvgPicture.asset(
                AppIcons.liveSellingCart,
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme(context).primary,
                ),
                child: Center(
                  child: Text(
                    '5',
                    style: textTheme(context).labelSmall?.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: colorScheme(context).surface,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        StartAnimationButton(onPressed: () {
          heartPopKey.currentState?.playAnimation();
        })
      ],
    );
  }

  Widget _buildCartIcon(BuildContext context) {
    return Stack(
      children: [
        IconButton.filled(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: colorScheme(context).surface.withOpacity(0.2),
          ),
          icon: SvgPicture.asset(
            AppIcons.liveSellingCart,
            color: colorScheme(context).onSurface,
          ),
        ),
        Positioned(
          right: 12,
          top: 12,
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme(context).primary,
            ),
            child: Center(
              child: Text(
                '5',
                style: textTheme(context).labelSmall?.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: colorScheme(context).surface,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductList(BuildContext context) {
    return SizedBox(
      height: 320,
      width: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _buildProductModal(context);
                },
              );
            },
            child: _buildProductThumbnail(context),
          );
        },
      ),
    );
  }

  Widget _buildProductThumbnail(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: colorScheme(context).surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(height: 72, width: 72, AppImages.postPic),
          ),
          const SizedBox(height: 5),
          Text(
            '\$40',
            style: textTheme(context).labelSmall?.copyWith(
                  fontSize: 10,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductModal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Live Selling',
                style: textTheme(context).titleSmall,
              ),
              const Spacer(),
              _buildCartIcon(context),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductPromoContainer(onClose: () {
                  context.read<LiveSellingProvider>().hideProductPromo();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPromoContainer extends StatelessWidget {
  final VoidCallback onClose;

  const ProductPromoContainer({Key? key, required this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoute.productCardScreen);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(6),
        height: 80,
        width: 300,
        decoration: BoxDecoration(
          border:
              Border.all(color: colorScheme(context).outline.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(8),
          color: colorScheme(context).surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(height: 72, width: 72, AppImages.postPic),
            ),
            const SizedBox(
              width: 4,
            ),
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Black High Neck Crop',
                    overflow: TextOverflow.ellipsis,
                    style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context).onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    'Size: X, M, L, XL',
                    style: textTheme(context).bodySmall?.copyWith(
                          color: colorScheme(context).onSurface,
                        ),
                  ),
                  Text(
                    '\$59',
                    style: textTheme(context).bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme(context).onSurface,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onClose,
                  child: const Icon(
                    Icons.close,
                    size: 14,
                  ),
                ),
                SizedBox(
                  height: 22,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      backgroundColor: colorScheme(context).primary,
                    ),
                    onPressed: () {
                      context.pushNamed(AppRoute.productPage);
                    },
                    child: Text(
                      'Buy Now',
                      style: textTheme(context).labelSmall?.copyWith(
                            color: colorScheme(context).onPrimary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
