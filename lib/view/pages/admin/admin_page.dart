import 'package:coffii/core/constants/color_const.dart';
import 'package:coffii/core/widgets/appbar_widget.dart';
import 'package:coffii/provider/login_provider.dart';
import 'package:coffii/view/pages/admin/home_admin_page.dart';
import 'package:coffii/view/pages/admin/order_admin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Cat Coffee Shop (AdminPanel)',
        context: context,
        function: () {
          context.read<LoginProvider>().signOut(context);
        },
      ),
      body: TabBarView(
        controller: tabController,
        children:  [
          HomeAdminPage(),
          OrderAdminPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        indicatorColor: ColorConst.kPrimary,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.shopping_bag),
            text: 'Orders',
          ),
        ],
      ),
    );
  }
}
