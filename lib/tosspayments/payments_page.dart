import 'dart:math';
import 'package:HERMESCAFE/notifications/noti_service.dart';
import 'package:HERMESCAFE/provider/cart_provider.dart';
import 'package:HERMESCAFE/tosspayments/paysuccess_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  // late PaymentWidget _paymentWidget;
  late PaymentWidget paymentWidget;
  PaymentMethodWidgetControl? paymentMethodWidgetControl;
  AgreementWidgetControl? agreementWidgetControl;

  String formatAmount(int amount) {
    final formatter = NumberFormat('#,###');
    return formatter.format(amount);
  }

  String generateOrderId() {
    final prefix = 'HERMES';

    final timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());

    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final randomString =
        List.generate(6, (index) => chars[random.nextInt(chars.length)]).join();

    return '$prefix-$timestamp-$randomString';
  }

  @override
  void initState() {
    super.initState();

    // 토스페이먼츠 위젯 초기화
    paymentWidget = PaymentWidget(
      clientKey: 'test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm',
      customerKey: '_wQw-_mDggDh1RivHlH-1',
    );
    final cart = Provider.of<CartProvider>(context, listen: false);
    String totalAmountStr = cart.totalAmount
        .replaceAll(',', '')
        .replaceAll('원', '');

    // Convert the cleaned string to an integer
    int amountValue = int.parse(totalAmountStr.trim());

    paymentWidget
        .renderPaymentMethods(
          selector: 'methods',
          amount: Amount(
            value: amountValue,
            currency: Currency.KRW,
            country: 'KR',
          ),
          options: RenderPaymentMethodsOptions(variantKey: 'DEFAULT'),
        )
        .then((control) {
          paymentMethodWidgetControl = control;
        });

    // 약관 동의 위젯 렌더링
    paymentWidget.renderAgreement(selector: 'agreement').then((control) {
      agreementWidgetControl = control;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.cartItems.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff37210),
        foregroundColor: Colors.white,
        title: Text(
          '결제하기',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withAlpha(70)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(147, 158, 158, 158),
                            blurRadius: 4,

                            offset: Offset(1, 2),
                          ),
                          BoxShadow(color: Colors.grey.withAlpha(20)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 20),
                            child: Text(
                              '주문내역',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  left: 20,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        item.imagePath,
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              '수량:${item.quantity}개',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '${item.price}원',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 총 결제 금액
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withAlpha(40)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총 결제 금액',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          cart.totalAmount,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff37210),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Payment 메서드 Container
                  PaymentMethodWidget(
                    paymentWidget: paymentWidget,
                    selector: 'methods',
                  ),
                  AgreementWidget(
                    paymentWidget: paymentWidget,
                    selector: 'agreement',
                  ),

                  // 결제 버튼
                  GestureDetector(
                    onTap: () async {
                      String orderId = generateOrderId();
                      final paymentResult = await paymentWidget.requestPayment(
                        paymentInfo: PaymentInfo(
                          orderId: orderId,
                          orderName: '닉네임',
                        ),
                      );

                      if (paymentResult.success != null) {
                        final cart = Provider.of<CartProvider>(
                          // ignore: use_build_context_synchronously
                          context,
                          listen: false,
                        );
                        final items = cart.cartItems.values.toList();

                        final Map<String, dynamic> orderData = {
                          'items': items,
                          'totalAmount': cart.totalAmount,
                          'orderId': orderId,
                          'orderDate': DateTime.now().toString(),
                        };
                        NotiService().showNotification(
                          title: '결제 완료',
                          body: '결제가 완료되었습니다.',
                        );
                        Navigator.pushReplacement(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    PaysuccessPage(orderData: orderData),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 20,
                        right: 20.0,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xfff37210),
                        ),
                        child: Text(
                          ' ${cart.totalAmount} 결제하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
