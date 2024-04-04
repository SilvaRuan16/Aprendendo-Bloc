part of 'recuperar_senha_bloc.dart';

abstract class RecuperarUsuarioState {
  const RecuperarUsuarioState();

  List<Object> get props => [];
}

class RecuperarSenhaInitial extends RecuperarUsuarioState {}

class RecuperarSenhaLoading extends RecuperarUsuarioState {
  final String userId;
  final String userName;

  const RecuperarSenhaLoading(
    this.userId,
    this.userName
  );

  @override
  List<Object> get props => [userId, userName];
}