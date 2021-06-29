class VistoriaTest {
  int id;
  int idimovel;
  int idcomodo;

  VistoriaTest({this.id, this.idcomodo, this.idimovel});

  VistoriaTest.fromMap(dynamic obj) {
    this.id = obj['idvistoria'];
    this.idcomodo = obj['idimovel'];
    this.idimovel = obj['idcomodo'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'idimovel': idimovel, 'idcomodo': idcomodo};
    return map;
  }
}

class ImovelTest {
  int idimovel;
  String cpd;
  String descricao;

  ImovelTest({this.idimovel, this.cpd, this.descricao});

  ImovelTest.fromMap(dynamic obj) {
    this.cpd = obj['cpd'];
    this.descricao = obj['descricao'];
    this.idimovel = obj['idimovel'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'cpd': cpd, 'descricao': descricao};
    return map;
  }
}

class ComodosTest {
  int idimovel;
  String nome;
  int idcomodo;
  ComodosTest({this.idcomodo, this.idimovel, this.nome});

  ComodosTest.fromMap(dynamic obj) {
    this.idcomodo = obj['idcomodo'];
    this.idimovel = obj['idimovel'];
    this.nome = obj['nome'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'idimovel': idimovel, 'nome': nome};
    return map;
  }
}

class ItensTest {
  int iditens;
  String nome;
  String material;
  String condicao;
  String observacao;
  int idfotos;

  ItensTest(
      {this.condicao,
      this.material,
      this.iditens,
      this.idfotos,
      this.nome,
      this.observacao});
  ItensTest.fromMap(dynamic obj) {
    this.iditens = obj['iditens'];
    this.idfotos = obj['idfotos'];
    this.condicao = obj['codicao'];
    this.material = obj['material'];
    this.nome = obj['nome'];
    this.observacao = obj['observacao'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'idfotos': idfotos,
      'condicao': condicao,
      'material': material,
      'nome': nome,
      'observacao': observacao,
    };
    return map;
  }
}

class FotosTest {
  int idfotos;
  String file;
  FotosTest({this.file, this.idfotos});

  FotosTest.fromMap(dynamic obj) {
    this.idfotos = obj['idfotos'];
    this.file = obj['file'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'file': file};
  }
}
