class UserModel {
  final String uid;
  final String email;
  final DateTime fechaCreacion;
  final bool estado;

  UserModel({
    required this.uid,
    required this.email,
    required this.fechaCreacion,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fecha_creacion': fechaCreacion,
      'estado': estado,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fechaCreacion: map['fecha_creacion'].toDate(),
      estado: map['estado'],
    );
  }
}