import 'package:flutter/material.dart';

class TileListPage extends StatelessWidget {
  const TileListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tile List')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.coffee),
            title: Text('Coffee'),
            subtitle: Text('Freshly brewed coffee'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Cake'),
            subtitle: Text('A sweet treat'),
          ),
          ListTile(
            leading: Icon(Icons.local_pizza),
            title: Text('Pizza'),
            subtitle: Text('Baked with fresh toppings'),
          ),
          ListTile(
            leading: Icon(Icons.icecream),
            title: Text('Ice cream'),
            subtitle: Text('A cool dessert'),
          ),
          ListTile(
            leading: Icon(Icons.local_cafe),
            title: Text('Tea'),
            subtitle: Text('A warm cup of tea'),
          ),
        ],
      ),
    );
  }
}
