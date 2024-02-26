import 'package:flutter/material.dart';

import '../common/app_color.dart';

class CustomBottomAppbar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const CustomBottomAppbar({
    super.key,
    required this.index,
    required this.onChangedTab,
  });

  @override
  Widget build(BuildContext context) {
    return 
    BottomAppBar(
      elevation: 0.0,
      height: 70.0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTabItem(
            tabIndex: 0,
            icon: const Icon(Icons.home_outlined),
          ),
          buildTabItem(
            tabIndex: 1,
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
 
  }

  Widget buildTabItem({

    
    required int tabIndex,
    required Widget icon,
  }) {
    final isSelected = tabIndex == index;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.black12,
      ),
      child: IconButton(
        onPressed: () {
          onChangedTab(tabIndex);
        },
        padding: const EdgeInsets.all(8.0),
        constraints: const BoxConstraints(maxHeight: 46.0, minHeight: 46),
        icon: icon,
        color: isSelected ? kPrimaryColor : Colors.white,
      ),
    );
  }



}
