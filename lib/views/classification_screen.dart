import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Classification extends StatefulWidget {
  const Classification({super.key});

  @override
  State<Classification> createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                ' Definir Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                'Mudar idade',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                ' Adicionar Profissão',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
