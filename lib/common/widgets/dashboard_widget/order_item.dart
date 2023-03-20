import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, this.onTap, this.assetName, this.coffePrice, this.treatPrice, this.isSelected = false});
  final void Function()? onTap;
  final String? assetName;
  final double? coffePrice;
  final double? treatPrice;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 80,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: ClipPath(
            clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Container(
              decoration: isSelected
                  ? const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.blueAccent, width: 5),
                      ),
                    )
                  : const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Order ID",
                          ),
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.access_time_filled, size: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text("Sipariş Tarihi"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Text("25 TL",
                        style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
