import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Mail Verification")),
      body: Center(
        child: Column(
          children: [
            const Text("I have send a verification to your email.Please check to your email and verify."),
            ElevatedButton(onPressed: () async {
              try {
                User? currentUser = FirebaseAuth.instance.currentUser;
                await currentUser!.reload();

                currentUser = FirebaseAuth.instance.currentUser;

                if(currentUser!.emailVerified == true){
                  if(mounted){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please verify your email."),backgroundColor: Colors.red,));
                }
              }catch (e) {
                    print(e);
                  }
            }, child: const Text("Verify",style: TextStyle(color: Colors.blue,fontFamily: "Quicksand",fontSize: 10),))

          ],
        ),
      ),
    );
  }
}