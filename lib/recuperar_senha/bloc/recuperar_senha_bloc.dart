import 'package:flutter_bloc/flutter_bloc.dart';

part 'recuperar_senha_event.dart';
part 'recuperar_senha_state.dart';

class RecuperarUsuarioBloc extends Bloc <RecuperarUsuarioEvent, RecuperarUsuarioState> {
  RecuperarUsuarioBloc() : super(RecuperarSenhaInitial()){
    on<UserRecuperarSenha>((event, emit){
      emit(RecuperarSenhaLoading(event.userId, event.userName));
    });
  }
}