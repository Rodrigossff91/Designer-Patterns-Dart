class FilhoModel {
  String nome;
  int idade;
  FilhoModel({
    required this.nome,
    required this.idade,
  });

  @override
  String toString() => 'FilhoModel(nome: $nome, idade: $idade)';
}
