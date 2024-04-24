import '../classes/pessoa.dart';
import '../enums.dart';
import 'dart:math';
import '../utils.dart';

class PessoaRepository {
  List<Pessoa> _pessoas = [];

  // Construtor que pode ser usado para inicializar com alguns dados de teste
  PessoaRepository() {
    _inicializarPessoasPadrao();
  }

  void _inicializarPessoasPadrao() {
    _pessoas = [
      Pessoa(
        nome: "João Silva",
        cpf: "12345678909",
        dataDeNascimento: DateTime.parse("2014-05-15"),
        genero: Genero.Masculino,
      ),
      Pessoa(
        nome: "Maria Fernanda",
        cpf: "98765432109",
        dataDeNascimento: DateTime.parse("2009-05-15"),
        genero: Genero.Feminino,
      ),
      Pessoa(
        nome: "Carla",
        cpf: "12345678900",
        dataDeNascimento: DateTime.parse("1987-05-15"),
        genero: Genero.Outro,
      ),
      Pessoa(
        nome: "Joaquina",
        cpf: "95663323585",
        dataDeNascimento: DateTime.parse("2006-03-27"),
        genero: Genero.Feminino,
      ), // já fez aniversário este ano -> maior de idade
      Pessoa(
        nome: "Antonio",
        cpf: "95663323585",
        dataDeNascimento: DateTime.parse("2006-08-03"),
        genero: Genero.Masculino,
      ), // não fez aniversário este ano -> menor de idade
    ];
  }

  // Método para adicionar uma pessoa ao repositório
  void adicionarPessoa(Pessoa pessoa) {
    _pessoas.add(pessoa);
  }

  // Método para remover uma pessoa pelo CPF
  void removerPessoa(String cpf) {
    _pessoas.removeWhere((pessoa) => pessoa.cpf == cpf);
  }

  // Método para buscar uma pessoa pelo CPF
  Pessoa? buscarPessoaPorCpf(String cpf) {
    for (Pessoa pessoa in _pessoas) {
      if (pessoa.cpf == cpf) {
        return pessoa;
      }
    }
    return null;
  }

  // Método para listar todas as pessoas
  List<Pessoa> listarPessoas() {
    return List.unmodifiable(_pessoas);
  }

  void testeMaioridade() {
    print("Método maioridade:");
    for (Pessoa pessoa in _pessoas) {
      pessoa.maioridade();
    }
    pularLinha();
  }


  void testeFalar() {
    print("Método falar:");
    Random random = new Random();
    int max = _exemploFalas.length;    
    for (Pessoa pessoa in _pessoas) {
      int index = random.nextInt(max);
      pessoa.falar(_exemploFalas[index]);
    }
    pularLinha();
  }

  List<String> _exemploFalas = [
    "Olá!",
    "Bom dia!",
    "Tchau!",
    "Até mais!",
    "Boa noite!",
    "Boa tarde!",
    "Que lindo dia!",
    "Como vai?",
    "E as namoradinhas?",
    "Como vai a família?", 
  ];

}
