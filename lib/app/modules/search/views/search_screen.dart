import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/search/provider/search_provider.dart';
import 'package:zetaton/app/modules/search/views/widgets/search_bottom_widget.dart';
import 'package:zetaton/app/modules/search/views/widgets/search_field.dart';
import 'package:zetaton/app/modules/search/views/widgets/search_list.dart';
import 'package:zetaton/app/resources/app_color.dart';
import 'package:zetaton/app/resources/assets_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          ImageAssets.logo,
          height: 50,
          fit: BoxFit.contain,
        ),
        iconTheme: const IconThemeData(color: AppColor.accentColor),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, provider, _) {
          return WillPopScope(
            onWillPop: () async {
              provider.searchController.clear();
              provider.wallpaperResponse = null;
              provider.searchWallpapers.clear();
              return true;
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Form(
                key: provider.searchFormKey,
                child: Column(
                  children: [
                    const SearchField(),
                    const Expanded(child: SearchList()),
                    if (provider.wallpaperResponse != null)
                      const SearchBottomWidget()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
