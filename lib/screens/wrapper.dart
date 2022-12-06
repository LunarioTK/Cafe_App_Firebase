import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Vai ser ou home ou authenticate dependendo se já estiver feito login
    return const Home();
  }
}
