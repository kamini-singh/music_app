import 'package:flutter/material.dart';
import 'songpage.dart';

List<SongInfo> songs = [
  SongInfo('Cheap Thrills', 'assets/you_are_my_sunshine.mp3', 'cheaptrills.jpg', 'Sia'),
  SongInfo('Something Just Like This', 'assets/gg.mp3', 'something.jpg', 'The Chainsmokers '),
  SongInfo('Shape of You', 'assets/gg.mp3', 'shapeofyou.png', 'Ed Sheeran'),
  SongInfo('Closer', 'assets/gg.mp3', 'closer.jpg', 'The Chainsmokers'),
  SongInfo('Let Me Love You', 'assets/gg.mp3', 'letme.jpg', 'Justin Bieber'),
  SongInfo('Rockabye', 'assets/gg.mp3', 'rockabye.jpg', 'Clean Bandit'),
  SongInfo('Attention', 'assets/gg.mp3', 'attention.png', 'Charlie Puth'),
  SongInfo('Alone', 'assets/gg.mp3', 'alone.jpg', 'Alan Walker'),
  SongInfo('Faded', 'assets/gg.mp3', 'faded.jpg', 'Alan Walker'),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String id = 'home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
         title: Center(child: Text('Songs',
          style: TextStyle
          (
          color: Colors.white70,
       ),
         ),
         ),
          backgroundColor: Color(0x572789B0),
          elevation: 0.0,
       ),
        body: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index){
    return Card(
    color: Color(0xCABFEC),
    child: GestureDetector(
    onTap :() {

        Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => Songpage(
           song:songs[index],
    )));
    },
          child: ListTile(

    leading: CircleAvatar(
    backgroundImage: AssetImage('assets/${songs[index].imagePath}'),
    ),
    title: Text(songs[index].songName,
    style: TextStyle
    (
       color: Colors.white70,
    ),
    ),
    subtitle: Text(songs[index].singer,
    style: TextStyle
    (
    color: Colors.grey,
    ),
    ),
    trailing: Icon(Icons.more_vert),
    ),
    ),
    );
          }
      ),
    ),
    );
    }
}
    


