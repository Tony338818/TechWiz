import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add admin welcome section
            _buildAdminWelcome(),
            const SizedBox(height: 24),

            const Text(
              'User Metrics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120, // Adjust this value as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildMetricCard('Total Users', '10,000', Icons.people),
                  const SizedBox(width: 8),
                  _buildMetricCard('Active Users', '5,500', Icons.people),
                  const SizedBox(width: 8),
                  _buildMetricCard('New Users (7d)', '250', Icons.people),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'App Performance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120, // Adjust this value as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildMetricCard(
                      'Average Session Duration', '8m 30s', Icons.timer),
                  const SizedBox(width: 8),
                  _buildMetricCard(
                      'Crash-free Sessions', '99.5%', Icons.bug_report),
                  const SizedBox(width: 8),
                  _buildMetricCard('App Rating', '4.7 / 5.0', Icons.star),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminWelcome() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Admin!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAdminInfo('Last Login', '2023-04-15 09:30 AM'),
                _buildAdminInfo('Role', 'Super Admin'),
                _buildAdminInfo('Status', 'Active'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
