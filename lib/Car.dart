import 'package:flutter/material.dart';

class Car {
  final String name;
  final int modelYear;
  final double price;
  final String imageUrl;

  Car({
    required this.name,
    required this.modelYear,
    required this.price,
    required this.imageUrl,
  });
}

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final List<Car> _cars = [
    Car(
      name: 'Tesla Model S',
      modelYear: 2022,
      price: 79990,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-tesla-model-s-plaid-123-1625778858.jpg',
    ),
    Car(
      name: 'Ford Mustang GT',
      modelYear: 2021,
      price: 37695,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/17q1/674222/2018-ford-mustang-gt-manual-test-review-car-and-driver-photo-677935-s-original.jpg',
    ),
    Car(
      name: 'Porsche 911 Carrera S',
      modelYear: 2022,
      price: 127900,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-porsche-911-carrera-s-cabriolet-101-1625613621.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Screen'),
      ),
      body: ListView.builder(
        itemCount: _cars.length,
        itemBuilder: (BuildContext context, int index) {
          final car = _cars[index];
          return Card(
            child: ListTile(
              leading: Image.network(car.imageUrl),
              title: Text(car.name),
              subtitle: Text('${car.modelYear} - \$${car.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editCar(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteCar(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCar,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addCar() {
    setState(() {
      _cars.add(Car(
        name: 'New Car',
        modelYear: DateTime.now().year,
        price: 0,
        imageUrl: '',
      ));
    });
  }

  void _editCar(int index) {
    // TODO: implement car editing
  }

  void _deleteCar(int index) {
    setState(() {
      _cars.removeAt(index);
    });
  }
}
