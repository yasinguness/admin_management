import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  final TextEditingController priceText = TextEditingController(text: "15");
  final TextEditingController nameText = TextEditingController(text: "Americano");
  final TextEditingController descriptionText = TextEditingController();
  UpdateProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        width: 400,
        height: 600,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ürün Güncelle",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                "assets/images/GLASS-2.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    //TODO:File işlemleri
                  },
                  child: const Text("Yükle")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: nameText,
                decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: priceText,
                decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: descriptionText,
                maxLines: 4,
                decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    onPressed: () {
                      //TODO:File işlemleri
                    },
                    child: const Text("Yükle")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
