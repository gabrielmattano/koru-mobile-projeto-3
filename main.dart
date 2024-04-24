import 'classes/produto.dart';
import 'classes/revendedor.dart';
import 'classes/brinde.dart';
import 'data/brinde_repository.dart';
import 'data/product_repository.dart';
import 'data/cliente_repository.dart';
import 'data/pessoa_repository.dart';
import 'data/revendedor_repository.dart';
import 'utils.dart';

main() {
  PessoaRepository pessoaRepository = PessoaRepository();

  ProdutoRepository produtoRepository = ProdutoRepository();
  List<Produto> produtos = produtoRepository.listarProdutos();

  RevendedorRepository revendedorRepository = RevendedorRepository();
  List<Revendedor> revendedores = revendedorRepository.listarRevendedores();

  BrindeRepository brindeRepository = BrindeRepository();
  List<Brinde> brindes = brindeRepository.listarBrindes();

  ClienteRepository clienteRepository = ClienteRepository(
    produtos: produtos,
    revendedores: revendedores,
    brindes: brindes,
  );

  bemVindos();
  anuncio("Produto");
  produtoRepository.relatorioDeVendas();
  produtoRepository.inventario();

  anuncio("Pessoa");
  pessoaRepository.testeFalar();
  pessoaRepository.testeMaioridade();

  anuncio("Revendedor");
  revendedorRepository.testeFalar();
  revendedorRepository.relatorioDeRevendedores();

  anuncio("Brinde");
  brindeRepository.consultarBrindesDisponiveis();

  anuncio("Cliente");
  clienteRepository.testeFalar();
  clienteRepository.quemQuerDinheiro(400);

  int horasRestantes = 6; 
  do {
    clienteRepository.realizarVendaAleatoria();
    horasRestantes--;
  } while (horasRestantes > 0);

  anuncio("Finalização");
  clienteRepository.realizarTrocaDeBrindes();

  clienteRepository.verSacolas();
  clienteRepository.relatorio();

  revendedorRepository.relatorioDeRevendedores();

}
