// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, must_be_immutable, camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_bekery/script/firebaseapi.dart';
import 'package:project_bekery/model/product.dart';
import 'package:project_bekery/model/profile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class add_product_order extends StatefulWidget {
  const add_product_order({Key? key}) : super(key: key);

  @override
  _add_product_orderState createState() => _add_product_orderState();
}

class _add_product_orderState extends State<add_product_order> {
  UploadTask? task;
  File? image;
  late String product_name;
  late String product_pice;
  late String product_img;
  String selecttype = '';
  String dropdownValue = 'One';

  Future pickImage() async {
    print("-----------------------------------------------------------------");
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed : $e');
    }
  }

  Future<void> uploadimage() async {
    int i = 0;
    CollectionReference users =
        FirebaseFirestore.instance.collection('product');
    if (image == null) return;
    final filename = basename(image!.path);
    final imagede = 'product_image/$filename';
    task = FirebaseApi.uploadfile(imagede, image!);
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download url : $urlDownload');
    FirebaseFirestore.instance
        .collection('product')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        i++;
        print(i);
        print(doc["product_name"]);
      });
      var uuid = Uuid().toString();
      users.doc(uuid).set({
        "product_id": uuid,
        "product_image": urlDownload,
        "product_name": product_name,
        "product_price": product_pice,
        "product_type": dropdownValue

        /*
        "cart": FieldValue.arrayUnion([{
          "product_id": data['product_id'];
          "product_name": data['product_name'];
          "product_price":data[''];
        }])*/
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('??????????????????????????????????????????????????????'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              image != null
                  ? Image.file(
                      image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/upload.png'),
                    ),
              SizedBox(
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text('???????????????????????????????????????'),
                  onPressed: () => pickImage(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("?????????????????????????????????"),
                  TextFormField(
                    onChanged: (value) {
                      product_name = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("?????????????????????????????????"),
                  TextFormField(
                    onChanged: (value) {
                      product_pice = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                    child: Text('???????????????????????????????????????'),
                    onPressed: () => uploadimage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
