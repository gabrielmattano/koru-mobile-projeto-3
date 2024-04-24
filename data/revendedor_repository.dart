import '../classes/revendedor.dart';
import '../enums.dart';
import 'dart:math';

import '../utils.dart';

class RevendedorRepository {
  List<Revendedor> _revendedores = [];

  RevendedorRepository() {
    _inicializarRevendedoresPadrao();
  }

  void _inicializarRevendedoresPadrao() {
    _revendedores = [
      Revendedor(
        nome: "Luara Kerlen",
        cpf: "22233344455",
        dataDeNascimento: DateTime.parse("1999-06-19"),
        genero: Genero.Feminino,
        matricula: "0007",
      ),
      Revendedor(
        nome: "Janete Silva",
        cpf: "11133344422",
        dataDeNascimento: DateTime.parse("2000-03-09"),
        genero: Genero.Outro,
        matricula: "1000",
      ),
      Revendedor(
        nome: "Eunice Souza",
        cpf: "66677788899",
        dataDeNascimento: DateTime.parse("2001-08-23"),
        genero: Genero.Feminino,
        matricula: "0807",
      ),
      Revendedor(
        nome: "Eustáquio Pereira",
        cpf: "55544433322",
        dataDeNascimento: DateTime.parse("1995-06-17"),
        genero: Genero.Masculino,
        matricula: "3333",
      ),
    ];
  }

  void adicionarRevendedor(Revendedor revendedor) {
    _revendedores.add(revendedor);
  }
  
  void removerRevendedor(String matricula) {
    _revendedores.removeWhere((revendedor) => revendedor.matricula == matricula);
  }

  List<Revendedor> listarRevendedores() {
    return List.unmodifiable(_revendedores);
  }

  void relatorioDeRevendedores() {
    print("Relatório de Revendedores:");
    for (var revendedor in _revendedores) {
      revendedor.verResumo();
    }
    pularLinha();
  }

  void testeFalar() {
    print("Método falar:");
    Random random = new Random();
    int max = _exemploFalas.length;
    for (var revendedor in _revendedores) {
      int index = random.nextInt(max);
      revendedor.falar(_exemploFalas[index]);
    }
    pularLinha();
  }  

  List<String> _exemploFalas = [
    "Temos promoções",
    "Temos muitas promoções",
    "Temos promoções imperdíveis",
    "Temos promoções melhores que a concorrência",
    "Bem-vindo ao Boticário!",
    "Como posso te ajudar?",
    "Quer ver nossas promoções?"
  ];

}