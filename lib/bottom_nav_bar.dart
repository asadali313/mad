import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  static const icons = [
    Icons.home_outlined,
    Icons.restaurant_menu,
    Icons.description_outlined,
    Icons.logout,
  ];

  static const labels = ['Home', 'Menu', 'CV', 'Logout'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            children: List.generate(labels.length, (index) {
              final selected = index == selectedIndex;
              return Expanded(
                child: InkWell(
                  onTap: () => onItemSelected(index),
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 32,
                        decoration: BoxDecoration(
                          color: selected ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        icons[index],
                        color: selected ? Colors.blue : Colors.grey,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        labels[index],
                        style: TextStyle(
                          fontSize: 11,
                          color: selected ? Colors.blue : Colors.grey,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
