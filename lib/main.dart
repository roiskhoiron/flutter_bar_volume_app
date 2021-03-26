import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  int hasil;
  final controllerPanjang = TextEditingController();
  final controllerTinggi = TextEditingController();
  final controllerLebar = TextEditingController();

  @override
  void dispose() {
    controllerPanjang.dispose();
    controllerLebar.dispose();
    controllerTinggi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarVolume"),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Panjang"),
                  TextFormField(
                    controller: controllerPanjang,
                    maxLines: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("Lebar"),
                  TextFormField(
                    controller: controllerLebar,
                    maxLines: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("Tinggi"),
                  TextFormField(
                    controller: controllerTinggi,
                    maxLines: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              hasil = int.parse(controllerPanjang.text.toString())
                                  * int.parse(controllerLebar.text.toString())
                                  * int.parse(controllerTinggi.text.toString());

                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                          }
                        },
                        child: Text('Hitung')),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Center(
                    child: Text(
                      hasil == null ? "Hasil" : "Hasinya > $hasil",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                  )
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
