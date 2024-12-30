import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';

class ImageRepository {
  final Cloudinary cloudinary;
  ImageRepository(this.cloudinary);
  Future<String?> uploadImage(File file) async {
    try {
      var response = await cloudinary.uploader().upload(file);
      return response?.data?.url;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
    return "https://afriksportsmagazine.com/wp-content/uploads/2024/02/C3N09690.webp";
  }
}
