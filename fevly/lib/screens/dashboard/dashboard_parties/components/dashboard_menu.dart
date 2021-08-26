import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeColor themeColor = initThemeColor();
    return Center(
      child: Container(
        width: size.width * 0.4,
        height: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: themeColor.kSurfaceColor,
            borderRadius: BorderRadius.circular(24)),
        child: TabBar(
          labelColor: themeColor.kPrimaryColor,
          indicatorColor: themeColor.kPrimaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: themeColor.kBaseOppositeColor,
          indicatorWeight: 3,
          tabs: const [
            Tab(
              icon: Icon(Icons.groups_rounded, size: 31),
            ),
            Tab(
              icon: Icon(Icons.shopping_bag_rounded, size: 31),
            ),
          ],
        ),
      ),
    );
  }
}


// Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             MenuItem(
//               iconData: Icons.groups_rounded,
//               isSelected: true,
//             ),
//             MenuItem(
//               iconData: Icons.shopping_bag_rounded,
//             ),
//           ],
//         ),