import 'package:fevly/screens/party/party_chat/bottom_bar_chat.dart';
import 'package:flutter/material.dart';

class PartyChatScreen extends StatelessWidget {
  const PartyChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
