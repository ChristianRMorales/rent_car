import 'package:flutter/material.dart';
import 'Home.dart';

class ProfileScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final String address;
  final String contact;

  const ProfileScreen({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.address,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
              ),
              SizedBox(height: 16),
              Text('Name: $firstName $lastName'),
              SizedBox(height: 8),
              Text('Gender: $gender'),
              SizedBox(height: 8),
              Text('Address: $address'),
              SizedBox(height: 8),
              Text('Contact Information: $contact'),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward),
            label: Text('Start'),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
