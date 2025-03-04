// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

// import '../widget/custom_elevated_button.dart';
// import '../widget/textfield.dart';

// class AddDebitCard extends StatefulWidget {
//   const AddDebitCard({super.key});

//   @override
//   State<AddDebitCard> createState() => _AddDebitCardState();
// }

// class _AddDebitCardState extends State<AddDebitCard> {
//   final _formKey = GlobalKey<FormState>();
//   //dropdown option
//   String? selectedValue;
//   List<String> banks = ['Bank 1', 'Bank 2', 'Bank 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 height: 35,
//                 width: 35,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: colorScheme(context).primary,
//                 ),
//                 child: Center(
//                   child: Icon(
//                     Icons.arrow_back_outlined,
//                     color: colorScheme(context).surface,
//                     size: 14, // Adjust icon size to fit
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 100),
//             Text(
//               "Top Up",
//               style: textTheme(context).bodyMedium?.copyWith(
//                   color: colorScheme(context)
//                       .outline
//                       .withOpacity(0.7), // Contrast color
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const Text(
//                   "Add a debit card",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 // Account Name Field with Validation
//                 CustomTextField(
//                   hint: 'Account name',
//                   hintColor: const Color(0xffACBAC3),
//                   obscureText: false,
//                   borderRadius: 30,
//                   validationType: ValidationType.name,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the account name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // Bank Dropdown with Validation
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           selectedValue ?? 'Select Bank',
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       PopupMenuButton<String>(
//                         onSelected: (value) {
//                           setState(() {
//                             selectedValue = value;
//                           });
//                         },
//                         icon: Container(
//                           height: 30,
//                           width: 30,
//                           decoration: const BoxDecoration(
//                             color: Colors.teal,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.white,
//                           ),
//                         ),
//                         itemBuilder: (BuildContext context) {
//                           return banks.map((String bank) {
//                             return PopupMenuItem<String>(
//                               value: bank,
//                               child: Text(bank),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // Account Number Field with Validation
//                 CustomTextField(
//                   hint: 'Account Number',
//                   hintColor: const Color(0xffACBAC3),
//                   borderRadius: 30,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the account number';
//                     }
//                     if (value.length < 10) {
//                       return 'Account number must be at least 10 digits';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // Expire and Security Code Fields with Validation
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CustomTextField(
//                         hint: 'Expire',
//                         hintColor: const Color(0xffACBAC3),
//                         borderRadius: 30,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Enter expiry date';
//                           }
//                           // Add more specific expiry date validation if needed
//                           return null;
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: CustomTextField(
//                         hint: 'Security code',
//                         hintColor: const Color(0xffACBAC3),
//                         borderRadius: 30,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Enter security code';
//                           }
//                           if (value.length != 3) {
//                             return 'Security code must be 3 digits';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 120,
//                 ),
//                 // Add Debit Card Button with Validation
//                 CustomElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       if (selectedValue == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Please select a bank'),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                         return;
//                       }
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => const ConfirmCode(),
//                       //   ),
//                       // );
//                     }
//                   },
//                   text: 'ADD DEBIT CARD',
//                   showIcon: false,
//                   buttonColor: const Color(0xffffff),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';

class AddDebitCard extends StatefulWidget {
  const AddDebitCard({super.key});

  @override
  State<AddDebitCard> createState() => _AddDebitCardState();
}

class _AddDebitCardState extends State<AddDebitCard> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue; // For dropdown
  final List<String> banks = ['Bank 1', 'Bank 2', 'Bank 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme(context).primary,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: colorScheme(context).surface,
                      size: 14, // Adjust icon size to fit
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 100),
              Text(
                "Top Up",
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context)
                        .outline
                        .withOpacity(0.7), // Contrast color
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                 Text(
                  "Add a debit card",
                 style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context)
                        .outline
                        .withOpacity(0.7), // Contrast color
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),
                // Account Name Field
                CustomTextFormField(
                  validationType: ValidationType.name,
                  hint: "Account Name",
                  hintColor: colorScheme(context).outline.withOpacity(0.3),
                  fillColor: colorScheme(context).outline.withOpacity(0.1),
                  borderRadius: 30,
                ),
                const SizedBox(height: 20),
                // Bank Dropdownf
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 50,
                  decoration: BoxDecoration(
                    color: colorScheme(context).outline.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue,
                      hint: Text(
                        'Select Bank',
                        style: TextStyle(
                          color: colorScheme(context).outline.withOpacity(0.3),
                          fontSize: 14,
                        ),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      items: banks.map((String bank) {
                        return DropdownMenuItem<String>(
                          value: bank,
                          child: Text(bank),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Account Number Field
                CustomTextFormField(
                  validationType: ValidationType.number,
                  hint: "Account Number",
                  hintColor: colorScheme(context).outline.withOpacity(0.3),
                  fillColor: colorScheme(context).outline.withOpacity(0.1),
                  borderRadius: 30,
                ),
                const SizedBox(height: 20),
                // Expiry Date and Security Code Fields
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        // validationType: ValidationType.date,
                        hint: "Expire",
                        hintColor: colorScheme(context).outline.withOpacity(0.3),
                        fillColor: colorScheme(context).outline.withOpacity(0.1),
                        borderRadius: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        validationType: ValidationType.number,
                        hint: "Security Code",
                        hintColor: colorScheme(context).outline.withOpacity(0.3),
                        fillColor: colorScheme(context).outline.withOpacity(0.1),
                        borderRadius: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                // Add Debit Card Button
                CustomButton(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colorScheme(context).surface,
                  ),
                  buttonText: "ADD DEBIT CARD",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedValue == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a bank'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      // Handle successful form submission
                      print("Debit card added successfully!");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
