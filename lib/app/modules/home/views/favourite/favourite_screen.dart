import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/modules/home/views/favourite/widgets/favourite_list.dart';
import 'package:zetaton/app/resources/app_color.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Favourites",
          style: TextStyle(
              color: AppColor.accentColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        // title: Image.asset(
        //   ImageAssets.logo,
        //   height: 50,
        //   fit: BoxFit.contain,
        // ),
        iconTheme: const IconThemeData(color: AppColor.accentColor),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return const FavouriteList();
        },
      ),
    );
  }
}
