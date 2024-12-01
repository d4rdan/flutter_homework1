
// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import '../screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<ClothingItem> clothingItems = [
    ClothingItem(
      id: '1',
      name: 'Classic T-Shirt',
      description: 'Comfortable cotton t-shirt for everyday wear',
      price: 19.99,
      imageUrl: 'assets/images/tshirt.jpeg',
    ),
    ClothingItem(
      id: '2', 
      name: 'Denim Jacket',
      description: 'Stylish blue denim jacket with multiple pockets',
      price: 79.99,
      imageUrl: 'assets/images/denim_jacket.jpeg',
    ),
    ClothingItem(
      id: '3',
      name: 'Wool Sweater',
      description: 'Warm and cozy wool sweater for cold days',
      price: 59.99,
      imageUrl: 'assets/images/sweater.jpg',
    ),
    ClothingItem(
      id: '4',
      name: 'Chino Pants',
      description: 'Versatile chino pants suitable for various occasions',
      price: 49.99,
      imageUrl: 'assets/images/chino_pants.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Index: 216060'), // Replace with your actual index
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: clothingItems[index]),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      clothingItems[index].imageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clothingItems[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$${clothingItems[index].price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

