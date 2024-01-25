import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'package:flutter_application_1/main.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
          child: 
            Text("Please Login your account for security!",style: TextStyle(color: Colors.redAccent,fontFamily: "Quicksand",fontSize: 50)
          )
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const Image(
              image: AssetImage("Images/Music_Logo.png"),
              width: 200,
              height: 200,
            ),
            const Text("Hello!Welcome To MK-Music App",style: TextStyle(color: Colors.blue,fontFamily: "Quicksand",fontSize: 20),),
            const Text("Login Here!",style: TextStyle(color: Colors.redAccent,fontFamily: "Quicksand",fontSize: 20)),

            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "E-Mail"),
            ),

            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text, 
                    password: password.text,                 
                  );

                  if(mounted){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()) );
                  }
                }
                on FirebaseAuthException catch (e) {
                  var error = "";
                  if (e.code == 'weak-password') {
                    error = 'The password provided is too weak.';
                  } else if (e.code == 'email-already-in-use') {
                    error = 'The account already exists for that email.';
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error),backgroundColor : Colors.red));
                  }
                  
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Login",style: TextStyle(color: Colors.blue,fontFamily: "Quicksand",fontSize: 18),)
            )

          ],
        ),
      ),
    );
  }
}