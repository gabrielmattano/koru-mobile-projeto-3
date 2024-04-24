import '../enums.dart';
import 'pessoa.dart';
import 'produto.dart';
import 'brinde.dart';

class Revendedor extends Pessoa {
  Revendedor({
    required String nome,
    required String cpf,
    required DateTime dataDeNascimento,
    required Genero genero,
    required this.matricula,
  }) : super(
          nome: nome,
          cpf: cpf,
          dataDeNascimento: dataDeNascimento,
          genero: genero,
        );

  final String matricula;
  List<Produto> produtosVendidos = [];
  double porcentagemLucro = 0.25;

  double calcularTotalVendido() {
    double totalVendido = 0;
    produtosVendidos.forEach((element) {
      totalVendido += element.valor;
    });
    return totalVendido;
  }

  double calcularMediaProdutosVendidos() {
    double mediaProdutosVendidos = 0;
    if (produtosVendidos.length > 0) {
      mediaProdutosVendidos = calcularTotalVendido() / produtosVendidos.length;
    }
    return mediaProdutosVendidos;
  }

  double calcularLucroTotal() {
    double lucroTotal = 0;
    produtosVendidos.forEach((element) {
      lucroTotal += element.valor * porcentagemLucro;
    });
    return lucroTotal;
  }

  @override
  void falar(String fala) {
    switch (genero) {
      case Genero.Masculino:
        print("Revedendor $nome diz: $fala");
        break;
      case Genero.Feminino:
        print("Revedendora $nome diz: $fala");
        break;
      case Genero.Outro:
        print("Pessoa revedendora $nome diz: $fala");
        break;
    }
  }

  //Criação método verResumo
  void verResumo() {
    print("O total vendido por $nome foi R\$ ${calcularTotalVendido().toStringAsFixed(2)} " +
        "e a média aritmética de valor dos produtos vendidos é R\$ ${calcularMediaProdutosVendidos().toStringAsFixed(2)}.\n" +
        "O lucro recebido foi de R\$ ${calcularLucroTotal().toStringAsFixed(2)}.");
  }

  void venderProduto(Produto item) {
    try {
      produtosVendidos.add(item);
      item.realizarVenda();
    } catch (e) {
      rethrow;
    }
  }

  void realizarTroca(Brinde brinde) {
    try {
      brinde.realizarTroca();      
    } catch (e) {
      rethrow;
    }
  }
}