import 'package:food_furniture_app/core/base/base_view_model.dart';
import 'package:food_furniture_app/core/enum/view_model_state.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/route/route.dart';
import 'package:food_furniture_app/screens/home/service/home_service.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends BaseViewModel {
  final service = HomeService();
  final appConstants = Provider.of<FlavorConfig>(
          NavigationService.instance.navigatorKey.currentContext!,
          listen: false)
      .appConstants;
  final navigationService = NavigationService.instance;
  List<Product> popularProducts = [];
  List<Product> productByCategory = [];
  List<String> categories = [];
  var selectedCategory = 0;

  @override
  Future<void> init() async {
    final data =
        await service.getFiveRandomProduct(appConstants!.collectionName);
    if (data != null) popularProducts.addAll(data);
    final cat = (await service.getCategories(appConstants!.categories));
    if (cat != null) categories = cat;
    final products = await service.getProductsByCategory(
        appConstants!.collectionName, categories[selectedCategory]);
    if (products != null) productByCategory = products;
    notifyListeners();
  }

  Future changeCategory(int index) async {
    state = ViewModelState.loading;
    selectedCategory = index;
    final products = await service.getProductsByCategory(
        appConstants!.collectionName, categories[selectedCategory]);
    if (products != null) productByCategory = products;
    state = ViewModelState.loaded;
  }

  void navigateToDetail(int index, {bool isFromPopularProduct = false}) {
    navigationService.navigateTo(AppRoute.detail,
        arg: isFromPopularProduct
            ? popularProducts[index]
            : productByCategory[index]);
  }
}
