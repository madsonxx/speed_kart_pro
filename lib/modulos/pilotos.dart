class Pilotos {
  late String nome;
  late List<String> posicoes;
  int pontuacao;

  Pilotos({required this.nome, this.pontuacao = 0, this.posicoes = const []});

  @override
  String toString() {
    // TODO: implement toString
    return 'Nome $nome';
  }
}
