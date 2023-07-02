import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/modules/home/models/wallpaper_response.dart';

class HomeServer {
  Future<Map<String, dynamic>> findAll(String apiLink) async {
    try {
      Dio dio = Dio();
      final response = await dio.get(apiLink,
          options: Options(headers: {"Authorization": Constants.token}));
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future favouriteWallpaper({required WallpaperModel wallpaperModel}) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(Constants.favouriteCollection)
        .doc()
        .set({"userId": uid, ...wallpaperModel.toJson()});
  }

  Future unfavouriteWallpaper({required WallpaperModel wallpaperModel}) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(Constants.favouriteCollection)
        .where("userId", isEqualTo: uid)
        .where("id", isEqualTo: wallpaperModel.id)
        .get();
    for (var element in snapshot.docs) {
      FirebaseFirestore.instance
          .collection(Constants.favouriteCollection)
          .doc(element.id)
          .delete();
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFavouriteWallpapers() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(Constants.favouriteCollection)
        .where("userId", isEqualTo: uid)
        .get();
    return snapshot;
  }
}
