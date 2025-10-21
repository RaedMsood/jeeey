import 'package:flutter/foundation.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';

import '../../../../../core/network/remote_request.dart';

class ProductDetailsRemoteDataSource {

  ProductDetailsRemoteDataSource();


  Future<ProductData> getDetailsOfProduct(int idProduct) async {

    final response = await RemoteRequest.getData(
      url: "/products/$idProduct",
    );
    debugPrint(response.data['product'].toString(),wrapWidth: 1024);
    return ProductData.fromJson(response.data['product']);
  }
}