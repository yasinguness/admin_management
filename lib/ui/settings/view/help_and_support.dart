import 'package:admin_management/common/constants/colors.dart';
import 'package:flutter/material.dart';

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      child: SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.8,
        child: Stack(
          children: [
            const Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                " Coffee GPT Restaurant Management Panel",
                style: TextStyle(fontSize: 32),
              ),
            ),
            //_backButton(size, context),
            _form(size, context),
          ],
        ),
      ),
    );
  }

/*   Positioned _backButton(Size size, BuildContext context) {
    return Positioned(
      left: size.width * 0.04,
      top: size.width * 0.10,
      child: Container(
        width: size.width * 0.12,
        height: size.height * 0.06,
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 20)], color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
    );
  }
 */
  Positioned _form(Size size, BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20)],
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36))),
        height: size.height * 0.65,
        child: Column(
          children: [
            _title(context),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HelpTextForm(hintText: "Adınızı Soyadınızı Giriniz", labelTitle: "İsim"),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const HelpTextForm(labelTitle: "Email", hintText: "Mail Adresinizi Giriniz"),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  _messageField(context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _sendButton(size)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

/*   static const CameraPosition _kLake = CameraPosition(
      //bearing: 192.8334901395799,
      target: LatLng(41.3314128, 36.2844302),
      //tilt: 59.440717697143555,
      zoom: 16.151926040649414); */
/* 
  Set<Marker> _createMarker() {
    return <Marker>{
      Marker(
          flat: true,
          infoWindow: const InfoWindow(title: "Atakum/Samsun"),
          markerId: const MarkerId("value"),
          position: _kLake.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed))
    };
  } */

  Center _sendButton(Size size) {
    return Center(
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          width: size.width * 0.3,
          height: size.width * 0.03,
          child: ElevatedButton(
            onPressed: () {
              /*  showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => //TODO:EMin misin,
                        ); */
              //_dialog(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                )),
            child: const Text("Gönder", style: TextStyle(color: Colors.white, fontSize: 16)),
          )),
    );
  }

  Column _messageField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text("Mesaj",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)), boxShadow: _boxShadow, color: Colors.white),
          child: const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                //contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 8),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: "Maksimum 120 karakter girebilirsiniz",
              )),
        ),
      ],
    );
  }

  List<BoxShadow> get _boxShadow {
    return [
      const BoxShadow(blurRadius: 10),
    ];
  }

  Padding _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        "Hızlı İletişim",
        style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class HelpTextForm extends StatelessWidget {
  final String labelTitle;
  final String hintText;
  const HelpTextForm({
    Key? key,
    required this.labelTitle,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text(labelTitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration:
              const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 10),
          ]),
          child: TextFormField(
              decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hintText,
          )),
        ),
      ],
    );
  }
}
