import 'package:flutter/cupertino.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicLinkService {
  static Future<ShortDynamicLink?> _createDynamicLink(
      int productId, String imageUrl, String name, String description) async {
    try {
      final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
        uriPrefix: 'https://devstation.page.link',
        link: Uri.parse('https://devstation.com/detailsProduct/$productId'),
        androidParameters: const AndroidParameters(
          packageName: 'com.devstation.jeeey',
          minimumVersion: 1,
        ),
        iosParameters: const IOSParameters(
          bundleId: 'com.devstation.jeeey',
          minimumVersion: '1.0.1',
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
          title: name,
          description: description,
          imageUrl: Uri.parse(imageUrl),
        ),
      );

      final ShortDynamicLink shortLink =
          await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
      return shortLink;
    } catch (e) {
      debugPrint("❌ خطأ أثناء إنشاء الرابط الديناميكي: $e");
      return null;
    }
  }

  // static Future<File?> _downloadImage(String imageUrl) async {
  //   try {
  //     final tempDir = await getTemporaryDirectory();
  //     final imagePath = '${tempDir.path}/product_image.jpg';
  //     final response = await http.get(Uri.parse(imageUrl));
  //
  //     if (response.statusCode == 200) {
  //       final file = File(imagePath);
  //       await file.writeAsBytes(response.bodyBytes);
  //       return file;
  //     } else {
  //       debugPrint("⚠️ فشل تحميل الصورة من $imageUrl");
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("❌ خطأ أثناء تحميل الصورة: $e");
  //     return null;
  //   }
  // }

  static shareProductOnWhatsApp(String name, String description, int idProduct,
      String image, String price) async {
    final ShortDynamicLink? productLink =
        await _createDynamicLink(idProduct, image, name, description);
    final urlProduct = productLink!.shortUrl;
    String message =
        "السلام عليكم ارغب في الحصول على مزيد من المعلومات حول \n\n🔹 *المنتج*: $name\n *الوصف*: $description\nالسعر ب$price \n*رابط المنتج*: $urlProduct";

    final Uri whatsappUrl = Uri.parse(
        "https://wa.me/+967781436625?text=${Uri.encodeComponent(message)}");

    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      debugPrint("⚠️ لا يمكن فتح واتساب، تحقق من التثبيت.");
    }
  }

  static void shareProduct(BuildContext context, String name,
      String description, int idProduct, String image, String price) async {
    final ShortDynamicLink? productLink =
        await _createDynamicLink(idProduct, image, name, description);
    final urlProduct = productLink!.shortUrl;
    String message =
        "🔹 *$name*\n📝 *$description*\n السعر $price \n .. \n لقد اكتشفت منتجات رائعة على موقع جي jeeey. حيث الجودة والأناقة تلتقيان \n رابط المنتج $urlProduct";

    Share.share(message);
  }
}
