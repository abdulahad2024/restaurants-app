import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProfileController());


    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Profile'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = controller.userProfile.value;

        if (user == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No profile data found'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => controller.fetchUserProfile(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover & Logo Section
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                      image: user.coverImageUrl != null
                          ? DecorationImage(
                        image: NetworkImage(
                            "https://your-domain.com${user.coverImageUrl}"), // আপনার বেস ইউআরএল যুক্ত করবেন
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: user.restaurantLogoUrl != null
                          ? NetworkImage(
                          "https://your-domain.com${user.restaurantLogoUrl}")
                          : null,
                      child: user.restaurantLogoUrl == null
                          ? const Icon(Ionicons.restaurant, size: 36)
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Restaurant Name & Status
              Center(
                child: Text(
                  user.restaurantName ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Chip(
                  label: Text(
                    user.restaurantStatus?.toUpperCase() ?? 'PENDING',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor: user.restaurantStatus == 'active'
                      ? Colors.green
                      : Colors.orange,
                ),
              ),
              const SizedBox(height: 24),

              // User & Restaurant Details Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildInfoRow(Ionicons.person, 'Owner Name', user.name ?? 'N/A'),
                      const Divider(height: 20),
                      _buildInfoRow(Ionicons.mail, 'Email', user.email ?? 'N/A'),
                      const Divider(height: 20),
                      _buildInfoRow(Ionicons.call, 'Phone', user.phone ?? 'N/A'),
                      const Divider(height: 20),
                      _buildInfoRow(Ionicons.location, 'Address', user.restaurantAddress ?? 'N/A'),
                      const Divider(height: 20),
                      _buildInfoRow(Ionicons.document, 'Description', user.restaurantDescription ?? 'N/A'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}