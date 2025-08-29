import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zoom_flutter/features/auth/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Zoom logo
            Image.asset(
              'assets/svg/zoom_logo.svg',
              height: 100,
            ),
            const SizedBox(height: 32),
            // Join Meeting Button
            ElevatedButton.icon(
              icon: const Icon(Icons.meeting_room),
              label: const Text('Join Meeting'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                // TODO: Implement join meeting navigation
              },
            ),
            const SizedBox(height: 16),
            // New Meeting Button
            ElevatedButton.icon(
              icon: const Icon(Icons.videocam),
              label: const Text('New Meeting'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                // TODO: Implement new meeting navigation
              },
            ),
            const SizedBox(height: 16),
            // Schedule Button
            ElevatedButton.icon(
              icon: const Icon(Icons.schedule),
              label: const Text('Schedule'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                // TODO: Implement schedule navigation
              },
            ),
            const SizedBox(height: 16),
            // Share Screen Button
            ElevatedButton.icon(
              icon: const Icon(Icons.screen_share),
              label: const Text('Share Screen'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                // TODO: Implement share screen navigation
              },
            ),
            const SizedBox(height: 16),
            // Sign Out Button
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: Colors.red,
              ),
              onPressed: () async {
                GetIt.I<AuthService>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
