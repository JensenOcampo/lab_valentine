import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lab_work_valentine/models/products.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final descCtrl = TextEditingController();
  final idCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Screen',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idCtrl,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Id',
                ),
              ),
            ),
            const Gap(10),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Name',
                ),
              ),
            ),
            const Gap(10),
            TextField(
              controller: descCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Description',
                ),
              ),
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: doAdd,
              child: Text(
                'ADD',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doAdd() {
    if (idCtrl.text.isEmpty || nameCtrl.text.isEmpty || descCtrl.text.isEmpty) {
      return;
    }

    Product newProduct = Product(
      id: int.parse(idCtrl.text),
      name: nameCtrl.text,
      description: descCtrl.text,
      isFav: false,
    );

    Navigator.of(context).pop(newProduct);

    idCtrl.clear();
    nameCtrl.clear();
    descCtrl.clear();
  }
}
