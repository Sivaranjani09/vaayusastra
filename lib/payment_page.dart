import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  String _payeeName = 'Vaayusastra';
  String _transactionRef = 'TXN123456';
  double _amount = 0.0;
  String? _selectedPaymentOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Color.fromARGB(255, 27, 23, 84),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Payment Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  _amount = double.parse(value);
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Select Payment Method',
                style: Theme.of(context).textTheme.titleLarge
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  _buildPaymentOption(
                    context,
                    Icons.payment,
                    'UPI',
                    'upi',
                  ),
                  _buildPaymentOption(
                    context,
                    Icons.credit_card,
                    'Credit/Debit Card',
                    'card',
                  ),
                  _buildPaymentOption(
                    context,
                    Icons.account_balance,
                    'Net Banking',
                    'net_banking',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _selectedPaymentOption == null
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            // Proceed with payment logic based on _selectedPaymentOption
                            await _initiateTransaction();
                          }
                        },
                  child: Text('Proceed to Pay'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 27, 23, 84), // Set background color here
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(BuildContext context, IconData iconData, String label, String value) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 48,
        color: Color.fromARGB(255, 27, 23, 84),
      ),
      title: Text(label),
      trailing: _selectedPaymentOption == value ? Icon(Icons.check_circle, color: Colors.green) : null,
      onTap: () {
        setState(() {
          _selectedPaymentOption = value;
        });
      },
    );
  }

  Future<void> _initiateTransaction() async {
    // Simulate payment initiation logic based on _selectedPaymentOption
    // Replace this with your actual payment logic based on the selected option
    switch (_selectedPaymentOption) {
      case 'upi':
        // Handle UPI payment logic
        break;
      case 'card':
        // Handle Credit/Debit Card payment logic
        break;
      case 'net_banking':
        // Handle Net Banking payment logic
        break;
      default:
        // Handle unsupported or default case
        break;
    }

    // For simulation, show a snackbar indicating successful submission
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Proceeded: Amount $_amount')),
    );
  }
}
















// import 'package:flutter/material.dart';

// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _payeeName = 'Vaayusastra';
//   String _transactionRef = 'TXN123456';
//   double _amount = 0.0;
//   String? _selectedPaymentOption;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Enter Payment Details',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Amount',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the amount';
//                   }
//                   _amount = double.parse(value);
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Select Payment Method',
//                 style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black87),
//               ),
//               SizedBox(height: 10),
//               Column(
//                 children: [
//                   _buildPaymentOption(
//                     context,
//                     Icons.payment,
//                     'UPI',
//                     'upi',
//                   ),
//                   _buildPaymentOption(
//                     context,
//                     Icons.credit_card,
//                     'Credit/Debit Card',
//                     'card',
//                   ),
//                   _buildPaymentOption(
//                     context,
//                     Icons.account_balance,
//                     'Net Banking',
//                     'net_banking',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _selectedPaymentOption == null
//                       ? null
//                       : () async {
//                           if (_formKey.currentState!.validate()) {
//                             // Proceed with payment logic based on _selectedPaymentOption
//                             await _initiateTransaction();
//                           }
//                         },
//                   child: Text('Proceed to Pay'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 27, 23, 84),
//                     padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentOption(BuildContext context, IconData iconData, String label, String value) {
//     return ListTile(
//       leading: Icon(
//         iconData,
//         size: 48,
//         color: Color.fromARGB(255, 27, 23, 84),
//       ),
//       title: Text(label),
//       trailing: _selectedPaymentOption == value ? Icon(Icons.check_circle, color: Colors.green) : null,
//       onTap: () {
//         setState(() {
//           _selectedPaymentOption = value;
//         });
//       },
//     );
//   }

//   Future<void> _initiateTransaction() async {
//     // Simulate payment initiation logic based on _selectedPaymentOption
//     // Replace this with your actual payment logic based on the selected option
//     switch (_selectedPaymentOption) {
//       case 'upi':
//         // Handle UPI payment logic
//         break;
//       case 'card':
//         // Handle Credit/Debit Card payment logic
//         break;
//       case 'net_banking':
//         // Handle Net Banking payment logic
//         break;
//       default:
//         // Handle unsupported or default case
//         break;
//     }

//     // For simulation, show a snackbar indicating successful submission
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Payment Proceeded: Amount $_amount')),
//     );
//   }
// }






// import 'package:flutter/material.dart';

// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _payeeName = 'Vaayusastra';
//   String _transactionRef = 'TXN123456';
//   double _amount = 0.0;
//   String? _selectedPaymentOption;
//   List<String> _upiOptions = ['GPay', 'PhonePe', 'PayPal']; // Options for UPI
//   List<String> _netBankingOptions = ['SBI', 'IOB', 'Axis']; // Options for Net Banking

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//         backgroundColor: Color.fromARGB(255, 27, 23, 84),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Enter Payment Details',
//                 style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black87), // Use headline6, and ensure it's not null
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Amount',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the amount';
//                   }
//                   _amount = double.parse(value);
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Select Payment Method',
//                 style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black87), // Use subtitle1, and ensure it's not null
//               ),
//               SizedBox(height: 10),
//               _buildPaymentOptions(),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _selectedPaymentOption == null
//                       ? null
//                       : () async {
//                           if (_formKey.currentState!.validate()) {
//                             await _initiateTransaction();
//                           }
//                         },
//                   child: Text('Proceed to Pay'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 27, 23, 84), // Use primary color
//                     padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentOptions() {
//     switch (_selectedPaymentOption) {
//       case 'upi':
//         return _buildOptionsList(_upiOptions);
//       case 'net_banking':
//         return _buildOptionsList(_netBankingOptions);
//       default:
//         return Container(); // Empty container if no option selected
//     }
//   }

//   Widget _buildOptionsList(List<String> options) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: options.length,
//       itemBuilder: (context, index) {
//         final option = options[index];
//         return ListTile(
//           title: Text(option),
//           onTap: () {
//             setState(() {
//               // Select the option and close the options list
//               _selectedPaymentOption = option;
//             });
//           },
//           trailing: _selectedPaymentOption == option ? Icon(Icons.check_circle, color: Colors.green) : null,
//         );
//       },
//     );
//   }

//   Future<void> _initiateTransaction() async {
//     // Simulate payment initiation logic based on _selectedPaymentOption
//     // Replace this with your actual payment logic based on the selected option
//     switch (_selectedPaymentOption) {
//       case 'upi':
//         // Handle UPI payment logic
//         break;
//       case 'card':
//         // Handle Credit/Debit Card payment logic
//         break;
//       case 'net_banking':
//         // Handle Net Banking payment logic
//         break;
//       default:
//         // Handle unsupported or default case
//         break;
//     }

//     // For simulation, show a snackbar indicating successful submission
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Payment Proceeded: Amount $_amount')),
//     );
//   }
// }
