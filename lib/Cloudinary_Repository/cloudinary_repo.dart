import 'dart:io';
import 'package:dio/dio.dart';

class CloudinaryRepo {
  final Dio _dio;

  CloudinaryRepo({Dio? dio}) : _dio = dio ?? Dio();

  final String cloudName = 'YOUR_CLOUD_NAME';
  final String uploadPreset = 'flutter_upload';

  /// ترفع صورة على Cloudinary وترجع الرابط النهائي
  Future<String?> uploadImage(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: 'profile.jpg'),
        'upload_preset': uploadPreset,
      });

      final response = await _dio.post(
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
        data: formData,
      );

      if (response.statusCode == 200) {
        return response.data['secure_url']; // رابط الصورة
      } else {
        print('Cloudinary upload failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Cloudinary upload error: $e');
      return null;
    }
  }
}