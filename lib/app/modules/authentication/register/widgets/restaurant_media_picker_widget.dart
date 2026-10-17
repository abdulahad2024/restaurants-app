import 'dart:io';
import 'package:flutter/material.dart';

class RestaurantMediaPickerWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final File? selectedImage;
  final VoidCallback onTap;
  final bool isCover;

  const RestaurantMediaPickerWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.selectedImage,
    required this.onTap,
    this.isCover = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            height: isCover ? 160 : 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outline,
                width: 1.5,
              ),
              image: selectedImage != null
                  ? DecorationImage(
                image: FileImage(selectedImage!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: selectedImage == null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isCover ? Icons.image_outlined : Icons.add_a_photo_outlined,
                  size: 36,
                ),
                const SizedBox(height: 8),
                Text(
                  isCover ? 'Upload Cover Photo' : 'Upload Logo',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
                : Stack(
              children: [
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow.withValues(alpha: 0.7) ?? Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: colorScheme.onPrimary,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}