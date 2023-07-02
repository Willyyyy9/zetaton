import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/modules/home/views/home/widgets/wallpaper_item.dart';
import 'package:zetaton/app/modules/search/provider/search_provider.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, _) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => InkWell(
            onTap: () {
              Provider.of<HomeProvider>(context, listen: false)
                  .selectedWallpaperModel = provider.searchWallpapers[index];
              Get.toNamed(Routes.WALLPAPER_DETAILS);
            },
            child: WallpaperItem(
                wallpaperModel: provider.searchWallpapers[index])),
        itemCount: provider.searchWallpapers.length,
      );
    });
  }
}
