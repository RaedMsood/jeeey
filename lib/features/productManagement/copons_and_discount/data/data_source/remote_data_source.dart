import 'package:jeeey/core/network/urls.dart';

import '../../../../../core/network/remote_request.dart';
import '../../../detailsProducts/data/model/paginated_products_list_data.dart';
import '../model/paginatied_copon_data.dart';

class RemoteCoponDataSource{
  Future<PaginatedCoponList> getCoponsData(int page,int filterType) async {

    final response = await RemoteRequest.getData(
      url: "${AppURL.getAllCopon}?page=$page&perPage=5&filter=$filterType",
    );
    print(response.data);
    return PaginatedCoponList.fromJson(response.data);
  }


  Future<PaginatedProductsList> getProductOfCopon({required int coponId,required int page}) async {


    final response = await RemoteRequest.getData(url: "${AppURL.getAllCopon}/$coponId?page=$page&perPage=10",);
    print(response.data);
    return PaginatedProductsList.fromJson(response.data);
  }
}