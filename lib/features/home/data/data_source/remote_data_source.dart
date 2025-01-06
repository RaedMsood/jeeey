import '../../../../core/network/remote_request.dart';
import '../../../home/data/model/section_with_category_of_all_data.dart';
import '../../../home/data/model/section_with_product_data.dart';

class SectionsRemoteDataSource {
  SectionsRemoteDataSource();

  Future<SectionWithCategoryOfAllData> getAllSectionAndAllProductData() async {
    final response = await RemoteRequest.getData(
      url: "/categories/section?page=1&perPage=5",
    );

    return SectionWithCategoryOfAllData.fromJson(response.data);
  }

  Future<SectionAndProductData> getSectionData(int idCategory, int page) async {
    String id;
    idCategory == 0 ? id = '' : id = idCategory.toString();

    final response = await RemoteRequest.getData(
      url: "/categories/section/$idCategory?page=$page&perPage=6",
    );

    return SectionAndProductData.fromJson(response.data);
  }
}
