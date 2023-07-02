import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_icon_button.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/resources/app_color.dart';
import 'package:zetaton/app/resources/assets_manager.dart';

class WallpaperDetailsScreen extends StatefulWidget {
  const WallpaperDetailsScreen({super.key});

  @override
  State<WallpaperDetailsScreen> createState() => _WallpaperDetailsScreenState();
}

class _WallpaperDetailsScreenState extends State<WallpaperDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Image.asset(
              ImageAssets.logo,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          body: Stack(
            children: [
              Column(children: [
                Expanded(
                    child: CachedNetworkImage(
                  imageUrl: provider.selectedWallpaperModel!.src.original,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ))
              ]),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primaryColor.withOpacity(0.9)),
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(4),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomIconButton(
                            icon: FontAwesomeIcons.download,
                            color: AppColor.lightColor,
                            onTap: () {
                              provider.downloadWallpaper();
                            },
                          ),
                          CustomIconButton(
                            icon: FontAwesomeIcons.solidHeart,
                            color: provider.isWallpaperFavourite() == true
                                ? Colors.red
                                : AppColor.lightColor,
                            onTap: () {
                              if (provider.isWallpaperFavourite() == true) {
                                provider.unfavouriteWallpaper();
                              } else {
                                provider.favouriteWallpaper();
                              }
                            },
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
