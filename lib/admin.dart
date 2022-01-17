import 'package:flutter/material.dart';

class Myadmin extends StatefulWidget {
  const Myadmin({Key? key}) : super(key: key);

  @override
  _MyadminState createState() => _MyadminState();
}

class _MyadminState extends State<Myadmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/admin.png'), fit: BoxFit.fill),
      ),
    );
  }
}
