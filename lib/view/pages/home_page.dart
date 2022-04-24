import 'package:coffii/core/constants/color_const.dart';
import 'package:coffii/core/widgets/appbar_widget.dart';
import 'package:coffii/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Cat Coffee Shop',
        context: context,
        function: () {
          context.read<LoginProvider>().signOut(context);
        },
      ),
    );
  }
}
