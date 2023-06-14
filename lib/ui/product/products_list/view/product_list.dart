import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/widgets/dashboard_widget/category_bar_widget.dart';
import 'package:admin_management/common/widgets/dashboard_widget/product_card_widget.dart';
import 'package:admin_management/common/widgets/dashboard_widget/statistic_card_widget.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/product/products_list/view_model/product_list_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);

    var size = MediaQuery.of(context).size;
    return BaseView<ProductListViewModel>(
      onModelReady: (p0) => p0.init(),
      model: ProductListViewModel(productService: locator<ProductService>()),
      builder: (context, value, widget) => value.busy
          ? Center(child: LoadingAnimationWidget.threeRotatingDots(color: AppColors.brown, size: 48))
          : Scaffold(
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        _searchBar(value),
                        SizedBox(
                          width: size.width,
                          //height: 50,
                          child: CategoryBar(controller: controller),
                        ),
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.8,
                          child: TabBarView(controller: controller, children: [
                            _productList(size, context, value),
                            _coffeeList(size, context, value),
                            _sweetList(size, context, value)
                          ]),
                        )
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
                        children: [_profile(size, context), _statisticCardsAndButton(size, context, value)],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Expanded _profile(Size size, BuildContext context) {
    return Expanded(
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
        ));
  }

  Expanded _statisticCardsAndButton(Size size, BuildContext context, ProductListViewModel model) {
    return Expanded(
        flex: 11,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StatisticCard(
                size: size,
                title: "Toplam Ürün",
                counter: model.productList!.length.toString(),
                widget: const Icon(
                  Icons.production_quantity_limits,
                  size: 30,
                ),
              ),
              StatisticCard(
                size: size,
                title: "Toplam Kahve",
                counter: model.coffeeList!.length.toString(),
                widget: const Icon(
                  Icons.coffee,
                  size: 30,
                ),
              ),
              StatisticCard(
                  size: size,
                  title: "Toplam Tatlı",
                  counter: model.sweetList!.length.toString(),
                  widget: const Icon(
                    Icons.cake,
                    size: 30,
                  )),
              const SizedBox(
                height: 8,
              ),
              _addProductButton(size, context)
            ],
          ),
        ));
  }

  Container _addProductButton(Size size, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: size.height * 0.1,
      width: size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brown, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          onPressed: () {
            context.router.push(const UploadProductRoute());
          },
          child: Text(
            "Yeni Ürün Ekle",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.white, fontSize: 20),
          )),
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

  Padding _productList(Size size, BuildContext context, ProductListViewModel value) {
    if (value.searchProducts != null && value.searchProducts!.isNotEmpty) {
      value.productList = value.searchProducts;

      value.sweetList = value.searchProducts!.where((element) => element.isSweet == "sweet").toList();
      value.coffeeList = value.searchProducts!.where((element) => element.isSweet == "coffee").toList();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(value.productList!.length, (index) {
                return ProductCardWidget(
                  value: value,
                  imageUrl: value.productList![index].image!.path,
                  productName: value.productList![index].name.toString(),
                  productDescription: value.productList![index].description!,
                  productPrice: "${value.productList![index].price.toString()} ₺",
                  productModel: value.productList![index],
                  index: index,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Padding _coffeeList(Size size, BuildContext context, ProductListViewModel value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(
                  value.coffeeList!.length,
                  (index) => ProductCardWidget(
                        value: value,
                        imageUrl: value.coffeeList![index].image!.path,
                        productName: value.coffeeList![index].name.toString(),
                        productDescription: value.coffeeList![index].description!,
                        productPrice: "${value.coffeeList![index].price.toString()} ₺",
                        productModel: value.coffeeList![index],
                        index: index,
                      )),
            ),
          ),
        ],
      ),
    );
  }

  Padding _sweetList(Size size, BuildContext context, ProductListViewModel value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(
                  value.sweetList!.length,
                  (index) => ProductCardWidget(
                        value: value,
                        imageUrl: value.sweetList![index].image!.path,
                        productName: value.sweetList![index].name.toString(),
                        productDescription: value.sweetList![index].description!,
                        productPrice: "${value.sweetList![index].price.toString()} ₺",
                        productModel: value.sweetList![index],
                        index: index,
                      )),
            ),
          ),
        ],
      ),
    );
  }

  Padding _searchBar(ProductListViewModel model) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          onChanged: (value) {
            model.searchProduct(value);
          },
          controller: model.searchQueryController,
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
}
