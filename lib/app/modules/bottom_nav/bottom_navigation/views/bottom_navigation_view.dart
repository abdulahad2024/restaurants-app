import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/modules/authentication/profile/views/profile_view.dart';
import 'package:restaurants_app/app/modules/home/home/views/home_view.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final List<Widget> pages = [
      HomeView(),
      const Center(child: Text('Offers Screen')),
      const Center(child: Text('Orders Screen')),
      ProfileView(),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor:
      isDark ? AppColor.darkScaffold : AppColor.scaffold,
      systemNavigationBarIconBrightness:
      isDark ? Brightness.light : Brightness.dark,
    ),
      child: Scaffold(
        // Tab bodlale halka fade hoye page bodlay
        body: Obx(
              () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: KeyedSubtree(
              key: ValueKey(controller.currentIndex.value),
              child: pages[controller.currentIndex.value],
            ),
          ),
        ),

        // Majhkhaner floating button, notch er bhitore boshe
        floatingActionButton: Container(
          height: 62,
          width: 62,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColor.primary,
                AppColor.primary.withValues(alpha: 0.78),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withValues(alpha: 0.40),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              controller.onCenterButtonPressed();
              print('Floating button pressed');
            },
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            child: const Icon(Ionicons.add, size: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: Obx(
              () => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 9.0,
            color: isDark ? AppColor.darkBottomNav : AppColor.bottomNav,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.black.withValues(alpha: isDark ? 0.6 : 0.25),
            elevation: 14.0,
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 64,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    // Bam pasher tab
                    Expanded(
                      child: Row(
                        children: [
                          _buildNavItem(
                            icon: Ionicons.home,
                            activeIcon: Ionicons.home,
                            label: 'Home',
                            index: 0,
                          ),
                          _buildNavItem(
                            icon: Ionicons.pricetag,
                            activeIcon: Ionicons.pricetag,
                            label: 'Offers',
                            index: 1,
                          ),
                        ],
                      ),
                    ),

                    // Majhkhaner faka jayga (floating button er jonno)
                    const SizedBox(width: 56),

                    // Dan pasher tab
                    Expanded(
                      child: Row(
                        children: [
                          _buildNavItem(
                            icon: Ionicons.restaurant,
                            activeIcon: Ionicons.receipt,
                            label: 'Orders',
                            index: 2,
                          ),
                          _buildNavItem(
                            icon: Ionicons.person,
                            activeIcon: Ionicons.person,
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
      ),
    );
  }

  // Alada nav item widget er helper method
  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = controller.currentIndex.value == index;
    const Color activeColor = AppColor.primary;
    final Color inactiveColor = AppColor.iconInactive;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isSelected) HapticFeedback.selectionClick();
          controller.changeTab(index);
        },
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              height: 30,
              width: isSelected ? 52 : 30,
              decoration: BoxDecoration(
                color: isSelected
                    ? activeColor.withValues(alpha: 0.14)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                isSelected ? activeIcon : icon,
                color: isSelected ? activeColor : inactiveColor,
                size: 22,
              ),
            ),
            const SizedBox(height: 2),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                color: isSelected ? activeColor : inactiveColor,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}