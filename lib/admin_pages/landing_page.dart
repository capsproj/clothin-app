import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minmalecommerce/admin_pages/admin_components/admin_drawer.dart';
import 'package:minmalecommerce/models/shop_model.dart';
import 'package:minmalecommerce/pages/cart_page.dart';
import 'package:minmalecommerce/utils/utils.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();

  static String id = '/Landing_page';

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: AdminDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: Utils.getScreenHeight(context) * 0.025,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Utils.getScreenHeight(context) * 0.015,
            ),
            child: Center(
              child: Text(
                "Add a New Product",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Make it bold
                ),
              ),
            ),
          ),

          // Add a form to add a new product
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              // Add form fields here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await _imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (pickedFile != null) {
                        File? _image = File(pickedFile.path);
                        // Do something with the selected image
                      }
                    },
                    child: Text('Pick an Image'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Name'),
                    // Add validation and controller as needed
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Description'),
                    // Add validation and controller as needed
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Price'),
                    keyboardType: TextInputType.number,
                    // Add validation and controller as needed
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Quantity'),
                    keyboardType: TextInputType.number,
                    // Add validation and controller as needed
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to save the product
                    },
                    child: Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
