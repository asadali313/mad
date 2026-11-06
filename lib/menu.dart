import 'package:flutter/material.dart';

class Tea {
  const Tea(this.name, this.price, this.color);

  final String name;
  final String price;
  final Color color;
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const teas = [
    Tea('Green Tea', 'Rs. 150', Colors.green),
    Tea('Milk Tea', 'Rs. 120', Colors.brown),
    Tea('Kashmiri Tea', 'Rs. 200', Colors.pink),
    Tea('Black Tea', 'Rs. 100', Colors.black54),
    Tea('Masala Tea', 'Rs. 180', Colors.orange),
  ];

  void orderTea(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Your order is confirmed!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafe Tea Menu'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: teas.map((tea) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: tea.color.withValues(alpha: 0.15),
                    child: Icon(Icons.local_cafe, color: tea.color, size: 32),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tea.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(tea.price),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => orderTea(context),
                    child: const Text('Order'),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
