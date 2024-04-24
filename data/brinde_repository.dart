import '../classes/brinde.dart';
import '../utils.dart';

class BrindeRepository {
  List<Brinde> _brindes = [];

  BrindeRepository() {
    _inicializarBrindesPadrao();
  }

  void _inicializarBrindesPadrao() {
    _brindes = [
      Brinde(
        nome: "Colônia Egeo 10ml",
        qtdEmEstoque: 10,
        pontosNecessarios: 2,
      ),
      Brinde(
        nome: "Nativa Spa Lilac 50ml",
        qtdEmEstoque: 15,
        pontosNecessarios: 2,
      ),
      Brinde(
        nome: "Dr. Botica Tira Nó 50ml",
        qtdEmEstoque: 5,
        pontosNecessarios: 2,
      ),
    ];
  }

  void adicionarBrinde(Brinde brinde) {
    _brindes.add(brinde);
  }

  void removerBrinde(String nome) {
    _brindes.removeWhere((brinde) => brinde.nome == nome);
  }

  List<Brinde> listarBrindes() {
    return List.unmodifiable(_brindes);
  }

  Brinde? _buscarBrindePorNome(String nome) {
    for (Brinde brinde in _brindes) {
      if (brinde.nome.contains(nome)) {
        return brinde;
      }
    }
    return null;
  }

  void consultarBrindesDisponiveis() {
    print("Método consultar brindes:");
    for (Brinde brinde in _brindes) {
      print(
          " - ${brinde.nome} - Estoque ${brinde.qtdEmEstoque} - Pontos necessários: ${brinde.pontosNecessarios}");      
    }
    pularLinha();
  }

  void realizarTrocaBrinde(String nome) {
    try {
      Brinde? brinde = _buscarBrindePorNome(nome);
      if (brinde != null) {
        brinde.realizarTroca();
      } else {
        print("Brinde não encontrado.");
      }
    } catch (e) {
      print(e);
    }
  }
}
