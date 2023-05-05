import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/product_controller.dart';
import '../model/product.dart';
import 'view_all.dart';

class insert extends StatefulWidget {
  const insert({Key? key}) : super(key: key);

  @override
  State<insert> createState() => _insert();
}

class _insert extends State<insert> {
  final _productController = Get.put(productController());
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text('Inserting data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Inserting data in SQFlite Database',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    hintText: 'Enter Title',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Enter Description',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    // Map<String, String> products = {
                    //   'title': titleController.text,
                    //   'description': descriptionController.text,
                    // };
                    _addToDb();
                  },
                  color: Colors.red[300],
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                  child: const Text('Insert Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addToDb() async {
    int value = await _productController.insertProduct(Product(
      title: titleController.text,
      description: descriptionController.text,
    ));
    print("my id is " + "$value");
    _productController.viewAl();
    Get.to(() => view_all());
  }
}
