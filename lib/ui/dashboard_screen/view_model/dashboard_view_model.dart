import 'package:admin_management/network/model/order.dart';
import 'package:admin_management/network/services/api.dart';
import 'package:admin_management/ui/base/base_model.dart';

class DashboardViewModel extends BaseModel {
  Api? api;

  DashboardViewModel({this.api});
  List<Order>? orders;
  Order? order;
  bool isSelected = false;
  int indexx = 0;

  Future getOrder(String id) async {
    order = await api!.getOrder(id);
    setBusy(false);
  }

  Future fetchOrders() async {
    setBusy(true);
    orders = await api!.fetchOrders();
    getOrder(orders!.first.id!);
    setBusy(false);
  }
}
