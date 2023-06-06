import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
class CustomTextField extends StatelessWidget {
  final String legenda;
  final String dicaText;
  final TextInputType tipoTexto;
  final TextEditingController controllerTexto;
  final String label;
  final IconData icon;
  final double iconSize;

  const CustomTextField(
      {super.key,
      required this.dicaText,
      this.tipoTexto = TextInputType.name,
      required this.controllerTexto,
      required this.label,
      required this.icon,
      required this.legenda,
      this.iconSize = 18});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.only(bottom: 15.0, left: 8, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                legenda,
                style: TextStyle(fontSize: iconSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                keyboardType: tipoTexto,
                controller: controllerTexto,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(icon),
                  isDense: true,
                  hintText: dicaText,
                  labelText: label,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
