import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  Future<List<Map<String, dynamic>>> fetchPaymentHistory() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    print('현재 로그인한 uid: $uid');

    if (uid == null) return [];

    final snapshot =
        await FirebaseFirestore.instance
            .collection('payments')
            .where('userId', isEqualTo: uid)
            .get();

    print('결제 건 수: ${snapshot.docs.length}');

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결제 내역")),
      body: FutureBuilder(
        future: fetchPaymentHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("결제 내역이 없습니다."));
          }

          final payments = snapshot.data!;

          return ListView.builder(
            itemCount: payments.length,
            itemBuilder: (context, index) {
              final data = payments[index];
              final timestamp = (data['timestamp'] as Timestamp).toDate();
              final dateStr =
                  "${timestamp.year}-${timestamp.month}-${timestamp.day}";
              final items = data['items'] as List<dynamic>;

              final itemNames = items.map((item) => item['name']).join(', ');

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("상품명: ${data['$itemNames']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("결제일: $dateStr"),
                      Text("총 결제 금액: ${data['totalAmount']}"),
                      Text("상품 수: ${items.length}개"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
