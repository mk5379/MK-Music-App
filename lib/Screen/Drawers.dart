import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Account.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  Image(image: AssetImage("Images/Music_Logo.png"),height: 100,),
                  Text("MK Music",style: TextStyle(fontSize: 20,color: Colors.lightBlue,fontWeight: FontWeight.bold,fontFamily: "Quicksand"),)
                ],
              )
            ),

            const ListTile(
              leading: Icon(Icons.home,size: 25,color: Colors.white,),
              title: Text("Home",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Quicksand"),),
            ),

            // ListTile(
            //   leading: Icon(Icons.person,size: 25,color: Colors.white,),
            //   title: Text("Your Account",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Quicksand"),),
            // ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Account();
                }));
              },
              child: const ListTile(
              leading: Icon(Icons.person,size: 25,color: Colors.white,),
              title: Text("Your Account",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Quicksand"),),
            ),
            ),

            const ExpansionTile(
              title: Text("Choose the Songs",style: TextStyle(fontSize: 17,color: Colors.white,fontFamily: "Quicksand"),),
              subtitle: Text("Kind of Songs",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Quicksand")),
              children: [
                ListTile(title: Text("English Songs",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Quicksand")),),
                ListTile(title: Text("Burmese Songs",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Quicksand")),),
                ListTile(title: Text("Latin Songs",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Quicksand")),)
              ],
            ),

            const ExpansionTile(
              title: Text("Your Account",style: TextStyle(fontSize: 17,color: Colors.white,fontFamily: "Quicksand"),),
              subtitle: Text("Profile,Logout",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Quicksand")),
              children: [
                ListTile(title: Text("Your Profile",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Quicksand")),),
                ListTile(title: Text("Logout",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Quicksand")),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}