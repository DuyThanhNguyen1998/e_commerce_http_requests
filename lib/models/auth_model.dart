class Auth {
  final String? idToken;
  final String? email;
  final String? localId;
  final String? expiresInDate;

  Auth({
    this.idToken,
    this.email,
    this.localId,
    this.expiresInDate,
  });

  Map<String, Object?> toMap() {
    return {
      'idToken': idToken,
      'email': email,
      'localId': localId,
      'expiresInDate': expiresInDate,
    };
  }
}
