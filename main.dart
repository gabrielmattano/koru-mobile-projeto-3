import 'classes/cliente.dart';
import 'classes/pessoa.dart';
import 'classes/produto.dart';
import 'classes/revendedor.dart';
import 'utils.dart';
import 'enums.dart';
import 'data/BrindeRepository.dart';

main() {

  // Declaração de objetos Produto
  Produto produto1 = Produto(
    nome: "Desodorante Antitranspirante Aerossol Club 6 125ml", 
    valor: 23.33,
    qtdEmEstoque: 5,
    );
  Produto produto2 = Produto(
    nome: "Shampoo Siàge Remove A Oleosidade 250ml", 
    valor: 42.99,
    qtdEmEstoque: 0,
    );
  Produto produto3 = Produto(
    nome: "Condicionador Instance Frutas Vermelhas 300 ml", 
    valor: 23.99,
    qtdEmEstoque: 50,
    );
  Produto produto4 = Produto(
    nome: "Sérum Facial Multiprotetor FPS 50 12 em 1 Niina Secrets Skin 30ml", 
    valor: 109.99,
    qtdEmEstoque: 2,
    );
  Produto produto5 = Produto(
    nome: "Pó Compacto Adapt Glam Skin Protect 10g", 
    valor: 49.99,
    qtdEmEstoque: 1,
    );
  Produto produto6 = Produto(
    nome: "Malbec Ultra Bleu Desodorante Colônia 100ml", 
    valor: 179.90,
    qtdEmEstoque: 0,
    );
  Produto produto7 = Produto(
    nome: "Egeo Beat Desodorante Colônia 90ml", 
    valor: 119.80,
    qtdEmEstoque: 4,
    );
  Produto produto8 = Produto(
    nome: "Arbo Desodorante Colônia 100ml", 
    valor: 164.90,
    qtdEmEstoque: 7,
    );
  
  // Declaração de entidades Pessoa
  Pessoa pessoaA = Pessoa(
    nome: "Carla",
    cpf: "12345678900",
    dataDeNascimento: DateTime.parse("1987-05-15"),
    genero: Genero.Outro
    );
  Pessoa pessoaB = Pessoa(
    nome: "Joaquina",
    cpf: "95663323585",
    dataDeNascimento: DateTime.parse("2006-03-27"),
    genero: Genero.Feminino
    ); // já fez aniversário este ano -> maior de idade
  Pessoa pessoaC = Pessoa(
    nome: "Antonio", 
    cpf: "95663323585",
    dataDeNascimento: DateTime.parse("2006-08-03"),
    genero: Genero.Masculino
    ); // não fez aniversário este ano -> menor de idade 
  
  // Declaração de entidades Revendedor
  Revendedor revendedorA = Revendedor(
  nome: "Luara Kerlen", 
  cpf: "22233344455",
  dataDeNascimento: DateTime.parse("1999-06-19"),
  genero: Genero.Feminino,
  matricula: "0007",
);
  Revendedor revendedorB = Revendedor(
  nome: "Flavia Lopes",
  cpf: "11133344422", 
  dataDeNascimento: DateTime.parse("2000-03-09"), 
  genero: Genero.Outro, 
  matricula: "1000"
);
  Revendedor revendedorC = Revendedor(
  nome: "Guilherme Bastos", 
  cpf: "66677788899", 
  dataDeNascimento: DateTime.parse("2001-08-23"), 
  genero: Genero.Masculino, 
  matricula: "0807"
);
  Revendedor revendedorD = Revendedor(
  nome: "Gabriel Mattano", 
  cpf: "55544433322", 
  dataDeNascimento: DateTime.parse("1995-06-17"), 
  genero: Genero.Masculino, 
  matricula: "3333"
);

 // Declaração de entidades Cliente
  Cliente cliente1 = Cliente(
    nome: "Gabriel",
    cpf: "123458900",
    dataDeNascimento: DateTime.parse("2000-02-01"),
    genero: Genero.Masculino,
    );
  Cliente cliente2 = Cliente(
    nome: "Flavia",
    cpf: "26430596312",
    dataDeNascimento: DateTime.parse("1994-02-01"),
    genero: Genero.Feminino
    );
  Cliente cliente3 = Cliente(
    nome: "Guilherme M.", 
  cpf: "59762158964", 
  dataDeNascimento: DateTime.parse("1998-02-01"), 
  genero: Genero.Outro,
  );
  Cliente cliente4 = Cliente(
    nome: "Guilherme", 
    cpf: "45889632012", 
    dataDeNascimento: DateTime.parse("1996-02-01"), 
    genero: Genero.Masculino,
    );

  pularLinha();
  print("========================= Testes da classe Produto =========================");
  pularLinha();

  //Saída esperada: "Compra de um(a) produtos Desodorante Antitranspirante Aerossol Club 6 125ml realizada com sucesso"*/
    print(" -> Teste do método realizarVenda (sem Cliente e Revendedor)");
    try{
      produto1.realizarVenda();
    } catch (e){
      print("Não foi possível realizar compra: $e");
    }
    pularLinha();

  /*Saída esperada: "Não foi possível realizar a compra: No momento não possuímos o produto (nome do produto) em estoque"*/
    print(" -> Teste do método realizarVenda (sem Cliente e sem Revendedor)");
    try{
      produto2.realizarVenda();
    } catch (e){
      print("Não foi possível realizar compra: $e");
    };
    pularLinha();

  // Teste do método verReceitaGerada 
    print(" -> Teste do método verReceitaGerada");
    print(produto1.verReceitaGerada());
    print(produto7.verReceitaGerada());
    print(produto2.verReceitaGerada());
    pularLinha();
    print("Realização de venda de mais um produto1 e atualização da receita gerada:");
    produto1.realizarVenda();
    print(produto1.verReceitaGerada());
    print(produto7.verReceitaGerada());
    print(produto2.verReceitaGerada());
    pularLinha();

  print("========================= Testes da classe Pessoa ========================="); 
  pularLinha();

  print(" -> Testes do método falar da classe Pessoa");
   pessoaA.falar("oi tudo bem");
   pularLinha();

  // Teste do método maioridade
    print(" -> Teste do método maioridade");
    pessoaA.maioridade(); //Saída esperada: "Nome, Idade, Maior de idade."
    pessoaB.maioridade(); //Saída esperada: "Nome, Idade, Maior de idade."
    pessoaC.maioridade(); //Saída esperada: "Nome, Idade, Menor de idade."
    pularLinha();
  
  print("========================= Testes da classe Revendedor =========================");
  pularLinha();

   print(" -> Testes do método falar da classe Revendedor");
   revendedorA.falar("Temos promoções");
   revendedorB.falar("Temos muitas promoções");
   revendedorC.falar("Temos promoções imperdíveis");
   revendedorD.falar("Temos promoções melhores que a concorrência");
   pularLinha();

   //Teste do método venderProduto
   print(" -> Teste do método venderProduto");
   try{
    revendedorB.venderProduto(produto5);
   }catch(e){
    print('Não foi possível completar a compra: $e');
   }
   // Saída esperada: "Compra de um(a) (produto nome) realizada com sucesso!"
   pularLinha();
   
   print(" -> Teste do método venderProduto (com excessão)");
   try{
    revendedorB.venderProduto(produto5);
   }catch(e){
    print('Não foi possível completar a compra: $e');
   }
  // Saída esperada: "Não foi possível completar a compra: No momento não possuímos o produto (produto nome) em estoque."
   pularLinha();

   //Teste de lista de vendas do Revendedor
   print(" -> Teste de lista de vendas do revendedor");
   // Saída esperada: A lista de (revendedor nome) é: item \n item

   print("A lista de ${revendedorB.nome} é: ");
   revendedorB.produtosVendidos.forEach((element) {
      print(element.nome);
   });
   pularLinha();

   print("========================= Testes da classe Cliente =========================");
  pularLinha();

    //Teste do método Adicionar Dinheiro
    print(" -> Teste do método Adicionar Dinheiro");

    cliente1.adicionarDinheiro(37.50);
    cliente2.adicionarDinheiro(50.00);
    // Saída esperada: (cliente nome) agora possui (dinheiro).
    pularLinha();

    //Teste do método falar() de cliente.dart:
    print(" -> Teste do método falar de Cliente");
    cliente4.falar("Quero comprar um produto");
    pularLinha();

    //Teste do método comprarProduto():
    print(" -> Testes do método comprarProduto:");
    print("   -> Testes de falta de saldo");
    try{
      cliente3.comprarProduto(produto6, revendedorB);
    }catch(e){
      print("Não foi possível realizar a compra: $e");
    }
    pularLinha();
    // Saída esperada: (cliente nome) não possui dinheiro suficiente para comprar (produto nome)

    print("Adicionando dinheiro para novo teste");
    cliente3.adicionarDinheiro(500);
    pularLinha();

    print(" -> Teste de compra de produto sem estoque");
    try{
      cliente3.comprarProduto(produto6, revendedorB);
    }catch(e){
      print("Não foi possível realizar a compra: $e");
    }
    pularLinha();
    // Saída esperada: Não foi possivel realizar a compra: No momento não possuimos (produto nome) em estoque.

    print(" -> Teste de compra bem sucedida: ");
    try{
      cliente3.comprarProduto(produto4, revendedorA);
    } catch(e){
      print("Não foi possível realizar a compra: $e");
    }
    pularLinha();
    // Saída esperada: Compra de um(a) (produto nome) realizada com sucesso! O saldo atual de (cliente nome) é (dinheiro)

    //Compra de produto extra para Teste de Ordenar Produtos Comprados
    print(" ** -> Compra de produto extra para Teste de Ordenar Produtos Comprados ** ");
    try{
      cliente3.comprarProduto(produto8, revendedorA);
      cliente3.comprarProduto(produto3, revendedorA);
    } catch(e){
      print("Não foi possível realizar a compra: $e");
    }
    pularLinha();

    print("A lista de produtos comprados de ${cliente3.nome} em ordem cronológica (para teste de ordenarProdutosComprados) é: ");
    cliente3.produtosComprados.forEach((element) {
      print(element.nome);
    });
    
    pularLinha();
    //Teste do método ordenarProdutosComprados, e verProdutosComprados:
    print("Teste do método ordenarProdutosComprados, e verProdutosComprados:");
    pularLinha();
    cliente3.verProdutosComprados();
    pularLinha();

    print("========================= Testes Exclusivos para Métodos de Resumo =========================");
    pularLinha();

    cliente1.adicionarDinheiro(1000);
    cliente4.adicionarDinheiro(1000);
    cliente1.comprarProduto(produto7, revendedorC);
    cliente1.comprarProduto(produto7, revendedorC);
    cliente2.comprarProduto(produto3, revendedorC);
    cliente4.comprarProduto(produto3, revendedorC);
    cliente4.comprarProduto(produto3, revendedorC);
    pularLinha();

  //Teste do método verResumo Cliente
    print(" -> Teste do método verResumo Cliente");
    pularLinha(); 
    cliente1.verResumo();
    cliente2.verResumo();
    cliente3.verResumo();
    cliente4.verResumo();
    pularLinha();
    
  //Teste do método verResumo Revendedor
    print(" -> Teste do método verResumo Revendedor");
    pularLinha(); 
    revendedorA.verResumo();
    revendedorB.verResumo();
    revendedorC.verResumo();
    revendedorD.verResumo();
    pularLinha();

print("========================= Testes De Brindes =========================");
      // Simulando adição de dinheiro e compra de produtos para gerar pontos
  cliente3.adicionarDinheiro(700.0);
  for (int i = 0; i < 5; i++) {
    cliente3.comprarProduto(produto3, revendedorC);
  }


  // Testando consulta de pontos para brindes
  brinde1.consultarPontosNecessarios();
  brinde2.consultarPontosNecessarios();
  brinde3.consultarPontosNecessarios();

  // Trocas de pontos por brindes
  cliente1.trocarPontosPorBrinde(brinde1, revendedorA);
  cliente2.trocarPontosPorBrinde(brinde2, revendedorB); 
  cliente3.trocarPontosPorBrinde(brinde1, revendedorC);
  cliente3.trocarPontosPorBrinde(brinde2, revendedorC);
  cliente3.trocarPontosPorBrinde(brinde3, revendedorC);

  // Visualização dos brindes recebidos
  cliente1.verBrindesComprados();
  cliente2.verBrindesComprados();
  cliente3.verBrindesComprados();
}

