import 'package:flutter/material.dart';

import '../common/app_color.dart';
import 'custom_menu_card.dart';
import 'my_text_style.dart';

class CustomMenuItemsList extends StatelessWidget {
  const CustomMenuItemsList({
    super.key,
    required this.itemList,
    required this.heading,
  });
  final List itemList;
  final String? heading;
  //final MyController _myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (heading != null)
          //   Container(
          //     width: size.width,
          //     decoration: const BoxDecoration(
          //       border: Border(
          //         bottom: BorderSide(width: 1.0, color: Colors.black12),
          //       ),
          //     ),
          //     margin: const EdgeInsets.only(bottom: 6.0),
          //     child: Text(
          //       "$heading",
          //       style: myTextStyle(size: 20.0, clr: kPrimaryColor),
          //     ),
          //   ), Container(

          Text(
            "$heading",
            style: myTextStyle(size: 20.0, clr: Colors.black),
          ),
          const Divider(
            thickness: 1.0,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 140.0,
              mainAxisSpacing: 04.0,
              crossAxisSpacing: 04.0,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = itemList[index];
              return LayoutBuilder(
                builder: (_, constraints) => CustomMenuCard(
                  cardColor: CardColor,
                  onTap: () {
                    //final List<Map<String, dynamic>> selectedExpenseData = [];
                    // Get.toNamed(
                    //   '${itemList[index]["page"]}',
                    //   arguments: {
                    //     'order_data': selectedExpenseData,
                    //   },
                    // );
                    // Get.toNamed(
                    //   '${item['page']}'
                    // );
                    // Navigator.pushNamed(context, item['page']);

                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  item['page']),

                   );
                 
                  },
                  // cardColor: Colors.grey.shade200,
                  // cardColor: const Color(0xffC8E6C9),
                  icon: item['icon'],
                  title: item['title'],
                  titleSize: constraints.minWidth * 0.12,
                  iconSize: constraints.minWidth * 0.30,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
