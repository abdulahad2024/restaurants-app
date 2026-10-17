import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_toast.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageBottomSheet({
    ImageSource? forcedSource,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    if (forcedSource != null) {
      return await _pickImage(forcedSource, maxWidth, maxHeight, imageQuality);
    }
    ImageSource? source = await Get.bottomSheet<ImageSource>(
      SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take a Photo'),
              onTap: () => Get.back(result: ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from Gallery'),
              onTap: () => Get.back(result: ImageSource.gallery),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );

    if (source == null) return null;
    return await _pickImage(source, maxWidth, maxHeight, imageQuality);
  }

  Future<XFile?> _pickImage(
      ImageSource source,
      double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      ) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: maxWidth ?? 1080,
        maxHeight: maxHeight ?? 1080,
        imageQuality: imageQuality ?? 85,
      );
      return image;
    } catch (e) {


      CustomToast.show(
        context: Get.context!,
        message: "Failed to pick image: ${e.toString()}",
        type: ToastType.success,
      );


      return null;
    }
  }
}