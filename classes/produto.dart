class Produto {
  final String nome;
  double valor;
  int qtdEmEstoque;
  int qtdVendida = 0;

  Produto({
    required this.nome, 
    required this.valor, 
    this.qtdEmEstoque = 0,
    });

//Criação do método verReceitaGerada - guilhermeMiranda
  verReceitaGerada() {
    return valor * qtdVendida;
  }

//Criação do método realizarVenda - gabrielmattano
  void realizarVenda(){

  if (qtdEmEstoque > 0) {
    qtdVendida ++;
    qtdEmEstoque --;

    print("Compra de um(a) produto $nome realizada com sucesso!");
  } else {
    throw('No momento não possuímos o produto $nome em estoque.');
  }

  }
}