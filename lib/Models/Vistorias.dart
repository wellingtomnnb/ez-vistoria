class Vistorias {
  List<Vistoria> vistoria;

  Vistorias({this.vistoria});

  Vistorias.fromJson(Map<String, dynamic> json) {
    if (json['vistoria'] != null) {
      vistoria = new List<Vistoria>();
      json['vistoria'].forEach((v) {
        vistoria.add(new Vistoria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vistoria != null) {
      data['vistoria'] = this.vistoria.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vistoria {
  Imovel imovel;
  List<Comodos> comodos;

  Vistoria({this.imovel, this.comodos});

  Vistoria.fromJson(Map<String, dynamic> json) {
    imovel =
        json['imovel'] != null ? new Imovel.fromJson(json['imovel']) : null;
    if (json['comodos'] != null) {
      comodos = new List<Comodos>();
      json['comodos'].forEach((v) {
        comodos.add(new Comodos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imovel != null) {
      data['imovel'] = this.imovel.toJson();
    }
    if (this.comodos != null) {
      data['comodos'] = this.comodos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Imovel {
  String cpd;
  String descricao;

  Imovel({this.cpd, this.descricao});

  Imovel.fromJson(Map<String, dynamic> json) {
    cpd = json['cpd'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cpd'] = this.cpd;
    data['descricao'] = this.descricao;
    return data;
  }
}

class Comodos {
  String nome;
  List<Itens> itens;

  Comodos({this.nome, this.itens});

  Comodos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    if (json['itens'] != null) {
      itens = new List<Itens>();
      json['itens'].forEach((v) {
        itens.add(new Itens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Itens {
  String nome;
  String material;
  String condicao;
  String observacao;
  List<Fotos> fotos;

  Itens({this.nome, this.material, this.condicao, this.observacao, this.fotos});

  Itens.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    material = json['material'];
    condicao = json['condicao'];
    observacao = json['observacao'];
    if (json['fotos'] != null) {
      fotos = new List<Fotos>();
      json['fotos'].forEach((v) {
        fotos.add(new Fotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['material'] = this.material;
    data['condicao'] = this.condicao;
    data['observacao'] = this.observacao;
    if (this.fotos != null) {
      data['fotos'] = this.fotos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fotos {
  String file;

  Fotos({this.file});

  Fotos.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    return data;
  }
}

class TestePull{

}