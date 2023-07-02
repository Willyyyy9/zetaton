import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_button.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/modules/home/views/home/widgets/home_bottom_widget.dart';
import 'package:zetaton/app/modules/home/views/home/widgets/logout_dialog.dart';
import 'package:zetaton/app/modules/home/views/home/widgets/wallpaper_list.dart';
import 'package:zetaton/app/resources/app_color.dart';
import 'package:zetaton/app/resources/assets_manager.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).findFirst();
    Provider.of<HomeProvider>(context, listen: false).findfavouriteWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // centerTitle: true,
          title: Image.asset(
            ImageAssets.logo,
            height: 50,
            fit: BoxFit.contain,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.SEARCH);
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColor.accentColor,
                )),
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.FAVOURITE);
                },
                icon: const Icon(
                  FontAwesomeIcons.heart,
                  color: AppColor.accentColor,
                )),
            IconButton(
                onPressed: () {
                  Get.dialog(const LogoutDialog());
                },
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: AppColor.accentColor,
                ))
          ],
        ),
        body: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return Column(
              children: const [
                Expanded(child: WallpaperList()),
                HomeBottomWidget()
              ],
            );
          },
        ),
      );
    });
  }
}
