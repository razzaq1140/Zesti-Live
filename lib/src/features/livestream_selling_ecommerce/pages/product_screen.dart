import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/provider/live_selling_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final liveSellingProvider = Provider.of<LiveSellingProvider>(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                icon: SvgPicture.asset(AppIcons.productdetailshare),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(AppIcons.productdetailsend),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: liveSellingProvider.carouselImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage =
                            liveSellingProvider.carouselImages[index];
                        return Image.network(
                          urlImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.error));
                          },
                        );
                      },
                      options: CarouselOptions(
                        height: 400,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) =>
                            liveSellingProvider.updateIndex(index),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: AnimatedSmoothIndicator(
                        activeIndex: liveSellingProvider.activeIndex,
                        count: liveSellingProvider.carouselImages.length,
                        effect: WormEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: colorScheme(context).onSurface,
                          dotColor:
                              colorScheme(context).onSurface.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dark olive',
                        style: textTheme(context).bodySmall?.copyWith(
                            color: colorScheme(context)
                                .onSurface
                                .withOpacity(0.5)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'RUFFLED SATIN SHIRT',
                        style: textTheme(context).headlineSmall,
                      ),
                      const SizedBox(height: 8),

                      // Price Section
                      Row(
                        children: [
                          Text(
                            '\$23.50',
                            style: textTheme(context).headlineSmall?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '\$30',
                            style: textTheme(context).titleSmall?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // TabBar for Product Information
                      DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              labelPadding: EdgeInsets.all(0),
                              indicatorColor: colorScheme(context).primary,
                              labelColor: colorScheme(context).primary,
                              unselectedLabelColor: Colors.grey,
                              unselectedLabelStyle:
                                  textTheme(context).bodyMedium,
                              tabs: const [
                                Tab(text: 'Product info'),
                                Tab(text: 'Additional information'),
                              ],
                            ),
                            SizedBox(
                              height: 200,
                              child: TabBarView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '- Satin shirt with long sleeves\n'
                                      '- Ruffles at the end\n'
                                      '- Button-up front hidden by a placket with ruffles on either side\n'
                                      '- Regular Fit\n'
                                      '- Polyester Fabric\n'
                                      '-Additional care instructions\n'
                                      '- Wash at 30 degrees\n'
                                      '- Do not tumble dry\n',
                                      style: textTheme(context)
                                          .bodyMedium
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onSurface
                                                  .withOpacity(0.5)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '- Satin shirt with long sleeves\n'
                                      '- Ruffles at the end\n'
                                      '- Button-up front hidden by a placket with ruffles on either side\n'
                                      '- Regular Fit\n'
                                      '- Polyester Fabric\n'
                                      '-Additional care instructions\n'
                                      '- Wash at 30 degrees\n'
                                      '- Do not tumble dry\n',
                                      style: textTheme(context)
                                          .bodyMedium
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onSurface
                                                  .withOpacity(0.5)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // More from this shop
                      Text(
                        'More from this shop',
                        style: textTheme(context)
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                                childAspectRatio: 0.76),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.productPage);
                            },
                            child: Card(
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      AppNetworkImages.networkEight,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cotton Satin',
                                          style: textTheme(context).bodyMedium,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text('\$340',
                                                style: textTheme(context)
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontSize: 13,
                                                      color:
                                                          colorScheme(context)
                                                              .primary,
                                                    )),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text('\$22',
                                                style: textTheme(context)
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontSize: 13,
                                                      color:
                                                          AppColor.surfaceGrey,
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
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 80,
            color: Colors.transparent,
            child: CustomButton(
              width: 300,
              onPressed: () {},
              buttonText: 'View on Website',
            ),
          )),
    );
  }
}
