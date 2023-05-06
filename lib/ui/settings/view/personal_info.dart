import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  final TextEditingController priceText = TextEditingController(text: "15");
  final TextEditingController nameText = TextEditingController(text: "Americano");
  final TextEditingController descriptionText = TextEditingController();
  PersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        width: 400,
        height: 600,
        child: Column(
          children: [
            _title(size, context),
            const SizedBox(
              height: 16,
            ),
            _image(),
            const SizedBox(
              height: 16,
            ),
            const InfoRow(text: "Muhammet Yasin Güneş", title: "Name - Surname:"),
            const InfoRow(text: "m.yasinguness@gmail.com", title: "E-Mail:"),
            const InfoRow(text: "*******", title: "Password:"),
          ],
        ),
      ),
    );
  }

  SizedBox _image() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        "assets/images/pngProf.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Container _title(Size size, BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.05,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))),
      child: Center(
        child: Text(
          "Personal Info",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String text;
  const InfoRow({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
          ),
        )
      ]),
    );
  }
}
