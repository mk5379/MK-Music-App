import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Login.dart';
import 'package:flutter_application_1/Screen/Register.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: AssetImage("Images/image.jpeg"),
                  //   radius: 30,
                  //   backgroundColor: Colors.blueAccent,
                  //   foregroundColor: Colors.blueAccent,
                  // )
          
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                 width: 120.0,
                 height: 120.0,
                 decoration: BoxDecoration(
                   color: const Color(0xff7c94b6),
                   image: const DecorationImage(
                     image: AssetImage("Images/image.jpeg"),
                     fit: BoxFit.cover,
                   ),
                   borderRadius: const BorderRadius.all( Radius.circular(60.0)),
                   border: Border.all(
                     color: Colors.blueAccent,
                     width: 4.0,
                   ),
                 ),
                             ),
              ),
                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Min Khant",style: TextStyle(color: Colors.blueAccent,fontFamily: "Quicksand",fontSize: 20),)
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text("APP",style: TextStyle(color: Colors.white,fontSize: 15)),
                  ],
                ),
              ),
              Card(
                color: const Color.fromARGB(221, 48, 47, 47),
                child: Column(
                  children: [
                    ExpansionTile(
                      leading: const Icon(Icons.person,color: Colors.blueAccent,size: 20,),
                      title: const Text("Security",style: TextStyle(fontFamily: "Quicksand",fontSize: 20,color: Colors.blueAccent),),
                      subtitle: const Text("Your account security",style: TextStyle(fontFamily: "Quicksand",fontSize: 15,color: Colors.white),),
                      children: [

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const Register();
                            }));
                          },
                          child: const ListTile(
                            trailing: Icon(Icons.lock,color: Colors.blueAccent,size: 20,),
                            title: Text("Change your password",style: TextStyle(fontSize: 12,color: Colors.blueAccent,fontFamily: "Quicksand")),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const Register();
                            }));
                          },
                          child: const ListTile(
                            trailing: Icon(Icons.details,color: Colors.blueAccent,size: 20,),
                            title: Text("Your Account Detail",style: TextStyle(fontSize: 12,color: Colors.blueAccent,fontFamily: "Quicksand")),
                          ),
                        )
                      ],
                    ),

                    const Divider(
                      thickness: 0.1,
                    ),

                    ExpansionTile(
                      leading: const Icon(FontAwesomeIcons.heart,color: Colors.red,size: 20,),
                      title: const Text("Passcode Lock",style: TextStyle(fontFamily: "Quicksand",fontSize: 20,color: Colors.blueAccent),),
                      subtitle: const Text("New Register & Log Out",style: TextStyle(fontFamily: "Quicksand",fontSize: 15,color: Colors.white),),
                      children: [

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const Register();
                            }));
                          },
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const Register();
                            }));
                          }, child: const Text("Create New Account",style: TextStyle(fontFamily: "Quicksand",fontSize: 20,color: Colors.white),))
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const Login();
                            }));
                          },
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const Login();
                            }));
                          }, child: const Text("Log Out",style: TextStyle(fontFamily: "Quicksand",fontSize: 20,color: Colors.white),))
                          ),
                      ],
                    ),

                    const Divider(
                      thickness: 0.1,
                    ),

                    const ListTile(
                      leading: Icon(FontAwesomeIcons.fileWord,size: 20,color:Colors.blue),
                      title: Text("Watch Advertisement",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),

                    const Divider(
                      thickness: 0.1,
                    ),

                    const ListTile(
                        leading: Icon(Icons.dangerous,size: 20,color: Colors.red),
                        title: Text("Clean Histroy And Website Data",style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                  ],
                ),
              ),
            
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text("FEEDBACK",style: TextStyle(color: Colors.white,fontSize: 15)),
                  ],
                ),
              ),
              Card(
                color:  const Color.fromARGB(255, 25, 25, 25),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(FontAwesomeIcons.heart,size: 20,color:Colors.blue),
                        title: Text("Passcode Lock",style: TextStyle(color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),

                      const Divider(
                        thickness: 0.1,
                      ),

                      const ListTile(
                        leading: Icon(FontAwesomeIcons.fileWord,size: 20,color: Colors.lightBlue),
                        title: Text("Watch Advertisement",style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),

                      const Divider(thickness: 0.1,),
                      
                      ExpansionTile(
                      leading: const Icon(Icons.share,color: Colors.pink,size: 20,),
                      title: const Text("Social Media",style: TextStyle(fontFamily: "Quicksand",fontSize: 20,color: Colors.blueAccent),),
                      subtitle: const Text("Share our app on Social Media",style: TextStyle(fontFamily: "Quicksand",fontSize: 15,color: Colors.white),),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 480,right: 455),
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const Login();
                              }));
                          },child: const ListTile(
                            leading: Icon(FontAwesomeIcons.facebook,size: 20,color: Colors.blueAccent,),
                            title: Text("Share with Facebook",style: TextStyle(fontFamily: "Quicksand",fontSize: 15,color: Colors.white),)),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 495,right: 455),
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const Login();
                              }));
                          },child: const ListTile(
                            leading: Icon(FontAwesomeIcons.twitter,size: 20,color: Colors.grey,),
                            title: Text("Share with Twitter",style: TextStyle(fontFamily: "Quicksand",fontSize: 15,color: Colors.white),)),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 480,right: 445),
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const Login();
                              }));
                          },child: const ListTile(
                            leading: Icon(FontAwesomeIcons.instagram,size: 20,color: Colors.pink,),
                            title: Text("Share with Instagram",style: TextStyle(fontFamily: "Quicksand",fontSize: 15,color: Colors.white),)),
                          ),
                        )

                        
                      ],
                    )
                    ],
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}