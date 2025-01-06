import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';

import '../../../../../core/network/remote_request.dart';

class ProductDetailsRemoteDataSource {
  ProductDetailsRemoteDataSource();

  Future<ProductData> getDetailsOfProduct(int idProduct) async {
    final response = await RemoteRequest.getData(
      url: "/products/show/$idProduct",
    );

    return ProductData.fromJson(response.data['product']);
  }
}
