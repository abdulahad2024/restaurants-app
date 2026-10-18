import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_toast.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart'; // কালার কনস্ট্যান্ট ইমপোর্ট করুন

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

    // থিম ডিটেক্ট করা
    final context = Get.context;
    final isDark = context != null
        ? Theme.of(context).brightness == Brightness.dark
        : false;

    ImageSource? source = await Get.bottomSheet<ImageSource>(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColor.darkSurface : AppColor.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(
            color: isDark ? AppColor.darkBorder : AppColor.border,
            width: 1,
          ),
        ),
        child: SafeArea(
          child: Wrap(
            children: [
              // হ্যান্ডেল বার (বটম শিটের ওপরের ছোট টানার দাগ)
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isDark ? AppColor.grey700 : AppColor.grey300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // ক্যামেরা অপশন
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColor.primary,
                  ),
                ),
                title: Text(
                  'Take a Photo',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColor.darkTextPrimary : AppColor.textPrimary,
                  ),
                ),
                subtitle: Text(
                  'Capture a new photo using camera',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? AppColor.darkTextSecondary : AppColor.textSecondary,
                  ),
                ),
                onTap: () => Get.back(result: ImageSource.camera),
              ),

              const Divider(height: 24, indent: 16, endIndent: 16),

              // গ্যালারি অপশন
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.photo_library_outlined,
                    color: AppColor.primary,
                  ),
                ),
                title: Text(
                  'Choose from Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColor.darkTextPrimary : AppColor.textPrimary,
                  ),
                ),
                subtitle: Text(
                  'Pick an image from your device storage',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? AppColor.darkTextSecondary : AppColor.textSecondary,
                  ),
                ),
                onTap: () => Get.back(result: ImageSource.gallery),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // ট্রান্সপারেন্ট রেখে ভেতরের কন্টেইনারে বর্ডার রেডিয়াস দেওয়া হয়েছে
      isScrollControlled: true,
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
      if (Get.context != null) {
        CustomToast.show(
          context: Get.context!,
          message: "Failed to pick image: ${e.toString()}",
          type: ToastType.error, // এরর ক্ষেত্রে success এর বদলে error টাইপ ব্যবহার করা হয়েছে
        );
      }
      return null;
    }
  }
}