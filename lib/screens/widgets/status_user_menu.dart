import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat2/mobx/login/mob_login.dart';

class State_user extends StatelessWidget {
  State_user({Key? key}) : super(key: key);
  final Mob_login mob_login = GetIt.I<Mob_login>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  mob_login.nome,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Text(
            "Status: Online",
            style: TextStyle(fontSize: 13, color: Colors.white),
          )
        ],
      ),
    );
  }
}
