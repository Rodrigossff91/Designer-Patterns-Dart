import 'package:adapterdart/endereco_model.dart';
import 'package:adapterdart/xml2_json_adapter.dart';
import 'package:adapterdart/xml2_json_transform.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    dioAdpter();
    super.initState();
  }

  dioAdpter() async {
    var endereco = await Dio()
        .get('https://viacep.com.br/ws/14055560/json/')
        .then((value) => EnderecoModel.fromJson(value.data));

    print(endereco);

    print('##############################################');

    var enderecoXml = await Dio()
        .get('https://viacep.com.br/ws/14055560/xml/')
        .then((value) => Xml2JsonAdapter.adapter(value.data))
        .then((value) => EnderecoModel.fromJson(value['xmlcep']));

    print(enderecoXml);

    print('##############################################');

    var dio = Dio();
    dio.transformer = Xml2JsonTransform();

    var res2 = await dio
        .get("https://viacep.com.br/ws/14055560/xml/")
        .then((value) => EnderecoModel.fromJson(value.data['xmlcep']));

    print(res2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
