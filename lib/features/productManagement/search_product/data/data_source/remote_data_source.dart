import 'package:jeeey/features/productManagement/search_product/data/model/search_data.dart';
import '../../../../../core/network/remote_request.dart';
import '../../../../category/data/model/cat_pro_data.dart';

class SearchRemoteDataSource {
  SearchRemoteDataSource();

  Future<List<SearchData>> getNameOfInformationSearch(
      String charcterSearch) async {
    final response = await RemoteRequest.getData(
      url: "/categories_by_name?search=$charcterSearch",
    );

    return SearchData.fromJsonSearchList(response.data);
  }

  Future<CategoryAndProductData> getSearchInformation(
      String nameSearch, int page) async {
    final response = await RemoteRequest.getData(
      url: "/categories_search?search=$nameSearch&page=$page&perPage=6",
    );
    print(response.data);

    return CategoryAndProductData.fromJson(response.data);
  }
}
