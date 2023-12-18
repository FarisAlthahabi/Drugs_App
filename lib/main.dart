import 'package:flutter/material.dart';
import 'package:pharmacy_project/model/user_model.dart';
import 'package:pharmacy_project/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:pharmacy_project/service/register_service.dart';
import 'package:pharmacy_project/service/drug_service.dart';
import 'package:pharmacy_project/model/drug_model.dart';

void main() async {
  // dynamic dataResult = await getData();
  // print(dataResult);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
    );
  }
}

TextEditingController usernamelogin = TextEditingController();
TextEditingController passwordlogin = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController c_password = TextEditingController();

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'Welcom to pharmacy world !',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'pharmacylogo2.png',
              scale: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    controller: usernamelogin,
                    decoration: InputDecoration(
                        fillColor: Colors.blue,
                        label: Text('username'),
                        helperText: 'please enter your username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    controller: passwordlogin,
                    decoration: InputDecoration(
                        fillColor: Colors.blue,
                        label: Text('password'),
                        helperText: 'please enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
            ),
            InkWell(
              onTap: () {
                if (username.text == usernamelogin.text &&
                    password.text == passwordlogin.text) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                }
                ;
                usernamelogin.text = '';
                passwordlogin.text = '';
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5), width: 2.5)),
                  child: Center(
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5), width: 2.5)),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.4),
      appBar: AppBar(
        leading: Container(
          color: Colors.blue.withOpacity(0.7),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.black.withOpacity(0.5), width: 2.5)),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInPage(),
                      ));
                },
                child: Text(
                  'LogOut',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blue.withOpacity(0.7),
      ),
      body: FutureBuilder(
        future: drugServiceImp().getDrugs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            dynamic temp = snapshot.data;

            List<drugModel> data = temp as List<drugModel>;

            print(temp);
            if (temp.isEmpty) {
              return Center(
                child: Text('Empty'),
              );
            } else {
              return SizedBox(
                height: 450,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(data[index].ScientificName),
                            Text(data[index].CommertialName),
                            Text(data[index].Classification),
                            Text(data[index].Manufacturecompany),
                            Text(data[index].AvalableQuantity),
                            Text(data[index].Expiration),
                            Text(data[index].Price),
                          ],
                        )),
              );
            }
          } else {
            print(snapshot.error);
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'pharmacylogo2.png',
                scale: 1,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                    width: 300,
                    height: 70,
                    child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          label: Text('username'),
                          helperText: 'please enter your username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                    width: 300,
                    height: 70,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          label: Text('email'),
                          helperText: 'please enter your email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                    width: 300,
                    height: 70,
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          label: Text('password'),
                          helperText: 'please enter your password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                    width: 300,
                    height: 70,
                    child: TextField(
                      controller: c_password,
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          label: Text('confirm password'),
                          helperText: 'please enter your password again',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                Register(
                    username.text, email.text, password.text, c_password.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInPage(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5), width: 2.5)),
                  child: Center(
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
