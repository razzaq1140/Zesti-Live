import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/model/transaction_model.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TopUpSuccessPage extends StatelessWidget {
  final Transaction transaction;

  const TopUpSuccessPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme(context).onPrimary,
                  ),
                  child: Icon(
                    Icons.done_all,
                    color: colorScheme(context).primary,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Top Up Successful!",
                  style: textTheme(context).headlineMedium?.copyWith(
                        color: colorScheme(context).onPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Your top-up has been successfully processed and will appear in your account within 10–20 minutes. Thank you!",
                  style: textTheme(context).bodyMedium?.copyWith(
                      letterSpacing: 0, color: colorScheme(context).onPrimary),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: colorScheme(context).onPrimary.withOpacity(0.1),
                  border: Border.all(color: colorScheme(context).onPrimary),
                ),
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    buildRow(context, "Payment",
                        "\$${transaction.amount.toStringAsFixed(2)}"),
                    buildRow(
                        context, "Payment method", transaction.paymentMethod),
                    buildRow(
                        context, "Transaction ID", transaction.transactionId),
                    buildRow(
                      context,
                      "Date",
                      "${DateFormat('MMMM d, yyyy, hh:mm a').format(transaction.transactionDate)}",
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                buttonText: "Back to Home",
                onPressed: () {
                  context.pop();
                },
                backgroundColor: colorScheme(context).onPrimary,
                textColor: colorScheme(context).onSurface,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textTheme(context).labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  color: colorScheme(context).onPrimary.withOpacity(0.9),
                ),
          ),
          Flexible(
            child: Text(
              value,
              style: textTheme(context).labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    color: colorScheme(context).onPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
