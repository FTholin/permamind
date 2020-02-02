class GardenMember {
  final String id;
  final String pseudo;

  GardenMember({this.id, this.pseudo});

  GardenMember.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        pseudo = data['pseudo'];

  Map<String, Object> toJson() {
    return {
      'id': id,
      'pseudo': pseudo
    };
  }
}