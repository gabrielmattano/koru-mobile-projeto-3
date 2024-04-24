import 'produto.dart';

class Brinde extends Produto {
  int pontosNecessarios;

  Brinde({
    required String nome,
    required int qtdEmEstoque,
    required this.pontosNecessarios,
  }) : super(
    valor: 0.0,
    nome: nome,
    qtdEmEstoque: qtdEmEstoque,    
  );

  void consultarPontosNecessarios() {
    print("Para ganhar o brinde $nome você precisará de: $pontosNecessarios pontos.");
  }

  void realizarTroca() {
    if (qtdEmEstoque > 0) {
      qtdEmEstoque--;
      print("Troca realizada! Você ganhou $nome");
    } else {
      throw("No momento, não possuímos o brinde $nome em estoque");
    }
  }

}