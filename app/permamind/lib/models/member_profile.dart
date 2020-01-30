class MemberProfile {
  final String id;
  final String pseudo;
  final String email;
  final String imageUrl;

  const MemberProfile(this.id, this.pseudo, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MemberProfile &&
              runtimeType == other.runtimeType &&
              pseudo == other.pseudo &&
              id == other.id;

  @override
  int get hashCode => pseudo.hashCode;

  @override
  String toString() {
    return pseudo;
  }
}