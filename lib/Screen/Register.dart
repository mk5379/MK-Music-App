import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Login.dart';
import 'verification.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const 
        Center(
          child: 
            Text("Register Here!",style: TextStyle(color: Colors.redAccent,fontFamily: "Quicksand",fontSize: 50)
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
            const Text("Register Now",style: TextStyle(color: Colors.redAccent,fontFamily: "Quicksand",fontSize: 20)),

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
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text, 
                    password: password.text,                 
                  );

                  credential.user!.sendEmailVerification();

                  if(mounted){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const Verify()) );
                  }
                }
                on FirebaseAuthException catch (e) {
                  var error = "";
                  if (e.code == 'weak-password') {
                    error = 'The password provided is too weak.';
                  } else if (e.code == 'email-already-in-use') {
                    error = 'The account already exists for that email.';
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                  }
                  
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Register",style: TextStyle(color: Colors.blue,fontFamily: "Quicksand",fontSize: 18),)
            )

          ],
        ),
      ),
    );
  }
}