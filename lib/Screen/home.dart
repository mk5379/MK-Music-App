import 'package:flutter/material.dart';
// import 'package:flutter_application_1/TextStyle.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("MK-Music",style: TextStyle(fontFamily: "Quicksand",color: Colors.blueAccent,fontSize: 25),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,))
        ],
        leading: const Icon(Icons.sort_rounded,color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: const Color.fromARGB(221, 48, 47, 47),
                title: const Text("Music Name",style: TextStyle(fontFamily: "Quicksand",color: Colors.white,fontSize: 17),),
                subtitle: const Text("Artist",style: TextStyle(fontFamily: "Quicksand",color: Colors.white,fontSize: 12),),
                leading: const Icon(Icons.music_note, color: Colors.white,size: 32,),
                trailing:  IconButton(onPressed: (){
                  assetsAudioPlayer.open(
                    Audio("audio/Photograph.mp3")
                  );
                }, icon: const Icon(Icons.play_arrow, color: Colors.white,size: 32,))
                
              ),
            );
          }
        ),
      ),
    );
  }
}