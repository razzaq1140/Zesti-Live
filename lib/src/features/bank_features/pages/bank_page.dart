import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_colors.dart';
import '../../../router/go_route.dart';

class BankPage extends StatefulWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  String selectedOption = "Your balance";
  late Map<String, Widget> optionDetails;

  @override
  void initState() {
    super.initState();

    optionDetails = {
      "Your balance": Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColor.tagRed,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Your balance",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rp 32.430.000",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  "Your spent on the month",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Rp 910.400",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      "Transactions History": Expanded(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            final transactionData = [
              {
                "id": "NVX1256SJKL0",
                "date": "1 Aug 2023, 9:13 PM",
                "amount": "Rp 1.200.000"
              },
              {
                "id": "NJK1531SLML0",
                "date": "29 June 2023, 3:16 PM",
                "amount": "Rp 367.000"
              },
              {
                "id": "MLV3525SKNL0",
                "date": "28 June 2023, 7:23 AM",
                "amount": "Rp 56.000"
              },
              {
                "id": "KOPX1256SJIP0",
                "date": "28 June 2023, 8:16 PM",
                "amount": "Rp 83.000"
              },
              {
                "id": "LUX1225SJKL0",
                "date": "27 June 2023, 5:44 AM",
                "amount": "Rp 320.000"
              },
            ][index];

            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactionData["id"]!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      transactionData["date"]!,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                Spacer(),
                Text(transactionData["amount"]!,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            );
          },
        ),
      ),
      "Your account": Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Name",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "Bapack Rete",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Account",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                ".... .... .... 7430",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Status",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "Active",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Valid",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "2020 - 2030",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    };
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){context.pushNamed(AppRoute.faceId);},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Center(
                      child: Text(
                        "5310 ...... .... ....",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 26),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.success);
                          },
                          child: Text(
                            "Bank",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.transfer);
                            },
                            child: SvgPicture.asset(
                              "assets/icons/edit_icon.svg",
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildOption(
                          title: "Your balance",
                          isSelected: selectedOption == "Your balance",
                          onTap: () {
                            setState(() {
                              selectedOption = "Your balance";
                            });
                          },
                        ),
                        buildOption(
                          title: "Transactions History",
                          isSelected: selectedOption == "Transactions History",
                          onTap: () {
                            setState(() {
                              selectedOption = "Transactions History";
                            });
                          },
                        ),
                        buildOption(
                          title: "Your account",
                          isSelected: selectedOption == "Your account",
                          onTap: () {
                            setState(() {
                              selectedOption = "Your account";
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Dynamic Content Display
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Center(
                  child: optionDetails[selectedOption] ??
                      Text("No details available.")),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.all(20), // Increased padding for height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
