import 'package:flutter/material.dart';
import 'song.dart';
import 'song_detail_page.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final List<Song> _songs = [
    Song(id: '1', title: 'Song A', lyrics: 'Lyrics of Song A', translation: 'Interpretation of Song A'),
    Song(id: '2', title: 'Song B', lyrics: 'Lyrics of Song B', translation: 'Interpretation of Song B'),
  ];

  void _addSong(Song song) {
    setState(() {
      _songs.add(song);
    });
  }

  void _editSong(String id, Song updatedSong) {
    setState(() {
      final index = _songs.indexWhere((song) => song.id == id);
      if (index != -1) {
        _songs[index] = updatedSong;
      }
    });
  }

  void _deleteSong(String id) {
    setState(() {
      _songs.removeWhere((song) => song.id == id);
    });
  }

  void _addNewSong() {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _lyricsController = TextEditingController();
    final TextEditingController _translationController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color(0xFF0A0A0A),
        title: Text('Add New Song', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _lyricsController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Lyrics',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _translationController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Interpretation',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              final newSong = Song(
                id: DateTime.now().toString(),
                title: _titleController.text,
                lyrics: _lyricsController.text,
                translation: _translationController.text,
              );
              _addSong(newSong);
              Navigator.pop(context);
            },
            child: Text('Add', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        backgroundColor: Color(0xFF013220),
      ),
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (ctx, index) {
          final song = _songs[index];
          return ListTile(
            title: Text(song.title, style: TextStyle(color: Colors.white)),
            subtitle: Text(song.translation, style: TextStyle(color: Colors.grey)),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteSong(song.id),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailPage(
                    song: song,
                    onEditSong: _editSong,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF013220),
        child: Icon(Icons.add),
        onPressed: _addNewSong,
      ),
    );
  }
}
