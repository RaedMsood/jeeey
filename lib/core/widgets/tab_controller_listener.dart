// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// import '../../features/home/data/model/section_with_category_of_all_data.dart';
// import '../state/state_data.dart';
// import 'dart:developer' as developer;
//
// class TabControllerListener {
//   final TabController tabController;
//   final DataState<SectionWithCategoryOfAllData> state;
//
//   final Function(int) onSectionIdChanged;
//
//   TabControllerListener({
//     required this.tabController,
//     required this.state,
//     required this.onSectionIdChanged,
//   });
//
//   void addListener() {
//     tabController.animation!.addListener(() {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         if (tabController.animation != null) {
//           int targetIndex = tabController.animation!.value.round();
//           developer.log('Target index: $targetIndex', name: 'TabController');
//
//           if (targetIndex >= 0 && targetIndex < state.data.section!.length) {
//             developer.log('Setting sectionId: ${state.data.section![targetIndex].id}', name: 'TabController');
//             onSectionIdChanged(state.data.section![tabController.animation!.value.round()].id!);
//           } else {
//             developer.log('Target index is out of range: $targetIndex', name: 'TabController');
//           }
//         } else {
//           developer.log('Animation is null', name: 'TabController');
//         }
//       });
//     });
//   }
// }
