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
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text('Add New Song', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(_titleController, 'Title'),
            SizedBox(height: 10),
            _buildTextField(_lyricsController, 'Lyrics'),
            SizedBox(height: 10),
            _buildTextField(_translationController, 'Interpretation'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1DB954),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
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
            child: Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[400]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        backgroundColor: Color(0xFF1DB954),
      ),
      body: _songs.isEmpty
          ? Center(
              child: Text(
                'No songs available. Add some!',
                style: TextStyle(color: Colors.grey[500], fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _songs.length,
              itemBuilder: (ctx, index) {
                final song = _songs[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    title: Text(song.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text(song.translation, style: TextStyle(color: Colors.grey[400])),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
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
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF1DB954),
        icon: Icon(Icons.add),
        label: Text('New Song'),
        onPressed: _addNewSong,
      ),
    );
  }
}
