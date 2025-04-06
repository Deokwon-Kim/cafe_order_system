// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
// import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
// import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
// import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

// class TicketPayPage extends StatefulWidget {
//   final int? selectedTickets;
//   const TicketPayPage({super.key, required this.selectedTickets});

//   @override
//   State<TicketPayPage> createState() => _TicketPayPageState();
// }

// class _TicketPayPageState extends State<TicketPayPage> {
//   late PaymentWidget paymentWidget;
//   PaymentMethodWidgetControl? paymentMethodWidgetControl;
//   AgreementWidgetControl? agreementWidgetControl;

//   String formatAmount(int amount) {
//     final formatter = NumberFormat('#,###');
//     return formatter.format(amount);
//   }

//   String generateOrderId() {
//     final prefix = 'HERMES';

//     final timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());

//     const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
//     final random = Random();
//     final randomString =
//         List.generate(6, (index) => chars[random.nextInt(chars.length)]).join();

//     return '$prefix-$timestamp-$randomString';
//   }

//   @override
//   void initState() {
//     super.initState();

//     // 토스페이먼트 위젯 초기화
//     paymentWidget = PaymentWidget(
//       clientKey: 'test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm',
//       customerKey: '_wQw-_mDggDh1RivHlH-1',
//     );

//     paymentWidget
//       .renderPaymentMethods(
//         selector: 'methods',
//         amount: Amount(
//           value: selectedTickets,))

//     @override
//     Widget build(BuildContext context) {
//       return const Placeholder();
//     }
//   }
// }
