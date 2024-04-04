part of 'recuperar_senha_bloc.dart';

abstract class RecuperarUsuarioEvent {
  const RecuperarUsuarioEvent();

  List<Object> get props => [];
}

class UserRecuperarSenha extends RecuperarUsuarioEvent {
  final String userId;
  final String userName;

  const UserRecuperarSenha(
    this.userId,
    this.userName
  );

  @override
  List<Object> get props => [userId, userName];
}