import 'dart:math';

import 'package:appbloc/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/src/provider.dart';

// Testando git

void main() {
  runApp(
    const MaterialApp(
      home: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(child: Text('Aulas Bloc', style: TextStyle(color: Colors.white),)),
      ),
      body: SizedBox.expand(
        child: BlocProvider(
          create: (context) => UserBloc(),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {

              if(state is UserInitial){
                Future.delayed(Duration(seconds: 3)).then((value){
                  context.read<UserBloc>().add(UserLogin('1', 'Ruan'));
                });
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              /*
              
              if(state is UserInitial){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Usuário não logado!'),
                    const SizedBox(height: 16,),
                    ElevatedButton(
                      onPressed: () => context.read<UserBloc>().add(UserLogin('1', 'Ruan')),
                      child: const Text('Fazer login'),
                    ),
                  ],
                );
              }

              */

              if(state is UserLoogedIn) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Id usuario: ${state.userId}', style: const TextStyle(fontSize: 30, color: Colors.green),),
                    const SizedBox(height: 16,),
                    Text('Nome: ${state.userName}', style: const TextStyle(fontSize: 30, color: Colors.green),),
                    const SizedBox(height: 32,),
                    ElevatedButton(
                      onPressed: () {
                        var rng = Random();
                        var maxnumber = 400;
                        context.read<UserBloc>().add(UserLogin(rng.nextInt(maxnumber).toString(), 'Marcos'),);
                      },
                      child: const Text('Mudar valor'),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}