import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_images.dart';
import '../../../router/go_route.dart'; // Import go_router



class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String selectedContact = "Paman"; // Default selected contact
  String selectedPaymentMethod = "Select Payment Method"; // Default selection

  final List<String> dropdownItems = [
    "Bank",
    "PayPal",
    "Google Pay",
    "Apple Pay",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 
          Row(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.sendIcons,
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Transfer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 56, 83, 1),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // Contact Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildContactCard(
                        color: Colors.purple[200]!,
                        label: "Bg Ucup",
                      ),
                      _buildContactCard(
                        color: Colors.yellow[600]!,
                        label: "Paman",
                        isSelected: selectedContact == "Paman",
                      ),
                      _buildContactCard(
                        color: Colors.lightBlue[200]!,
                        label: "Joko",
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoute.topUp);
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Icon(Icons.apps)),
                            SizedBox(height: 8),
                            Text(
                              'More',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Another",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Dropdown for Wallet Section
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            value: selectedPaymentMethod,
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                value: "Select Payment Method",
                                child: Text(
                                  "Bank/e-Wallet",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              ...dropdownItems.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.paman);
                          },
                          child: _buildDropdownTile(label: "Number account")),
                    ],
                  ),
                ),
              ],
            ),
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
      onTap: () {
        // Update the selected contact and navigate
        if (label != "More") {
          setState(() {
            selectedContact = label;
          });
          // Navigate to the next page when a contact is selected
          //  context.go('/nextPage'); // Replace '/nextPage' with your route path
        }
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
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
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownTile({required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }
}
