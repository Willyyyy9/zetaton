import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zetaton/app/modules/home/models/wallpaper_response.dart';
import 'package:zetaton/app/modules/search/network/search_server.dart';

class SearchProvider with ChangeNotifier {
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  String? searchNextApiLink = "";
  String? searchPreviousApiLink = "";
  bool isFirstPage = true;
  bool isLastPage = false;
  List<WallpaperModel> searchWallpapers = [];
  WallpaperResponse? wallpaperResponse;

  Future searchFirst() async {
    if (searchFormKey.currentState!.validate()) {
      EasyLoading.show(status: "Loading");
      String searchFirstApiLink =
          "https://api.pexels.com/v1/search?query=${searchController.text}&per_page=10&page=1";
      searchWallpapers.clear();
      final response = await SearchServer().search(searchFirstApiLink);
      wallpaperResponse = WallpaperResponse.fromJson(response);
      searchWallpapers = wallpaperResponse!.wallpapers;
      if (wallpaperResponse!.page != 1) {
        isFirstPage = false;
      } else {
        isFirstPage = true;
      }
      searchNextApiLink = wallpaperResponse!.nextPage;
      searchPreviousApiLink = wallpaperResponse!.prevPage;
      if (searchNextApiLink != null) {
        isLastPage = false;
      } else {
        isLastPage = true;
      }
    }
    EasyLoading.dismiss();
    notifyListeners();
  }

  Future searchNext() async {
    EasyLoading.show(status: "Loading");

    searchWallpapers.clear();
    final response = await SearchServer().search(searchNextApiLink!);

    wallpaperResponse = WallpaperResponse.fromJson(response);
    searchWallpapers = wallpaperResponse!.wallpapers;
    if (wallpaperResponse!.page != 1) {
      isFirstPage = false;
    } else {
      isFirstPage = true;
    }
    searchNextApiLink = wallpaperResponse!.nextPage;
    searchPreviousApiLink = wallpaperResponse!.prevPage;
    if (searchNextApiLink != null) {
      isLastPage = false;
    } else {
      isLastPage = true;
    }
    EasyLoading.dismiss();
    notifyListeners();
  }

  Future searchPrevious() async {
    EasyLoading.show(status: "Loading");

    searchWallpapers.clear();
    final response = await SearchServer().search(searchPreviousApiLink!);
    wallpaperResponse = WallpaperResponse.fromJson(response);
    searchWallpapers = wallpaperResponse!.wallpapers;
    if (wallpaperResponse!.page != 1) {
      isFirstPage = false;
    } else {
      isFirstPage = true;
    }
    searchNextApiLink = wallpaperResponse!.nextPage;
    searchPreviousApiLink = wallpaperResponse!.prevPage;
    if (searchNextApiLink != null) {
      isLastPage = false;
    } else {
      isLastPage = true;
    }
    EasyLoading.dismiss();
    notifyListeners();
  }
}
