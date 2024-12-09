import 'package:flutter/material.dart';
import 'song.dart';

class SongDetailPage extends StatefulWidget {
  final Song song;
  final Function(String id, Song updatedSong) onEditSong;

  const SongDetailPage({
    Key? key,
    required this.song,
    required this.onEditSong,
  }) : super(key: key);

  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  late TextEditingController _lyricsController;
  late TextEditingController _translationController;

  @override
  void initState() {
    super.initState();
    _lyricsController = TextEditingController(text: widget.song.lyrics);
    _translationController = TextEditingController(text: widget.song.translation);
  }

  @override
  void dispose() {
    _lyricsController.dispose();
    _translationController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedSong = Song(
      id: widget.song.id,
      title: widget.song.title,
      lyrics: _lyricsController.text,
      translation: _translationController.text,
    );
    widget.onEditSong(widget.song.id, updatedSong);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        backgroundColor: Color(0xFF013220),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lyrics', style: TextStyle(fontSize: 18, color: Colors.white)),
            TextField(
              controller: _lyricsController,
              maxLines: 5,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter lyrics...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Translation', style: TextStyle(fontSize: 18, color: Colors.white)),
            TextField(
              controller: _translationController,
              maxLines: 3,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter translation...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save'),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF013220)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
