import 'package:get_it/get_it.dart';
import 'core/local/secure_storage.dart';
import 'features/address/data/repos/address_repo.dart';
import 'features/productManagement/reviews/data/repos/reviews_repo.dart';
import 'features/profile/myOrders/data/repos/order_repo.dart';
import 'features/shoppingBag/cart/data/repos/cart_repo.dart';
import 'features/user/data/repos/user_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => WingsSecureStorage('uC3":%}ek10bE@6q'));

  sl.registerLazySingleton(() => UserReposaitory());
  sl.registerLazySingleton(() => AddressReposaitory());
  sl.registerLazySingleton(() => CartReposaitory());
  sl.registerLazySingleton(() => OrderReposaitory());
  sl.registerLazySingleton(() => ReviewsReposaitory());
}
