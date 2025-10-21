import 'package:flutter/material.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/presntation/widget/expired_copon_widget.dart';
import '../widget/appbar_copons_widget.dart';
import '../widget/not_used_copon_widget.dart';
import '../widget/used_copon_widget.dart';

class CoponsPage extends StatefulWidget {
  const CoponsPage({super.key});

  @override
  State<CoponsPage> createState() => _CoponsPageState();
}

class _CoponsPageState extends State<CoponsPage>
    with AutomaticKeepAliveClientMixin<CoponsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCoponsWidget(),
        body: const TabBarView(
          children: [
            NotUsedCoponWidget(),
            UsedCoponWidget(),
            ExpiredCoponWidget(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
