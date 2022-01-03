import 'package:fevly/screens/party/components/bottom_bar_chat.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor(context: context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) => const Text("Chat Text", style: TextStyle(color: Colors.amber)))),
          ],
        ),
        const Positioned(bottom: 50, child: BottomBarChat()),
      ],
    );
  }
}
