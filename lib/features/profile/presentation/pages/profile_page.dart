import 'package:my_campus/core/exported_files/core_export.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_tile.dart';
import '../widgets/profile_section.dart';


class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const ProfileHeader(
                name: 'Sadikur Rahman',
                email: 'sadikur@example.com',
                studentId: 'CSE-2026-001',
              ),

              const SizedBox(height: 32),

              ProfileSection(
                title: 'Account',
                children: [
                  ProfileMenuTile(
                    icon: Icons.person_outline_rounded,
                    title: 'Edit Profile',
                    subtitle: 'Update your personal information',
                    onTap: controller.editProfile,
                  ),

                  ProfileMenuTile(
                    icon: Icons.lock_outline_rounded,
                    title: 'Change Password',
                    subtitle: 'Update your account password',
                    onTap: controller.changePassword,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              ProfileSection(
                title: 'Preferences',
                children: [
                  ProfileMenuTile(
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    subtitle: 'Manage notification preferences',
                    onTap: () {},
                  ),

                  ProfileMenuTile(
                    icon: Icons.language_rounded,
                    title: 'Language',
                    subtitle: 'English',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              ProfileSection(
                title: 'Support',
                children: [
                  ProfileMenuTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Support',
                    onTap: () {},
                  ),

                  ProfileMenuTile(
                    icon: Icons.info_outline_rounded,
                    title: 'About MyCampus',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              ProfileMenuTile(
                icon: Icons.logout_rounded,
                title: 'Logout',
                iconColor: AppColors.error,
                onTap: controller.logout,
              ),

              const SizedBox(height: 16),

              Text(
                'MyCampus v1.0.0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
