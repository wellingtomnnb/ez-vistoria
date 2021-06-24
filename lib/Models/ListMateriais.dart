class ListMaterial {
  String descricao;

  ListMaterial({this.descricao});

  ListMaterial.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    return data;
  }
}