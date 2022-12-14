import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModels?>(context);

    //Vai ser ou home ou authenticate dependendo se já estiver feito login
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
