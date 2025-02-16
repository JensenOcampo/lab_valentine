import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lab_work_valentine/models/products.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({
    super.key,
    required this.product,
    required this.refresh,
  });

  final Product product;
  final Function refresh;

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.product.isFav = !widget.product.isFav;
              });
              widget.refresh();
            },
            icon: Icon(
              widget.product.isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              controller: TextEditingController(
                text: widget.product.id.toString(),
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Id'),
              ),
            ),
            const Gap(10),
            TextField(
              readOnly: true,
              controller: TextEditingController(
                text: widget.product.description,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
