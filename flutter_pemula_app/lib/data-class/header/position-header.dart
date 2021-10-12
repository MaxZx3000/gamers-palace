class PositionHeader {
  int id;
  String name;

  PositionHeader({this.id, this.name});

  factory PositionHeader.setFromJSON(Map<String, dynamic> json) {
    return PositionHeader(id: json["id"], name: json["name"]);
  }
}
