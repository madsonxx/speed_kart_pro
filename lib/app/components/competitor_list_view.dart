import 'package:flutter/material.dart';
import 'package:speed_kart_pro/app/modules/posicao.dart';

class CompetitorListItem extends StatefulWidget {
  final Posicao competitor;

  const CompetitorListItem({super.key, required this.competitor});

  @override
  State<CompetitorListItem> createState() => _CompetitorListItemState();
}

class _CompetitorListItemState extends State<CompetitorListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.competitor.posicao),
    );
  }
}
