import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double _balance = 0.0;

  void _depositMoney(double amount) {
    setState(() {
      _balance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My E-wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    'images/logo.png',
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
              ),
              Text(
                'Current balance:',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '\P$_balance',
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  _depositMoney(10.0);
                },
                child: Text('Deposit \P10'),
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {
                  _depositMoney(50.0);
                },
                child: Text('Deposit \P50'),
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {
                  _depositMoney(100.0);
                },
                child: Text('Deposit \P100'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
