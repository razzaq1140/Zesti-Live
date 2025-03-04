import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_images.dart';


class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedIndex = 0;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.wallet,
                    ),
                    SizedBox(height: 30),
                    Text("Your Wallet",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("6 Accounts Connected",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            // Balance/Spent section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0; // Balance selected
                      });
                    },
                    child: Column(
                      children: [
                        Text("Balance",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _selectedIndex == 0
                                    ? Colors.black
                                    : Colors.grey)),
                        if (_selectedIndex == 0)
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 20,
                            height: 2,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1; // Spent selected
                      });
                    },
                    child: Column(
                      children: [
                        Text("Spent",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey)),
                        if (_selectedIndex == 1)
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 20,
                            height: 2,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Content Section (Balance or Spent)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: _selectedIndex == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Rp 830.612.467",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("This Month",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 30),
                              _buildDropdownTile(
                                color: Colors.orange,
                                label: "Bank",
                              ),
                              SizedBox(height: 10),
                              _buildDropdownTile(
                                color: Colors.red,
                                label: "Bank",
                              ),
                              SizedBox(height: 10),
                              _buildDropdownTile(
                                color: Colors.purple,
                                label: "Bank",
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              Text("Rp 830.612.467",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("This Month",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 30),
                              _buildDropdownTile(
                                color: Colors.green,
                                label: "Bank",
                              ),
                              SizedBox(height: 10),
                              _buildDropdownTile(
                                color: Colors.yellow,
                                label: "Bank",
                              ),
                              SizedBox(height: 10),
                              _buildDropdownTile(
                                color: Colors.purple,
                                label: "Bank",
                              ),
                            ],
                          )),
              ),
            ),
          ],
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
      onTap: () {},
      child: Container(
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
                Icons.apps,
                color: Colors.black54,
                size: 28,
              )
            : null,
      ),
    );
  }

  Widget _buildDropdownTile({required Color color, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              // color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.elliptical(10, 10),
              ),
            ),
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}
