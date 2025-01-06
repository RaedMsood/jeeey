import 'package:hive/hive.dart';

import '../../../home/data/model/section_data.dart';
import '../../../home/data/model/section_with_product_data.dart';
import '../../../productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
import '../model/section_with_category_of_all_data.dart';


class SectionLocalDataSource {

  SectionLocalDataSource();

  int cacheExpireTimeInSeconds = 3600;

  Future<void> updateCacheWithPagination(
      List<SectionData> section, PaginatedProductsList products, int idSection, int pageNumber) async {
    try {
      var box = await Hive.openBox('section_${idSection}_page_$pageNumber');
      SectionAndProductData data = SectionAndProductData(sections: section, product: products);
      final DateTime currentTime = DateTime.now();
      await box.put('last_update_time', currentTime.toIso8601String());
      await box.put('section_and_products', data);

      print("Data cached for section $idSection, page $pageNumber");
    } catch (e) {
      print('Error while updating cache: $e');
    }
  }
  Future<SectionAndProductData?> getSectionFromCache(int idSection, int pageNumber) async {
    try {
      var box = await Hive.openBox('section_${idSection}_page_$pageNumber');

      SectionAndProductData? cachedData = box.get('section_and_products');
      String? lastUpdateTimeStr = box.get('last_update_time');

      if (cachedData != null && lastUpdateTimeStr != null) {
        DateTime lastUpdateTime = DateTime.parse(lastUpdateTimeStr);
        final DateTime currentTime = DateTime.now();

        // التحقق من صلاحية البيانات
        if (currentTime.difference(lastUpdateTime).inSeconds > cacheExpireTimeInSeconds) {
          print('Cache expired for section $idSection, page $pageNumber');
          return null;
        }

        print('Loaded data from cache for section $idSection, page $pageNumber');
        return cachedData;
      }

      print('No valid data found in cache for section $idSection, page $pageNumber');
      return null;

    } catch (e) {
      print('Error while getting section from cache: $e');
      return null;
    }
  }

  Future<void> clearCache({int? idSection}) async {
    var box = await Hive.openBox('section_$idSection');
    if (idSection != null) {
      box.keys.where((key) => key.startsWith('${idSection}_')).forEach((key) async {
        await box.delete(key);
      });
      print("Cleared cache for section $idSection");
    } else {
      await box.clear();
      print("Cleared all cache");
    }
  }
}



class CashAllSections {

  Future<SectionWithCategoryOfAllData?> getAllSectionsData()async {

    var box = await Hive.openBox("all_sections");

    SectionWithCategoryOfAllData? cachedData = box.get('sections');
    print("cashed_get");
    return cachedData;
  }

  Future<void> saveSectionData(SectionWithCategoryOfAllData data) async {
    var box = await Hive.openBox("all_sections");
    await box.put("sections", data);
    print("cashed_save");

  }
}
