import 'dart:io';

import 'package:coffii/core/constants/color_const.dart';
import 'package:coffii/provider/coffee_upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeAdminPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  XFile? image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, setState) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    height: 500,
                    decoration: BoxDecoration(
                      color: ColorConst.ivory,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Add new coffee',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: nameController,
                        ),
                        TextFormField(
                          controller: priceController,
                        ),
                        const SizedBox(
                          height: 190,
                          // image != null
                          //     ? Image.file(File(image!.path))
                          //     : const Text('Image not uploaded yet!'),
                        ),
                        ElevatedButton(
                          
                          onPressed: () async {
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            context
                                .read<CoffeeUploadProvider>()
                                .uploadImageToStorage(image!, nameController.text);
                            setState(() {});
                          },
                          child: const Text('Upload image'),
                        ),
                        ElevatedButton(
                          child: const Text('Add a coffee to shop'),
                          onPressed: () {
                            context
                                .read<CoffeeUploadProvider>()
                                .uploadCoffeeToDB(
                                    nameController, priceController, context);
                          },
                        ),
                      ],
                    ),
                  );
                });
              });
        },
      ),
    );
  }
}
