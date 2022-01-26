import 'package:builderpatterndart/builders/funcionario_builder.dart';
import 'package:builderpatterndart/builders/funcionario_builder_completo.dart';
import 'package:builderpatterndart/dio/custom_dio_builder.dart';
import 'package:builderpatterndart/model/filho_model.dart';
import 'package:flutter/material.dart';

class FlutterDesignPatternBuilder extends StatefulWidget {
  const FlutterDesignPatternBuilder({Key? key}) : super(key: key);

  @override
  State<FlutterDesignPatternBuilder> createState() =>
      _FlutterDesignPatternBuilderState();
}

class _FlutterDesignPatternBuilderState
    extends State<FlutterDesignPatternBuilder> {
  @override
  void initState() {
    var funcionario1 = FuncionarioBuilder.instance
        .nome("Rodrigo")
        .idade(30)
        .profissao("Pedreiro")
        .addFilho(FilhoModel(nome: "Filho1", idade: 10))
        .build();
    print(
      funcionario1,
    );

    FuncionarioBuilderCompleto.instance
        .nome("Rodrigo")
        .idade(30)
        .profissao("Flutter")
        .addilhos(FilhoModel(nome: "Filho1", idade: 10))
        .build();

    onResult();
    super.initState();
  }

  onResult() async {
    var resultPost = await CustomDioBuilder.instance
        .post()
        .path('https://jsonplaceholder.typicode.com/posts')
        .addHeader('Content-type', 'application/json')
        .params()
        .data({
      'title': 'titulox',
      'body': 'bodyx',
      'userId': 1,
    }).run();

    var resultGet = await CustomDioBuilder.instance
        .get()
        .path('https://jsonplaceholder.typicode.com/posts')
        .params()
        .queryParameters()
        .addQueryParam('userId', 1)
        .run();

    print(resultPost.data);

    print(resultGet.data);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
