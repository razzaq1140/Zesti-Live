import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../widget/dialogue.dart';

class PamanScreen extends StatefulWidget {
  @override
  _PamanScreenState createState() => _PamanScreenState();
}

class _PamanScreenState extends State<PamanScreen> {
  String inputText = ""; // To hold the dynamic input

  void handleInput(String value) {
    setState(() {
      if (value == "⌫") {
        if (inputText.isNotEmpty) {
          inputText = inputText.substring(0, inputText.length - 1);
        }
      } else {
        inputText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10, 10),
                  ),
                ),
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _buildContactCard(
                    color: Colors.yellow[600]!,
                    label: "Ibu Rete",
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Rp 1.200.000",
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Mastercard",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(width: 40),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
              // Number Pad Section
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 55, vertical: 20),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: [
                    for (var value in [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                      "00",
                      "0",
                      "⌫"
                    ])
                      GestureDetector(
                        onTap: () {
                          handleInput(value);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              CustomButton(
                buttonText: 'Transfer',
                onPressed: () {
                  showTransactionFailedDialog(context);
                },
                width: 230,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required Color color,
    required String label,
    bool isSelected = false,
    bool isMoreOption = false,
  }) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
              border: isSelected
                  ? Border.all(
                      color: Colors.orange,
                      width: 2,
                    )
                  : null,
            ),
            child: isMoreOption
                ? Icon(
                    Icons.apps, // Icon for "More"
                    color: Colors.black54,
                    size: 28,
                  )
                : null,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
