class MyCard {
  int id;
  String name;
  String organization;
  String phone;
  String note;

  MyCard({this.id, this.name, this.organization, this.phone, this.note});

  static MyCard single(List<Map> list) {
    return (list.length == 0)
        ? null
        : fromMap(list.single);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'organization': organization,
      'note': note,
    };
  }

  static MyCard fromMap(Map map) {
    return MyCard(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      organization: map['organization'],
      note: map['note'],
    );
  }

  static List<MyCard> multiple(List<Map> list) {
    return List.generate(list.length, (i) {
      return fromMap(list[i]);
    });
  }
}
