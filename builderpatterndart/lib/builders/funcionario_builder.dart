import 'package:builderpatterndart/model/filho_model.dart';
import 'package:builderpatterndart/model/funcionario_model.dart';

class FuncionarioBuilder {
  FuncionarioModel _funcionario = FuncionarioModel();

  FuncionarioBuilder._();

  static FuncionarioBuilder get instance => FuncionarioBuilder._();

  FuncionarioBuilder nome(String nome) {
    _funcionario.nome = nome;
    return this;
  }

  FuncionarioBuilder idade(int idade) {
    _funcionario.idade = idade;
    return this;
  }

  FuncionarioBuilder profissao(String profissao) {
    _funcionario.profissao = profissao;
    return this;
  }

  FuncionarioBuilder addFilho(FilhoModel filho) {
    if (_funcionario.filhos == null) {
      _funcionario.filhos = [];
    }
    _funcionario.filhos!.add(filho);
    return this;
  }

  FuncionarioModel build() {
    return _funcionario;
  }
}
