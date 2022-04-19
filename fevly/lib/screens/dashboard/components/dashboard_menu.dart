import 'dart:typed_data';

import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        width: size.width * 0.4,
        height: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: themeColor.surface.withOpacity(0.5),
            borderRadius: BorderRadius.circular(24)),
        child: TabBar(
          labelColor: themeColor.primary,
          indicatorColor: themeColor.primary,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: themeColor.onBackground,
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
