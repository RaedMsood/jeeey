import '../../../../core/network/remote_request.dart';
import '../../../home/data/model/section_with_category_of_all_data.dart';
import '../../../home/data/model/section_with_product_data.dart';
import '../model/cat_pro_data.dart';



class CategoryRemoteDataSource {

  CategoryRemoteDataSource();

  Future<CategoryAndProductData> getMainCategoryAndAllProductData(int idCategory,int page) async {
    String id;
    idCategory==0?id='':id=idCategory.toString();

    final response = await RemoteRequest.getData(
      url: "/categories/$id?page=$page&perPage=6",
    );

    //final jsonData = json.decode();
    return CategoryAndProductData.fromJson(response.data);
  }


}