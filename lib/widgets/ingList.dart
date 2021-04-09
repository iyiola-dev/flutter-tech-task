import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final Function select;
  final bool selected;
  final String title;
  final String subtitle;
  final bool expired;
  IngredientList(
      {this.expired, this.selected, this.subtitle, this.title, this.select});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: select,
          selected: selected,
          selectedTileColor: Colors.blue,
          title: Text(
            title,
            style: TextStyle(color: expired ? Colors.grey : Colors.black),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: expired ? Colors.grey : Colors.black),
          ),
        ),
        Divider()
      ],
    );
  }
}
