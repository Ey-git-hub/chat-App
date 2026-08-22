import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{
const AuthScreen({super.key});
@override
State<AuthScreen> createState()=> _AuthSreenState();
}
class _AuthSreenState extends State<AuthScreen>{
  var _isLogin=true;
@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Container(
            margin: EdgeInsets.only(
              top:30,
              bottom:20,
              left:20,
              right:20
            ),
            width: 200,
            child: Image.asset('assets/images/chat.png'),
           ),
           Card(
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Padding(padding: EdgeInsets.all(16),
              child: Form(
               child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                    labelText: 'Email address',),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                    labelText: 'Password',),
                    obscureText: true,
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(onPressed: (){},
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  ),child: Text(_isLogin ?'Login':'SignUp' )),
                  SizedBox(height: 12,),
                  TextButton(onPressed: (){
                    setState(() {
                      _isLogin=!_isLogin;
                    });
                  }, child: Text(_isLogin ? 'Create and account': "I already have an account"))
                ],
               ),
              ),
              ),
            ),
           )
          ],)
        ),
      ),
    );
  }
}