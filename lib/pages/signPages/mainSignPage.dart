import 'package:flutter/material.dart';
import 'package:salaty/pages/signPages/SignUpPage.dart';
import 'package:salaty/pages/signPages/signInPage.dart';

import '../../components/appBars.dart';

class MainSignPage extends StatefulWidget {
  final int initialIndex;

  const MainSignPage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MainSignPage> createState() => _MainSignPageState();
}

class _MainSignPageState extends State<MainSignPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  void goToOtherPage() {
    _tabController.index = 1 - _tabController.index;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController.index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: SignAppBar(tabController: _tabController),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                SignUpPage(goToOtherPage: goToOtherPage),
                SignInPage(goToOtherPage: goToOtherPage)
              ]),
        ));
  }
}
