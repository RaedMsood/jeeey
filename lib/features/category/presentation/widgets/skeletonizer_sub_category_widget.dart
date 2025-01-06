import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/flash_bar_helper.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';

class SkeletonizerSubCategoryWidget extends StatelessWidget {
  const SkeletonizerSubCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SkeletonizerWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 110.h,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) =>  Row(
                    children: [
                      Container(
                        color: Colors.red,
                        width: 70.w,
                        height: 80.h,
                      ),
                      10.horizontalSpace,
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 10.h,
                color: Colors.red,
              ),
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) =>  Row(
                    children: [
                      Container(
                        color: Colors.red,
                        width: 70.w,
                        height: 30.h,
                      ),
                      25.horizontalSpace,
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) =>  Row(
                    children: [
                      Container(
                        color: Colors.red,
                        width: 110.w,
                        height: 30.h,
                      ),
                      20.horizontalSpace,
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: 500.h,
                child:   Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.red,
                                  width:MediaQuery.sizeOf(context).width/2,
                                  height: 200.h,
                                ),
                                2.verticalSpace,
                                Container(
                                  color: Colors.red,
                                  width:MediaQuery.sizeOf(context).width/2,
                                  height: 20.h,
                                ),
                              ],
                            ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.red,
                                width:MediaQuery.sizeOf(context).width/2,
                                height: 200.h,
                              ),
                              2.verticalSpace,
                              Container(
                                color: Colors.red,
                                width:MediaQuery.sizeOf(context).width/2,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.red,
                                width:MediaQuery.sizeOf(context).width/2,
                                height: 200.h,
                              ),
                              2.verticalSpace,
                              Container(
                                color: Colors.red,
                                width:MediaQuery.sizeOf(context).width/2,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.red,
                                width:MediaQuery.sizeOf(context).width/2,
                                height: 200.h,
                              ),
                              2.verticalSpace,
                              Container(
                                color: Colors.red,
                                width:MediaQuery.sizeOf(context).width/2,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          
                )
            ],
          ),
        ),
      ),
    );
  }
}
