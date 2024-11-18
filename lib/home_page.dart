import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Blackbird",
      "artist": "The Beatles",
      "lyrics": """
Blackbird singing in the dead of night
Take these broken wings and learn to fly
All your life
You were only waiting for this moment to arise
Blackbird singing in the dead of night
Take these sunken eyes and learn to see
All your life
You were only waiting for this moment to be free  
""",
 "imageUrl": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAclBMVEX////+//7+/f75+vj49vXe2djx7+/m4uGsoJ6WiofW0c/Jw8D08vHr6un9//2LfXjEvbvAuLSimpebkIuglJGRgn3SzsuwpqW8s7GAb2iBb2yBcm6nmpeYh4XPyMd8amaxqaWPe3l1Y12ThINzYl16aWYUiLmMAAABu0lEQVR4nO3V7Y6bMBBA0THY2BgITgIJEL6S7b7/K9ZsG2mj9kejSk1XugfJyGOEZiRrRgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHiTxEVGfIupH+GNVD+EkSbXWor3ZJf8wxb+jHl4fMmNMJnYO+yBiD9oem6Y9nbt45PphcOllbCf1u5/9n3Q+HevzeLrvlcyLOy46XLouVuiWoL3LrXbneOjWuPghlSJ9WcJPS03RW90UhRfdrTreS3+Vsi+Lt7LKZLfM152ESWR18eO1zutCNbfL/tVpPyER26dymPZLmRdFGyOmf6tzPQ/51Imv9WAktD8r7Jqq0pVNzMW/Ou9n2HctLkhtlsN4LJWYQWQKp3o7G+u8HWUrvGsyW3a58d7fvB/sq7N+RtWX4vZytbWv1tgj7a3renPqmzyvvlmp3ss5Vhvqui3m2HSc+HE0r076KVWfSWwqB1s1uYm3NgshWMm8Mba0SqkyTfUvrfPrTAvZptyWbvJ5c7eTbbtNwt19SiYiX6w+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/KHvpQoROTNr3D8AAAAASUVORK5CYII="
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
""",
 "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/8/81/Shape_of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png/220px-Shape_of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png"
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
""",
 "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/8/81/Shape_of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png/220px-Shape_of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png"
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
"""
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lovetify', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Songs Library',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.music_note, color: Color(0xFF1DB954), size: 32),
                      title: Text(
                        songs[index]['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      subtitle: Text(
                        songs[index]['artist']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Icon(Icons.chevron_right, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              songTitle: songs[index]['title']!,
                              artistName: songs[index]['artist']!,
                              lyrics: songs[index]['lyrics']!,
                              imageUrl: songs[index]['imageUrl']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
