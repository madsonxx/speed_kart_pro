import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
class CustomTextField extends StatelessWidget {
  final String dicaText;
  final TextInputType tipoTexto;
  final TextEditingController controllerTexto;
  final String label;
  final IconData icon;

  const CustomTextField(
      {super.key,
      required this.dicaText,
      this.tipoTexto = TextInputType.name,
      required this.controllerTexto,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        keyboardType: tipoTexto,
        controller: controllerTexto,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          isDense: true,
          hintText: dicaText,
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
