import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/modules/home/views/home/widgets/wallpaper_item.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class WallpaperList extends StatelessWidget {
  const WallpaperList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => InkWell(
            onTap: () {
              provider.selectedWallpaperModel = provider.wallpapers[index];
              Get.toNamed(Routes.WALLPAPER_DETAILS);
            },
            child: WallpaperItem(wallpaperModel: provider.wallpapers[index])),
        itemCount: provider.wallpapers.length,
      );
    });
  }
}
