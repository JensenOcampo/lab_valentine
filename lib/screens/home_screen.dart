import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_work_valentine/models/products.dart';
import 'package:lab_work_valentine/screens/add_screen.dart';
import 'package:lab_work_valentine/screens/display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () async {
              final newProduct = await Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => AddScreen(),
                ),
              );
              if (newProduct != null && newProduct is Product) {
                setState(() {
                  products.add(newProduct);
                });
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          var prod = products[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => DisplayScreen(
                      product: prod,
                      refresh: refresh,
                    ),
                  ),
                );
              },
              title: Text(prod.name),
              subtitle: Text(prod.description),
              trailing: IconButton(
                onPressed: () {
                  prod.isFav = !prod.isFav;
                  refresh();
                },
                icon: Icon(
                  prod.isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
