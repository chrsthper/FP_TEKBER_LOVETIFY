import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  final int streams = 1500;
  final int minutesStreamed = 3500;
  final int averageStreamsPerDay = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
        backgroundColor: Color(0xFF013220),
      ),
      body: _buildStatsPage(),
    );
  }

  Widget _buildStatsPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Listening Stats',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildStatItem(Icons.play_arrow, 'Total Streams', streams.toString()),
                    _buildStatItem(Icons.access_time, 'Minutes Streamed', minutesStreamed.toString()),
                    _buildStatItem(Icons.calendar_today, 'Avg Streams/Day', averageStreamsPerDay.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(value, style: TextStyle(fontSize: 18)),
    );
  }
}