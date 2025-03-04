import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/provider/expansion_tile_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpansionTileProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    color: colorScheme(context).outline.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Payment Method",
                style: textTheme(context).headlineSmall?.copyWith(
                      color: colorScheme(context).onSurface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            SizedBox(height: 20),
            // ExpansionTile 1 - Credit Card
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    // this color when collapsed
                    color: provider.isCreditCardExpanded
                        ? colorScheme(context).primary
                        : colorScheme(context).outline.withOpacity(0.5),
                  )),
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Colors.transparent), // No border when collapsed
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Colors.transparent), // No border when expanded
                ),
                title: Text(
                  "Credit Card",
                  style: textTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                        color: colorScheme(context).onSurface,
                      ),
                ),
                leading: SvgPicture.asset(
                  AppIcons.creditCardIcon,
                  color: colorScheme(context).primary,
                ),
                onExpansionChanged: (value) {
                  provider.toggleCreditCard(value);
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.creditCardIcon,
                        color: colorScheme(context).primary,
                      ),
                      title: Text(
                        "Bank One - 4958",
                        style: textTheme(context).bodyMedium,
                      ),
                      trailing: Radio(
                        value: "Bank One - 4958",
                        groupValue: provider.selectedPaymentMethod,
                        onChanged: (value) {
                          provider.selectPaymentMethod(value as String);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.creditCardIcon,
                        color: colorScheme(context).primary,
                      ),
                      title: Text(
                        "Bank Plus - 4857",
                        style: textTheme(context).bodyMedium,
                      ),
                      trailing: Radio(
                        value: "Bank Plus - 4857",
                        groupValue: provider.selectedPaymentMethod,
                        onChanged: (value) {
                          provider.selectPaymentMethod(value as String);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ExpansionTile 2 - Wallet
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: provider.isWalletExpanded
                          ? colorScheme(context).primary
                          : colorScheme(context).outline.withOpacity(0.5),
                    )),
                child: ExpansionTile(
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: Colors.transparent), // No border when collapsed
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: Colors.transparent), // No border when expanded
                  ),
                  onExpansionChanged: (value) {
                    provider.toggleWallet(value);
                  },
                  title: Text(
                    "Wallet",
                    style: textTheme(context).bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                          color: colorScheme(context).onSurface,
                        ),
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.walletPayIcon,
                    color: colorScheme(context).primary,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          AppIcons.creditCardIcon,
                          color: colorScheme(context).primary,
                        ),
                        title: Text(
                          "Zesti Wallet",
                          style: textTheme(context).bodyMedium,
                        ),
                        trailing: Radio(
                          value: "Zesti Wallet",
                          groupValue: provider.selectedPaymentMethod,
                          onChanged: (value) {
                            provider.selectPaymentMethod(value as String);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ExpansionTile 3 - Payplus
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: provider.isPayplusExpanded
                        ? colorScheme(context).primary
                        : colorScheme(context).outline.withOpacity(0.5),
                  )),
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Colors.transparent), // No border when collapsed
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Colors.transparent), // No border when expanded
                ),
                onExpansionChanged: (value) {
                  provider.togglePayplus(value);
                },
                title: Text(
                  "Payplus",
                  style: textTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                        color: colorScheme(context).onSurface,
                      ),
                ),
                leading: SvgPicture.asset(
                  AppIcons.playPlusIcon,
                  color: colorScheme(context).primary,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.playPlusIcon,
                        color: colorScheme(context).primary,
                      ),
                      title: Text(
                        "Apple Pay",
                        style: textTheme(context).bodyMedium,
                      ),
                      trailing: Radio(
                        value: "Apple Pay",
                        groupValue: provider.selectedPaymentMethod,
                        onChanged: (value) {
                          provider.selectPaymentMethod(value as String);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppIcons.playPlusIcon,
                        color: colorScheme(context).primary,
                      ),
                      title: Text(
                        "Google Pay",
                        style: textTheme(context).bodyMedium,
                      ),
                      trailing: Radio(
                        value: "Google Pay",
                        groupValue: provider.selectedPaymentMethod,
                        onChanged: (value) {
                          provider.selectPaymentMethod(value as String);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
