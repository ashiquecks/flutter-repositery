import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payment_gateway/second_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Razorpay? razorpay;

  bool paymentDone = false;

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay!.clear();
  }

  void handlerPaymentSuccess() {
    print("RAZORPAY PYMENT SUCCUSESS FOR CHANCE APP");
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondPage()));
    });
  }

  void handlerErrorFailure() {
    print("payment error");
  }

  void handlerExternalWallet() {
    print("External wallet");
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_dU5uZeIaR8vR7H",
      "amount": 400,
      "name": "sample app",
      "description": "payment for the random product",
      "prefill": {
        "contact": "8943420919",
        "email": "ashiquecnarippatta@gmail.com"
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Razor Pay"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Payment Amount"),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              openCheckout();
            },
            child: const Text("Pay Now"),
          ),
        ],
      ),
    );
  }
}
