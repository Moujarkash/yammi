import 'package:flutter/material.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/presentation/resources/dimensions.dart';
import 'package:yammi/presentation/widgets/menu_item_list_item.dart';

class MenuListItem extends StatelessWidget {
  final Menu menu;

  const MenuListItem(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(menu.menu, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
        const SizedBox(height: 12,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(roundRadius),
            color: Colors.white,
          ),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final menuItem = menu.items[index];
              return MenuItemListItem(menuItem);
            }, 
            separatorBuilder: (context, index) => const Divider(), 
            itemCount: menu.items.length
          ),
        ),
      ],
    );
  }
}