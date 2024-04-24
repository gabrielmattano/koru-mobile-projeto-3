import 'brinde.dart';
import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';
import '../enums.dart';

class Cliente extends Pessoa {
  double dinheiro;
  List<Produto> produtosComprados = [];
  List<Brinde> brindesComprados = [];
  int pontos = 0;

  Cliente({
    required String nome,
    required String cpf,
    required DateTime dataDeNascimento,
    required Genero genero,
    this.dinheiro = 0.0,
  }) : super(
            nome: nome,
            cpf: cpf,
            dataDeNascimento: dataDeNascimento,
            genero: genero);

//Criação do método Adicionar Dinheiro
  void adicionarDinheiro(double valor) {
    if (valor > 0.0) {
      dinheiro = dinheiro + valor;
      print("$nome agora possui R\$ ${dinheiro.toStringAsFixed(2)}.");
    }
  }

// Refatoração do método falar() de Pessoa.dart
  @override
  void falar(String fala) {
    print("Cliente $nome diz: $fala.");
  }

// Validação para o método comprarProduto()
  bool saldoInsuficiente(dinheiro, Produto) {
    return dinheiro < Produto.valor;
  }

//Criação do método comprarProduto()
  void comprarProduto(Produto produto, Revendedor revendedor) {
    try {
      if (saldoInsuficiente(dinheiro, produto)) {
        print(
            "$nome não possui dinheiro suficiente para efetuar a compra de ${produto.nome}");
        return;
      } else {
        revendedor.venderProduto(produto);
        produtosComprados.add(produto);
        dinheiro -= produto.valor;
        pontos += 1;
        print("O saldo atual de $nome é R\$ ${dinheiro.toStringAsFixed(2)}.");
      }
    } catch (e) {
      print(e);
    }
  }

//Criação de método ordenarProdutosComprados
  void _ordenarProdutosComprados() {
    produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

//Criação de método calcularTotalGasto
  double calcularTotalGasto() {
    double totalGasto = 0;
    for (var item in produtosComprados) {
      totalGasto += item.valor;
    }
    return totalGasto;
  }

  double calcularMediaProdutosComprados() {
    double mediaProdutosComprados = 0;
    if (produtosComprados.length > 0) {
      mediaProdutosComprados = calcularTotalGasto() / produtosComprados.length;
    }
    return mediaProdutosComprados;
  }

//Criação de método verProdutosComprados
  void verProdutosComprados() {
    _ordenarProdutosComprados();
    print("Produtos comprados por $nome em ordem alfabética:");
    produtosComprados.forEach((produto) =>
        print(" - ${produto.nome} - R\$ ${produto.valor.toStringAsFixed(2)}"));
  }

//Criação do metodo Ver Resumo
  void verResumo() {
    print(
        "O total gasto por $nome foi R\$ ${calcularTotalGasto().toStringAsFixed(2)} e a média de valor dos produtos comprados é R\$ ${calcularMediaProdutosComprados().toStringAsFixed(2)}.");
  }

  //Criação do método consultarTotalPontos
  void consultarTotalPontos() {
    print("$nome possui: $pontos pontos.");
  }

  //Criação do método trocarPontosPorBrinde
  void trocarPontosPorBrinde(Brinde brinde, Revendedor revendedor) {
    if (pontos >= brinde.pontosNecessarios) {
      try {
        revendedor.realizarTroca(brinde);
        brindesComprados.add(brinde);
        pontos -= brinde.pontosNecessarios;
        print(
            "Troca realizada! $nome ganhou ${brinde.nome}, e ainda ainda possui $pontos pontos.");
      } catch (e) {
        print(e);
      }
    }
  }

  //Criação do método ordenarBrindes
  void _ordenarBrindes() {
    brindesComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

  //Criação do método verBrindesComprados
  void verBrindesComprados() {
    _ordenarBrindes();
    print("Brindes recebidos por $nome:");
    brindesComprados.forEach((brinde) => print(" - ${brinde.nome}"));
  }
}
