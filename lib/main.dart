import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dataModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'http post'),
    );
  }
}

Future<DataModel?> submitData(String name, String email, String password,
    String phone, String address) async {
  var respose = await http.post(Uri.parse('https://7b74-197-43-100-97.ngrok-free.app/api/v1/user/register'), body: {
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "address": address,
  });
  var data = respose.body;
  print(data);
  if (respose.statusCode == 201) {
    String responseString = respose.body;
  } else {
    return null;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final String? _dataModel ;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "enter your name",
                  ),
                  autofocus: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "enter your email",
                  ),
                  autofocus: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "enter your pass",
                  ),
                  autofocus: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: "enter your phone",
                  ),
                  autofocus: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: "enter your address",
                  ),
                  autofocus: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String name =nameController.text ;
                      String email =emailController.text ;
                      String password =passwordController.text ;
                      String phone =phoneController.text ;
                      String address =addressController.text ;
                      DataModel? data= await submitData(name, email, password, phone, address) ;

                      setState(() {
                        var _dataModel=data;
                      });
                    }, child: const Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
