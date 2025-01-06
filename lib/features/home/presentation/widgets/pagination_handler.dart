// import 'package:flutter/material.dart';
//
// class PaginationHandler {
//   final ScrollController scrollController;
//   final Function loadMoreData;
//   final int threshold;
//
//   PaginationHandler({
//     required this.scrollController,
//     required this.loadMoreData,
//     this.threshold = 200,
//   }) {
//     scrollController.addListener(_onScroll);
//   }
//
//   void _onScroll() {
//     // إذا كان المستخدم قد وصل إلى قرب نهاية الصفحة، قم بتحميل المزيد من البيانات
//     if (scrollController.position.pixels >=
//         scrollController.position.maxScrollExtent - threshold) {
//       loadMoreData();
//     }
//   }
//
//   void dispose() {
//     scrollController.removeListener(_onScroll);
//   }
// }
