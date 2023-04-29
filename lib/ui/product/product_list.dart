import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/widgets/category_bar_widget.dart';
import 'package:admin_management/ui/product/update_product.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var categoryList = ["Tümü", "Kahveler", "Tatlılar"];

    var size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(children: [
              _searchBar(),
              SizedBox(
                width: size.width,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categoryList.map((element) {
                      return Expanded(child: CategoryBar(text: element));
                    }).toList()),
              ),
              _productList(size, context)
            ]),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: size.height,
            margin: const EdgeInsets.only(left: 12),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [_profilePic(), _profileName(context)],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        const Divider(
                          thickness: 2,
                        )
                      ],
                    )),
                Expanded(
                    flex: 11,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          StatisticCard(size: size),
                          StatisticCard(size: size),
                          StatisticCard(size: size),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.all(4),
                            height: size.height * 0.1,
                            width: size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                onPressed: () {},
                                child: Text(
                                  "Yeni Ürün Ekle",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontWeight: FontWeight.w400, color: AppColors.white, fontSize: 20),
                                )),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Text _profileName(BuildContext context) {
    return Text(
      "Muhammet Yasin Güneş",
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  Padding _profilePic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(
          "assets/images/pngProf.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Padding _productList(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(15, (index) => _productCart(context)),
            ),
          ),
        ],
      ),
    );
  }

  Padding _searchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
              prefixIcon: Container(
                padding: const EdgeInsets.all(15),
                width: 18,
                child: const Icon(Icons.search),
              )),
        ));
  }

  Stack _productCart(BuildContext context) {
    return Stack(
      children: [_card(context), _deleteButton()],
    );
  }

  Card _card(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(flex: 2, child: _coffeeImage()),
                    Expanded(flex: 1, child: _coffeeName(context)),
                    Expanded(flex: 2, child: _description()),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [_price(context), _button(context)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned _deleteButton() {
    return Positioned(
      top: 12,
      right: 12,
      child: InkWell(
        onTap: () {
          //TODO:Remove işlemleri
        },
        child: Container(
          width: 30,
          height: 30,
          //margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const <BoxShadow>[BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 15)]),
          child: Icon(
            Icons.delete,
            color: Colors.red.shade400,
          ),
        ),
      ),
    );
  }

  Container _coffeeImage() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Image.asset(
        "assets/images/GLASS-2.png",
        width: double.infinity,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  Padding _coffeeName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "Coffee Name",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Text _description() {
    return const Text(
      "Coffee Description asjdjasfasdlkaslfasldlkaskflaslkdaslkdaslkasdlaflkasjdfşlasjfla",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _price(BuildContext context) {
    return Text(
      "15 TL",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  SizedBox _button(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 4,
              backgroundColor: Colors.brown.shade400,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return UpdateProduct();
                },
              );
            },
            child: const Text("Düzenle")));
  }
}

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        color: Colors.yellow,
        child: Container(
          decoration: const BoxDecoration(),
          width: size.width,
          height: size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Toplam Ürün",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.brown, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "24",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 70, 38, 26)),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.coffee,
                    size: 48,
                  ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
