import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/pages/homepage.dart';


class  MyLoginPage extends StatefulWidget {
  MyLoginPage({super.key});



  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  final TextEditingController usernameController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  void dispose() {
    // Dispose of the controllers when the widget is disposed
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signIn(BuildContext context) {
    if (usernameController.text == "ramisha@gmail.com" && passwordController.text == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      // Show an error message if the credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width:double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Column(
                  children: [
                    SizedBox(width: 120),
                    Image.asset(
                      'assets/images/log-in.png',
                      height: 200,
                      width: 100,
                      color: Colors.blueGrey[900],
                    ),
                    Text(
                      'Welcome Back! We missed You',
                      style: GoogleFonts.lato(  // Use your desired Google Font here
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.none,  // Remove the underline
                        ),
                      ),
                    )
                  ]
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black), // Set label text color to black
                  hintText: 'Enter your username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:
                          Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.black,// Hides the text input for password fields
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent ,
                    labelText: 'Password',
                    labelStyle: GoogleFonts.lato(fontSize: 18,color: Colors.black),
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:
                      Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password  ',style: GoogleFonts.lato(  // Use your desired Google Font here
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      decoration: TextDecoration.none,  // Remove the underline
                    ),
                  ),
                  )
                ],
              ),
              SizedBox(height: 20.0),




           Container(
            padding: EdgeInsets.all(10),
        margin:EdgeInsets.symmetric(horizontal: 70) ,
             child: ElevatedButton(
               onPressed: () => _signIn(context),
               style: ElevatedButton.styleFrom(
                 backgroundColor:  Colors.black, // Background color
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   // Adjust corner radius as needed
                 ),
               ),
               child: Text(
                 'Sign In',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 18,
                 ),
               ),
             ),

      ),







              SizedBox(height: 30.0),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 120,),
                  Image.asset(
                    'assets/images/google.png',
                    height: 100,
                    width: 50,
                  ),
                  SizedBox(width: 30,),
                  Image.asset(
                    'assets/images/apple.png',
                    height: 100,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a User,'),
                  SizedBox(width: 5,),
                  Text('Register Now',style: TextStyle(color: Colors.blueAccent),)
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
