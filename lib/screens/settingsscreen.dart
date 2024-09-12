import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 2,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, size: 24),
            onPressed: () {
              // Handle help
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildAccountSettings(),
            SizedBox(height: 20),
            _buildAppSettings(),
            SizedBox(height: 20),
            _buildAboutSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSettings() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal[200]!, Colors.teal[400]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text('Account Info', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Handle account info
            },
          ),
          Divider(color: Colors.white60),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.white),
            title: Text('Security', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Handle security settings
            },
          ),
          Divider(color: Colors.white60),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.white),
            title: Text('Notifications', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Handle notifications
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppSettings() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.language, color: Colors.teal),
            title: Text('Language'),
            trailing: Icon(Icons.chevron_right, color: Colors.teal),
            onTap: () {
              // Handle language selection
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.brightness_6, color: Colors.teal),
            title: Text('Theme'),
            trailing: Icon(Icons.chevron_right, color: Colors.teal),
            onTap: () {
              // Handle theme selection
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.data_usage, color: Colors.teal),
            title: Text('Data Usage'),
            trailing: Icon(Icons.chevron_right, color: Colors.teal),
            onTap: () {
              // Handle data usage settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal[300]!, Colors.teal[500]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text('About Us', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Handle about us
            },
          ),
          Divider(color: Colors.white60),
          ListTile(
            leading: Icon(Icons.help, color: Colors.white),
            title: Text('Help & Support', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Handle help & support
            },
          ),
          Divider(color: Colors.white60),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.white),
            title: Text('Feedback', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Handle feedback
            },
          ),
        ],
      ),
    );
  }
}
