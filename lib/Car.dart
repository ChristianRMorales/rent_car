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
      name: 'toyota innova',
      modelYear: 2022,
      price: 2000,
      imageUrl:
          'https://d3ggoe3aghc7um.cloudfront.net/uploads/prices/629/002_629_1618384130703_000.png',
    ),
    Car(
      name: 'Ford Mustang GT',
      modelYear: 2021,
      price: 4000,
      imageUrl:
          'https://www.ford.com.ph/content/dam/Ford/website-assets/ap/ph/nameplate/mustang/5-0L-V8-GT-Premium/thumbnails/5_0L_V8_GT_Premium.jpg',
    ),
    Car(
      name: 'Porsche 911 Carrera S',
      modelYear: 2022,
      price: 1200,
      imageUrl:
          'https://files.porsche.com/filestore/image/multimedia/none/992-carrera-t-modelexplorer/normal/b34fb743-4ede-11ed-80f7-005056bbdc38;sS;twebp065/porsche-normal.webp',
    ),
    Car(
      name: 'Mr bean Car',
      modelYear: 1969,
      price: 1000,
      imageUrl:
          'https://i.ebayimg.com/thumbs/images/g/PHUAAOSwTxhcUbyv/s-l300.jpg',
    ),
    Car(
      name: 'toyota Rush',
      modelYear: 2017,
      price: 1500,
      imageUrl:
          'https://d3ggoe3aghc7um.cloudfront.net/uploads/prices/272/002_272_1662628084188_000.jpg',
    ),
    Car(
      name: 'Toyota Veloz',
      modelYear: 2023,
      price: 1900,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJzcvs01dBJ7q_3CRrxiRJue18lrA9_EXPLg&usqp=CAU',
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _modelYearController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();

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
              subtitle: Text('${car.modelYear} - \P${car.price}  per day'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditCarDialog(index, car);
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

  void _showEditCarDialog(int index, Car car) {
    _nameController.text = car.name;
    _modelYearController.text = car.modelYear.toString();
    _priceController.text = car.price.toString();
    _imageUrlController.text = car.imageUrl;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Car'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _modelYearController,
                    decoration: InputDecoration(
                      labelText: 'Model Year',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a model year';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _imageUrlController,
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an image URL';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _cars[index] = Car(
                      name: _nameController.text,
                      modelYear: int.parse(_modelYearController.text),
                      price: double.parse(_priceController.text),
                      imageUrl: _imageUrlController.text,
                    );
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteCar(int index) {
    setState(() {
      _cars.removeAt(index);
    });
  }
}
