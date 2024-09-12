import 'package:flutter/material.dart';
import 'package:login_app/screens/notificationscreen.dart';
import 'package:login_app/screens/otpscreen.dart';
import 'package:login_app/screens/profilescreen.dart';
import 'package:login_app/screens/reportscreen.dart';
import 'package:login_app/screens/settingsscreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await _showExitConfirmation(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 2,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 24),
            onPressed: () async {
              final shouldPop = await _showExitConfirmation(context);
              if (shouldPop == true) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OTPScreen()),
                  (route) => false,
                );
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search, size: 24),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.teal),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUserProfile(),
              SizedBox(height: 20),
              const Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: <Widget>[
                    buildDashboardCard(
                      context,
                      'Profile',
                      Icons.person,
                      ProfilePage(),
                    ),
                    buildDashboardCard(
                      context,
                      'Settings',
                      Icons.settings,
                      SettingsScreen(),
                    ),
                    buildDashboardCard(
                      context,
                      'Notifications',
                      Icons.notifications,
                      NotificationsScreen(),
                    ),
                    buildDashboardCard(
                      context,
                      'Reports',
                      Icons.assessment,
                      ReportPage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _showExitConfirmation(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.teal[50],
        title: const Text(
          'Exit to OTP Screen',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure you want to exit and go back to the OTP screen?',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.teal,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => OTPScreen()),
                (route) => false,
              );
            },
            child: const Text('Exit'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserProfile() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Icon(Icons.person, size: 30, color: Colors.teal),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, User!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Welcome back to your dashboard.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDashboardCard(BuildContext context, String title, IconData icon,
      Widget destinationScreen) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal[300]!, Colors.teal[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Icon(
                  icon,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
