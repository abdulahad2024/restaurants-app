import 'package:flutter/material.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';

class RegisterHeaderWidget extends StatelessWidget {
  final double maxHeight;

  const RegisterHeaderWidget({super.key, required this.maxHeight, required this.title, required this.subTitle1, required this.subTitle2, required this.subTitle3});

  final String title, subTitle1, subTitle2, subTitle3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 24),
        ),
        SizedBox(height: maxHeight * 0.02),
         Text(
          title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
        SizedBox(height: AppSize.sm),
        RichText(
          text: TextSpan(
            text:subTitle1,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            children:  [
              TextSpan(
                text: subTitle2,
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: subTitle3,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}