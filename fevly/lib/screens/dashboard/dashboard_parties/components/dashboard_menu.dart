import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.4,
        height: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: const TabBar(
          labelColor: kPrimaryColor,
          indicatorColor: kPrimaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.black,
          indicatorWeight: 3,
          tabs: [
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