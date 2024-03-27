import 'dart:math';

import 'package:belajar_mvvm_architecture/bloc/user_bloc.dart';
import 'package:belajar_mvvm_architecture/model/user.dart';
import 'package:belajar_mvvm_architecture/ui/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Belajar MVVM Architecture"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.blueGrey,
            onPressed: () {
              bloc.dispatch(random.nextInt(10) + 1);
            },
            child: Text(
              "Pick Random User",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) =>
                (user is UninitializedUser) ? Container() : UserCard(user),
          ),
        ],
      ),
    );
  }
}
