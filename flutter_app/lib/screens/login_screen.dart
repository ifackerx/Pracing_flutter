import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  void doLogin() {
    print(ctrlUsername.text);
    print(ctrlPassword.text);

    if (ctrlUsername.text == 'admin' && ctrlPassword.text == 'admin') {
      Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => HomeScreen()
      ));
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN', style: TextStyle(color: Colors.black,)),
        backgroundColor: Colors.pink[100],
      ),
      // Strack เอาไว้ทำให้ widget ซ้อนกันได้
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Center(
            child: Column(
              // กำนหดให้กลางมือถือเลยอะ 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: 300.0,
                  image: AssetImage('asset/img/profile.jpg'),
                ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: ctrlUsername,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // icon
                        labelText: 'Email',
                        hintText: 'example@gmail.com',
                        prefixIcon: Icon(Icons.email, color: Colors.pink),
                        filled: true,
                        fillColor: Colors.red[50]
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      // เป็นจุดๆรหัสผ่าน 
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.pink),
                        labelText: 'Password',
                        hintText: 'enter 5-10 lenght',
                        filled: true,
                        fillColor: Colors.red[50]
                        
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          
                          color: Colors.pink[300],
                          onPressed: () => doLogin(),
                          child: Text('Login'),
                          
                          ),
                      
                      ],
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Register new account', style: TextStyle(color: Colors.pink),),
                    )
                  ],
                ),),
              )
              ],
            )
          )
        ],
      ),
      
    );
  }
}