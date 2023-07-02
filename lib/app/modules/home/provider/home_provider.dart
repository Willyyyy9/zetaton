import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/modules/home/models/wallpaper_response.dart';
import 'package:zetaton/app/modules/home/network/home_server.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class HomeProvider with ChangeNotifier {
  String findFirstApiLink =
      "https://api.pexels.com/v1/curated?page=0&per_page=10";
  String? findNextApiLink = "";
  String? findPreviousApiLink = "";
  bool isFirstPage = true;
  bool isLastPage = false;
  List<WallpaperModel> wallpapers = [];
  List<WallpaperModel> favouriteWallpapers = [];
  WallpaperResponse? wallpaperResponse;
  WallpaperModel? selectedWallpaperModel;

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.isLoggedIn, false);
    notifyListeners();
  }

  Future findFirst() async {
    wallpapers.clear();
    final response = await HomeServer().findAll(findFirstApiLink);
    wallpaperResponse = WallpaperResponse.fromJson(response);
    wallpapers = wallpaperResponse!.wallpapers;
    if (wallpaperResponse!.page != 1) {
      isFirstPage = false;
    } else {
      isFirstPage = true;
    }
    findNextApiLink = wallpaperResponse!.nextPage;
    findPreviousApiLink = wallpaperResponse!.prevPage;
    if (findNextApiLink != null) {
      isLastPage = false;
    } else {
      isLastPage = true;
    }
    notifyListeners();
  }

  Future findNext() async {
    wallpapers.clear();
    final response = await HomeServer().findAll(findNextApiLink!);

    wallpaperResponse = WallpaperResponse.fromJson(response);
    wallpapers = wallpaperResponse!.wallpapers;
    if (wallpaperResponse!.page != 1) {
      isFirstPage = false;
    } else {
      isFirstPage = true;
    }
    findNextApiLink = wallpaperResponse!.nextPage;
    findPreviousApiLink = wallpaperResponse!.prevPage;
    if (findNextApiLink != null) {
      isLastPage = false;
    } else {
      isLastPage = true;
    }
    notifyListeners();
  }

  Future findPrevious() async {
    wallpapers.clear();
    final response = await HomeServer().findAll(findPreviousApiLink!);
    wallpaperResponse = WallpaperResponse.fromJson(response);
    wallpapers = wallpaperResponse!.wallpapers;
    if (wallpaperResponse!.page != 1) {
      isFirstPage = false;
    } else {
      isFirstPage = true;
    }
    findNextApiLink = wallpaperResponse!.nextPage;
    findPreviousApiLink = wallpaperResponse!.prevPage;
    if (findNextApiLink != null) {
      isLastPage = false;
    } else {
      isLastPage = true;
    }
    notifyListeners();
  }

  Future downloadWallpaper() async {
    try {
      EasyLoading.show(status: "Downloading");
      var imageId = await ImageDownloader.downloadImage(
          selectedWallpaperModel!.src.original,
          destination: AndroidDestinationType.directoryDownloads);
      EasyLoading.dismiss();
      EasyLoading.showSuccess(
          "Download Success\nYour wallpaper is in Downloads Folder.");
      if (imageId == null) {
        return;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future favouriteWallpaper() async {
    EasyLoading.show(status: "Add Wallpaper from Favourites");
    await HomeServer()
        .favouriteWallpaper(wallpaperModel: selectedWallpaperModel!);
    await findfavouriteWallpaper();
    EasyLoading.showSuccess("Added Successfully");
    notifyListeners();
  }

  Future unfavouriteWallpaper() async {
    EasyLoading.show(status: "Remove Wallpaper from Favourites");
    await HomeServer()
        .unfavouriteWallpaper(wallpaperModel: selectedWallpaperModel!);
    await findfavouriteWallpaper();
    EasyLoading.showSuccess("Removed Successfully");
    notifyListeners();
  }

  Future findfavouriteWallpaper() async {
    favouriteWallpapers.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await HomeServer().getFavouriteWallpapers();
    for (var element in snapshot.docs) {
      favouriteWallpapers.add(WallpaperModel.fromJson(element.data()));
    }
    notifyListeners();
  }

  bool isWallpaperFavourite() {
    if (favouriteWallpapers
        .where((element) => element.id == selectedWallpaperModel!.id)
        .isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isWallpaperItemFavourite(WallpaperModel wallpaperModel) {
    if (favouriteWallpapers
        .where((element) => element.id == wallpaperModel.id)
        .isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
