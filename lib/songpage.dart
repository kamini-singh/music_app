import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class SongInfo {
  String songName;
  String songPath;
  String imagePath;
  String singer;

  SongInfo(this.songName, this.songPath, this.imagePath, this.singer);
}
 class Songpage extends StatefulWidget {
  SongInfo song;
  Songpage({Key? key,required this.song}) : super(key: key);
  @override

  _SongpageState createState() => _SongpageState();
}

class _SongpageState extends State<Songpage> {
  AudioPlayer _player= AudioPlayer();
  AudioCache cache = AudioCache();
  void initState() {
   super.initState();
  _player = AudioPlayer();
   cache = AudioCache(fixedPlayer:_player);
  _player.onDurationChanged.listen((d) {
    setState(() {
      musicLength = d;
    });
  });
  _player.onAudioPositionChanged.listen((p) {
    setState(() {
      position = p;
    });
  });
}
  bool playing=false;
  IconData playBtn= Icons.play_arrow;
  Duration position= new Duration();
  Duration musicLength= new Duration();
  Widget slider(){
    return Container(
        width:300,
        child: Slider.adaptive(
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            value: position.inSeconds.toDouble(),
            max:musicLength.inSeconds.toDouble(),
        onChanged: (value){
      seekTosec(value.toInt());
    }),
    );
  }
  void seekTosec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.blueGrey,
            ],
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
       body:SafeArea(
         child: Center(
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                height: 80,
              ),
              ClipRRect(
                borderRadius:BorderRadius.circular(10),
                child: Image(
                  width: 330,
                  height: 330,
               image: AssetImage('assets/${widget.song.imagePath}'),
                 ),),
              SizedBox(
                height: 20,
              ),
            Text(widget.song.songName,
               style : TextStyle(
                 fontWeight: FontWeight.bold,
                   color: Colors.black87,
                   fontSize:20,
               ),
           ),
              Text(widget.song.singer,
                style : TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
              Container(
                width: 500.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${position.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                     slider(),
                    Text(
                      "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 45.0,
                    color: Colors.blue,
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                    ),
                  ),
                  IconButton(
                    iconSize: 62.0,
                    color: Colors.blue[800],
                    onPressed: () {
                      if (!playing) {
                        cache.play("assests/shapeofyou.mp3");
                        setState(() {
                          playBtn = Icons.pause;
                          playing = true;
                        });
                      } else {
                        _player.pause();
                        setState(() {
                          playBtn = Icons.play_arrow;
                          playing = false;
                        });
                      }
                    },
                    icon: Icon(
                      playBtn,
                    ),
                  ),
                  IconButton(
                    iconSize: 45.0,
                    color: Colors.blue,
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                    ),
                  ),
                ],
              )
            ],
           ),
         ),
       ),
      ),
    );
  }
    }




