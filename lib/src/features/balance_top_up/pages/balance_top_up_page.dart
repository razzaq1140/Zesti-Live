import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/model/transaction_model.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/provider/expansion_tile_provider.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/widgets/expansion_tile_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BalanceTopUpPage extends StatefulWidget {
  const BalanceTopUpPage({super.key});

  @override
  State<BalanceTopUpPage> createState() => _BalanceTopUpPageState();
}

class _BalanceTopUpPageState extends State<BalanceTopUpPage> {
  bool isCreditCardExpanded = false;
  bool isWalletExpanded = false;
  bool isPayplusExpanded = false;
  double selectedAmount = 50.00;
  List<double> amounts = [10.00, 20.00, 30.00, 40.00, 50.00, 60.00];
  void makeTransaction() {
    final provider = Provider.of<ExpansionTileProvider>(context, listen: false);
    if (provider.selectedPaymentMethod.isEmpty) {
      // Show a message if no payment method is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a payment method.")),
      );
      return;
    }

    final transaction = Transaction(
      amount: selectedAmount,
      paymentMethod: provider.selectedPaymentMethod,
      transactionId: "563hhyasdbfsabnroi099asdf", // Example transaction ID
      transactionDate: DateTime.now(),
    );

    context.pushNamed(
      AppRoute.topUpSuccessPage,
      extra: transaction, // Pass transaction as extra data
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpansionTileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
          style: IconButton.styleFrom(
            backgroundColor:
                Theme.of(context).colorScheme.outlineVariant.withOpacity(0.2),
          ),
        ),
        title: Text(
          "Balance Top Up",
          style: textTheme(context).titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                color: colorScheme(context).onSurface,
              ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3,
              ),
              itemCount: amounts.length,
              itemBuilder: (context, index) {
                final amount = amounts[index];
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppImages.dollarIcon, width: 16),
                      SizedBox(width: 6),
                      Text(
                        "\$${amount.toStringAsFixed(2)}",
                        style: textTheme(context).bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.moneyGreen,
                            ),
                      ),
                    ],
                  ),
                  showCheckmark: false,
                  selected: selectedAmount == amount,
                  selectedColor: colorScheme(context).primary.withOpacity(0.2),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedAmount = amount;
                      } else if (selectedAmount == amount) {
                        selectedAmount =
                            0.00; // Reset if the same chip is selected again
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: selectedAmount == amount
                          ? colorScheme(context).primary
                          : colorScheme(context).outline.withOpacity(0.1),
                      width: 1.5,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showAmountBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).outlineVariant,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  border: Border.all(
                    color: colorScheme(context).outline.withOpacity(0.1),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.pencilIcon),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Or, type based on what you need",
                      style: textTheme(context).titleSmall?.copyWith(
                          color: colorScheme(context).onSurface,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment Method",
                  style: textTheme(context).titleMedium?.copyWith(
                        color: colorScheme(context).outline.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ChangeNotifierProvider.value(
                      value: Provider.of<ExpansionTileProvider>(context),
                      child: BottomSheetContent(),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                      color: colorScheme(context).outline.withOpacity(0.1)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.selectedPaymentMethod,
                      style: textTheme(context).bodyLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            letterSpacing: 0,
                          ),
                    ),
                    Icon(
                      Icons.more_horiz,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                makeTransaction();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "Top up",
                      style: textTheme(context).bodyLarge?.copyWith(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                    ),
                    Spacer(),
                    Text(
                      "\$${selectedAmount.toStringAsFixed(2)}",
                      style: textTheme(context).bodyLarge?.copyWith(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    SvgPicture.asset(AppIcons.arrowForwardIcon)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAmountBottomSheet(BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
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
              Text(
                "Enter the amount",
                style: textTheme(context).titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                hint: 'Amount',
              ),
              SizedBox(height: 20),
              CustomButton(
                buttonText: "Submit",
                onPressed: () {
                  final amount = double.tryParse(amountController.text);
                  if (amount != null && amount > 0) {
                    setState(() {
                      selectedAmount = amount;
                      // Unselect all the choice chips after entering custom amount
                      amounts = [10.00, 20.00, 30.00, 40.00, 50.00, 60.00];
                    });
                    Navigator.pop(context); // Close the bottom sheet
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a valid amount.")),
                    );
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
