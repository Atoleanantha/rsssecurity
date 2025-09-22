import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService {
  final CloudinaryPublic _cloudinary = CloudinaryPublic(
    'cloud name', // Replace with your Cloudinary cloud name
    'preset',  // Replace with your upload preset
    cache: false,
  );

  /// Upload a file to Cloudinary
  Future<String> uploadFile(File file, {String folder = 'ID cards'}) async {
    try {
      final response = await _cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          resourceType: CloudinaryResourceType.Raw,
          folder: folder,
        ),
      );
      return response.secureUrl; // Return the file's URL
    } catch (e) {
      throw Exception('Cloudinary upload failed: $e');
    }
  }
}
