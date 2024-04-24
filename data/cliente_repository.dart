import 'dart:math';
import '../classes/cliente.dart';
import '../classes/produto.dart';
import '../classes/revendedor.dart';
import '../classes/brinde.dart';
import '../enums.dart';
import '../utils.dart';

class ClienteRepository {
  List<Cliente> _clientes = [];
  List<Produto> _produtos = [];
  List<Revendedor> _revendedores = [];
  List<Brinde> _brindes = [];
  Random random = new Random();

  ClienteRepository({
    required List<Produto> produtos,
    required List<Revendedor> revendedores,
    required List<Brinde> brindes,
  }) {
    _produtos = produtos;
    _revendedores = revendedores;
    _brindes = brindes;
    _inicializarClientesPadrao();
  }

  void _inicializarClientesPadrao() {
    _clientes = [
      Cliente(
        nome: "Gabriel",
        cpf: "123458900",
        dataDeNascimento: DateTime.parse("2000-02-01"),
        genero: Genero.Masculino,
      ),
      Cliente(
        nome: "Flavia",
        cpf: "26430596312",
        dataDeNascimento: DateTime.parse("1994-02-01"),
        genero: Genero.Feminino,
      ),
      Cliente(
        nome: "Guilherme Miranda",
        cpf: "59762158964",
        dataDeNascimento: DateTime.parse("1998-02-01"),
        genero: Genero.Outro,
      ),
      Cliente(
        nome: "Guilherme Bastos",
        cpf: "45889632012",
        dataDeNascimento: DateTime.parse("1989-06-07"),
        genero: Genero.Masculino,
      ),
    ];
  }

  void adicionarCliente(Cliente cliente) {
    _clientes.add(cliente);
  }

  void removerCliente(String cpf) {
    _clientes.removeWhere((cliente) => cliente.cpf == cpf);
  }

  List<Cliente> listarClientes() {
    return List.unmodifiable(_clientes);
  }

  void testeFalar() {
    print("Método falar:");
    int max = _exemploFalas.length;
    for (Cliente cliente in _clientes) {
      int index = random.nextInt(max);
      cliente.falar(_exemploFalas[index]);
    }
    pularLinha();
  }

  List<String> _exemploFalas = [
    "Olá!",
    "Bom dia!",
    "Tchau!",
    "Nossa, que loja cheirosa!",
    "Que perfume delicioso!",
    "Estou só dando uma olhadinha.",
    "Na volta eu passo aqui.",
    "Estou procurando um presente.",
    "Estão com alguma promoção?",
    "Quero um presente para minha mãe.",
    "Prazer em te ver!",
    "Estão com algum brinde?",
  ];

  void quemQuerDinheiro(double valor) {
    print("Quem quer dinheiro!");
    _clientes.forEach((cliente) {
      cliente.adicionarDinheiro(valor);
    });
    pularLinha();
  }

  void realizarVendaAleatoria() {
    print("Realizar vendas aleatória:");
    bool condicaoDeVenda = _produtos.isNotEmpty && _revendedores.isNotEmpty;
    if (condicaoDeVenda) {
      for (Cliente cliente in _clientes) {
        Revendedor revendedorAleatorio =
            _revendedores[random.nextInt(_revendedores.length)];
        Produto produtoAleatorio = _produtos[random.nextInt(_produtos.length)];
        cliente.comprarProduto(produtoAleatorio, revendedorAleatorio);
      }
    } else {
      print(
          "Não há produtos ou revendedores suficientes para realizar uma venda.");
    }
    pularLinha();
  }

  void realizarTrocaDeBrindes() {
    print("Realizar troca de brindes:");
    bool condicaoDeVenda = _brindes.isNotEmpty && _revendedores.isNotEmpty;
    if (condicaoDeVenda) {
      _clientes.forEach((cliente) {
        while (cliente.pontos > 0) {
          Revendedor revendedorAleatorio =
              _revendedores[random.nextInt(_revendedores.length)];
          Brinde brindeAleatorio = _brindes[random.nextInt(_brindes.length)];
          try {
            cliente.trocarPontosPorBrinde(brindeAleatorio, revendedorAleatorio);
          } catch (e) {
            print(e);
            break;
            return;
          }
        }
      });
    } else {
      print(
          "Não há brindes ou revendedores suficientes para realizar sua troca.");
    }
    pularLinha();
  }

  void verSacolas() {
    print("O que cada um levou?");
    _clientes.forEach((cliente) {
      print("${cliente.nome} levou:");
      cliente.verProdutosComprados();
      print("e ganhou:");
      cliente.verBrindes();
      pularLinha();
    });    
  }

  void relatorio() {
    _clientes.forEach((cliente) {
      cliente.verResumo();
    });
      pularLinha();
  }
}
