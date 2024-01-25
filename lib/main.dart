import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Account.dart';
import 'package:flutter_application_1/Screen/song.dart';
import 'Screen/Login.dart';
import 'Screen/Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'Screen/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser != null ? const Home() : const Login()
      // home: const Register(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<BottomNavigationBarItem>bottomNavigationBarList = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home,color: Colors.lightBlue,size: 30),
      label: "Home"
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.music_note,color: Colors.lightBlue,size: 30),
      label: "Songs"
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person,color: Colors.lightBlue,size: 30),
      label: "Account"
    ),

  ];

  int _selectedIndex = 0;

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var bodyList = [
    const Home(),
    const MySongs(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "MK Music",
    //   theme: ThemeData(
    //     fontFamily: "Quicksand",
    //     appBarTheme: const AppBarTheme(
    //       backgroundColor: Colors.transparent,
    //       elevation: 0
    //     )
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Music is an essential thing for humans',style: TextStyle(fontSize: 15,fontFamily: "Quicksand",color: Colors.white)),backgroundColor: Colors.black,),
      drawer: Drawer(
        shadowColor: Colors.white,
        backgroundColor: Colors.black,
        child: ListView(
          children: const [
            DrawerHeader(
              child: Column(
                children: [
                  Image(image: AssetImage("Images/Music_Logo.png"),height: 100,),
                  Text("MK Music",style: TextStyle(fontSize: 20,color: Colors.lightBlue,fontWeight: FontWeight.bold,fontFamily: "Quicksand"),)
                ],
              )
            ),

            ListTile(
              leading: Icon(Icons.home,size: 25,color: Colors.lightBlue,),
              title: Text("Home",style: TextStyle(fontSize: 15,color: Colors.lightBlue,fontFamily: "Quicksand"),),
            ),

            ListTile(
              leading: Icon(Icons.person,size: 25,color: Colors.lightBlue,),
              title: Text("Your Account",style: TextStyle(fontSize: 15,color: Colors.lightBlue,fontFamily: "Quicksand"),),
            ),

            ExpansionTile(
              title: Text("Choose the Songs",style: TextStyle(fontSize: 17,color: Colors.lightBlue,fontFamily: "Quicksand"),),
              subtitle: Text("Kind of Songs",style: TextStyle(fontSize: 15,color: Colors.lightBlue,fontFamily: "Quicksand")),
              children: [
                ListTile(title: Text("English Songs",style: TextStyle(fontSize: 12,color: Colors.lightBlue,fontFamily: "Quicksand")),),
                ListTile(title: Text("Burmese Songs",style: TextStyle(fontSize: 12,color: Colors.lightBlue,fontFamily: "Quicksand")),),
                ListTile(title: Text("Latin Songs",style: TextStyle(fontSize: 12,color: Colors.lightBlue,fontFamily: "Quicksand")),)
              ],
            ),

            ExpansionTile(
              title: Text("Your Account",style: TextStyle(fontSize: 17,color: Colors.lightBlue,fontFamily: "Quicksand"),),
              subtitle: Text("Profile,Logout",style: TextStyle(fontSize: 15,color: Colors.lightBlue,fontFamily: "Quicksand")),
              children: [
                ListTile(title: Text("Your Profile",style: TextStyle(fontSize: 12,color: Colors.lightBlue,fontFamily: "Quicksand")),),
                ListTile(title: Text("Logout",style: TextStyle(fontSize: 12,color: Colors.lightBlue,fontFamily: "Quicksand")),),
              ],
            ),
          ],
        ),
      ),

      body: bodyList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black38,
        unselectedLabelStyle: const TextStyle(color: Colors.white,fontFamily: "Merriweather"),
        selectedLabelStyle: const TextStyle(color: Colors.white,fontFamily: "Merriweather"),
        onTap: onItemTap,
        currentIndex: _selectedIndex,
        items: bottomNavigationBarList
      ),
    );
  }
}