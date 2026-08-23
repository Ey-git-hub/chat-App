import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{
const AuthScreen({super.key});
@override
State<AuthScreen> createState()=> _AuthSreenState();
}
class _AuthSreenState extends State<AuthScreen>{
  final _form=GlobalKey<FormState>();
  var _isLogin=true;
  var _enteredEmail='';
  var _enteredPassword='';
  void _submit(){

    final isValid=_form.currentState!.validate();

  if(isValid){
    _form.currentState!.save();
  print('Email: $_enteredEmail');
  print('Password: $_enteredPassword');
    }
  }
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
                key: _form,
               child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                    labelText: 'Email address',),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value){
                    if(value==null || value.trim().isEmpty || !value.contains('@')){
                      return 'Please enter a valid email address';
                    }
                    return null;
                    },
                    onSaved: (value){
                    _enteredEmail=value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                    labelText: 'Password',),
                    obscureText: true,
                    validator: (value){
                      if(value==null || value.trim().length < 6){
                      return 'password must be 6 characters long';
                    }
                    return null;
                    },
                    onSaved: (value){
                      _enteredPassword=value!;
                    },
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(onPressed:_submit,
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