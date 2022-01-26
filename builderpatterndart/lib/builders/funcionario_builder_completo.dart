import 'package:builderpatterndart/model/filho_model.dart';
import 'package:builderpatterndart/model/funcionario_model.dart';

class FuncionarioBuilderCompleto
    implements
        FuncionarioNome,
        FuncionarioIdade,
        FuncionarioProfissao,
        FuncionarioFilhos {
  final FuncionarioModel _funcionario = FuncionarioModel();

  FuncionarioBuilderCompleto._();

  static FuncionarioNome get instance => FuncionarioBuilderCompleto._();

  @override
  FuncionarioIdade nome(String nome) {
    _funcionario.nome = nome;
    return this;
  }

  @override
  FuncionarioProfissao idade(int idade) {
    _funcionario.idade = idade;
    return this;
  }

  @override
  FuncionarioFilhos profissao(String profissao) {
    _funcionario.profissao = profissao;
    return this;
  }

  @override
  FuncionarioFilhos addilhos(FilhoModel filho) {
    if (_funcionario.filhos == null) {
      _funcionario.filhos = [];
    }
    _funcionario.filhos!.add(filho);
    return this;
  }

  @override
  FuncionarioModel build() {
    return _funcionario;
  }
}

abstract class FuncionarioNome {
  FuncionarioIdade nome(String nome);
}

abstract class FuncionarioIdade {
  FuncionarioProfissao idade(int idade);
}

abstract class FuncionarioProfissao {
  FuncionarioFilhos profissao(String profissao);
}

abstract class FuncionarioFilhos {
  FuncionarioFilhos addilhos(FilhoModel filho);
  FuncionarioModel build();
}
