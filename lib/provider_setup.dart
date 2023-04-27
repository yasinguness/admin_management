import 'package:admin_management/network/services/api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...independentServices, ...dependentServices, ...uiConsumableProviders];
List<SingleChildWidget> independentServices = [
  Provider<Api>(
    create: (context) => Api(),
  ),
];

List<SingleChildWidget> dependentServices = [];
List<SingleChildWidget> uiConsumableProviders = [];
