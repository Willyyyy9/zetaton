import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/home/models/wallpaper_response.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';

class WallpaperItem extends StatelessWidget {
  const WallpaperItem({super.key, required this.wallpaperModel});
  final WallpaperModel wallpaperModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: wallpaperModel.src.large,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          provider.isWallpaperItemFavourite(wallpaperModel)
              ? const Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.red,
                  ))
              : const SizedBox.shrink()
        ],
      );
    });
  }
}
