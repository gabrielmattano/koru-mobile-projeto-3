import '../classes/produto.dart';
import '../utils.dart';

class ProdutoRepository {
  List<Produto> _produtos = [];

  ProdutoRepository() {
    _inicializarProdutosPadrao();
  }

  void _inicializarProdutosPadrao() {
    _produtos = [
      Produto(
        nome: "Desodorante Antitranspirante Aerossol Club 6 125ml",
        valor: 23.33,
        qtdEmEstoque: 5,
      ),
      Produto(
        nome: "Shampoo Siàge Remove A Oleosidade 250ml",
        valor: 42.99,
        qtdEmEstoque: 3,
      ),
      Produto(
        nome: "Condicionador Instance Frutas Vermelhas 300 ml",
        valor: 23.99,
        qtdEmEstoque: 50,
      ),
      Produto(
        nome:
            "Sérum Facial Multiprotetor FPS 50 12 em 1 Niina Secrets Skin 30ml",
        valor: 109.99,
        qtdEmEstoque: 2,
      ),
      Produto(
        nome: "Pó Compacto Adapt Glam Skin Protect 10g",
        valor: 49.99,
        qtdEmEstoque: 3,
      ),
      Produto(
        nome: "Malbec Ultra Bleu Desodorante Colônia 100ml",
        valor: 179.90,
        qtdEmEstoque: 4,
      ),
      Produto(
        nome: "Egeo Beat Desodorante Colônia 90ml",
        valor: 119.80,
        qtdEmEstoque: 4,
      ),
      Produto(
        nome: "Arbo Desodorante Colônia 100ml",
        valor: 164.90,
        qtdEmEstoque: 7,
      )
    ];
  }
  
  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
  }
  
  void removerProduto(String nome) {
    _produtos.removeWhere((produto) => produto.nome == nome);
  }

  List<Produto> listarProdutos() {
    return List.unmodifiable(_produtos);
  }

  void relatorioDeVendas() {
    print("Relatório de vendas:");
    for (var item in _produtos) {
      print(
          " - ${item.nome} - R\$ ${item.verReceitaGerada().toStringAsFixed(2)}");
    }
    pularLinha();
  }

  void inventario() {
    print("Inventário:");
    for (var item in _produtos) {
      print(
          " - ${item.nome} - Estoque ${item.qtdEmEstoque} - R\$ ${item.valor.toStringAsFixed(2)}");
    }
    pularLinha();
  }

  void relatorioIndividual(String nome) {
    for (var item in _produtos) {
      if (item.nome.contains(nome)) {
        item.verReceitaGerada();
      }
    }
  }
}
