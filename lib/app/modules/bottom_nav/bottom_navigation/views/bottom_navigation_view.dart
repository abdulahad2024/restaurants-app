import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // আপনার ট্যাবগুলোর স্ক্রিন লিস্ট এখানে যুক্ত করবেন
    final List<Widget> pages = [
      const Center(child: Text('Home Screen')),
      const Center(child: Text('Offers Screen')),
      const Center(child: Text('Orders Screen')),
      const Center(child: Text('Account Screen')),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),

      // মাঝখানের ফ্লোটিং বাটনটি নচের ভেতরে বসানোর জন্য
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onCenterButtonPressed(),
        elevation: 4.0,
        backgroundColor: isDark ? AppColor.darkSurface : AppColor.white,
        shape: const CircleBorder(),
        child: Icon(
          Ionicons.add,
          color: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // কার্ভড বটম অ্যাপ বার (Fully Responsive)
      bottomNavigationBar: Obx(
            () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: isDark ? AppColor.darkBottomNav : AppColor.bottomNav,
          elevation: 10.0,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // বাম পাশের ট্যাবগুলো (Expanded ব্যবহার করে রেসপন্সিভ করা হয়েছে)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(
                          icon:  Ionicons.home,
                          label: 'Home',
                          index: 0,
                        ),
                        _buildNavItem(
                          icon: Icons.local_offer_outlined,
                          label: 'Offers',
                          index: 1,
                        ),
                      ],
                    ),
                  ),

                  // মাঝখানের ফাকা জায়গা (ফ্লোটিং বাটনের জন্য স্পেস)
                  const SizedBox(width: 48),

                  // ডান পাশের ট্যাবগুলো (Expanded ব্যবহার করে রেসপন্সিভ করা হয়েছে)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(
                          icon: Icons.assignment_outlined,
                          label: 'Orders',
                          index: 2,
                        ),
                        _buildNavItem(
                          icon: Icons.person_outline,
                          label: 'Account',
                          index: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // আলাদা আইটেম উইজেট তৈরির হেল্পার মেথড
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = controller.currentIndex.value == index;
    Color activeColor = AppColor.primary;
    Color inactiveColor = AppColor.iconInactive;

    return InkWell(
      onTap: () => controller.changeTab(index),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? activeColor : inactiveColor,
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? activeColor : inactiveColor,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}