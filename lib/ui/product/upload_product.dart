import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  File? selectedFile;
  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Ürün Ekle",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.brown.shade500),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            width: size.width,
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Upload Coffee",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 50,
                  ),
                  /*  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Upload Product:"),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.file_upload_sharp),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                        ),
                      )
                    ],
                  ) */
                ],
              ),
            ),
          ),
        )
/*           Text(
          "Ürün Ekle",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.brown.shade500),
        ),
        /*             SizedBox(
              height: size.height * 0.5,
            ) */

        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upload Coffee",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Upload Product:"),
                    TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.file_upload_sharp),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                    )
                  ],
                )
              ],
            ),
          ),
        ) */
      ],
    );
  }
}
