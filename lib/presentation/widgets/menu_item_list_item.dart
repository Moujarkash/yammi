import 'package:flutter/material.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/presentation/resources/colors.dart';

class MenuItemListItem extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemListItem(this.menuItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(menuItem.image,
              width: 68, height: 45, fit: BoxFit.fill)),
      title: Text(
        menuItem.name,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color(0xff6A6A6A)),
      ),
      subtitle: Text(
        menuItem.price,
        style: const TextStyle(fontSize: 15, color: primaryColor),
      ),
      trailing: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              side: const BorderSide(
                color: primaryColor,
              ),
              primary: Colors.white),
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: primaryColor,
            size: 12,
          ),
          label: const Text(
            'Add',
            style: TextStyle(
                color: primaryColor, fontSize: 12, fontWeight: FontWeight.w600),
          )),
    );
  }
}
