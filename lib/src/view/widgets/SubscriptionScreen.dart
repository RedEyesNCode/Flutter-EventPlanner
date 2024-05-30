import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView( // Allow scrolling
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center( // Center the SVG
              child: Image.asset(
        'lib/src/images/ic_credit_card.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Go Premium',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Upgrade to Premium for unlimited access & exclusive benefits.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            SizedBox(height: 20),
            _buildSubscriptionPlan('6 Months', '\$116/month', 'Billed every 6 Months'),

            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {},
              child: Text("Get 6 Months / \$116.00/month"),
            ),

            SizedBox(height: 30),
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildFAQItem('When will I be billed?', 'You will be billed immediately upon selecting a plan.'),
            _buildFAQItem('Does my subscription auto-renew?', 'Yes, your subscription will automatically renew unless you cancel it before the end of the current billing cycle.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionPlan(String duration, String price, String billing) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(duration, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(price, style: TextStyle(fontSize: 16)),
            ],
          ),
          Text(billing, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(answer, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
