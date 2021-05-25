import 'package:flutter/material.dart';
import 'package:yammi/data/models/menu/menu.dart';
import 'package:yammi/presentation/resources/colors.dart';
import 'package:yammi/presentation/resources/dimensions.dart';

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
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(menuItem.image, width: 68, height: 45, fit: BoxFit.fill)
                ),
                title: Text(menuItem.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
                subtitle: Text(menuItem.price, style: const TextStyle(fontSize: 15),),
                trailing: ElevatedButton.icon(
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                  // ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: primaryColor,),
                    primary: Colors.white
                  ),
                  onPressed: () {}, 
                  icon: const Icon(Icons.add, color: primaryColor, size: 12,), 
                  label: const Text('Add', style: TextStyle(color: primaryColor, fontSize: 12, fontWeight: FontWeight.w600),)
                ),
              );
            }, 
            separatorBuilder: (context, index) => const Divider(), 
            itemCount: menu.items.length
          ),
        ),
      ],
    );
  }
}