import 'package:chat/firebase_options.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat  extends StatelessWidget{
  const ScholarChat({super.key});
  
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RegisterPage.id : (context) => const RegisterPage(),
        LoginPage.id : (context) => const LoginPage(),
        ChatPage.id : (context) =>  ChatPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      textColor: Colors.grey,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

// class ScholarChat extends StatelessWidget {
//   const ScholarChat({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  const MaterialApp(
//       debugShowCheckedModeBanner: false,
      
//       home: LoginPage(),
//     );
//   }
// }