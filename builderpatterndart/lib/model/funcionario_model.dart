import 'package:builderpatterndart/model/filho_model.dart';

class FuncionarioModel {
  String? nome;
  int? idade;
  String? profissao;
  List<FilhoModel>? filhos;
  FuncionarioModel({
    this.nome,
    this.idade,
    this.profissao,
    this.filhos,
  });

  @override
  String toString() {
    return 'FuncionarioModel(nome: $nome, idade: $idade, profissao: $profissao, filhos: $filhos)';
  }
}
