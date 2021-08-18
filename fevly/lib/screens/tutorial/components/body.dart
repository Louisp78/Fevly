import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/screens/tutorial/components/splash_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'build_dot.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> splashData = [
    {
      "image": "assets/illustrations/undraw_Mobile_life_re_jtih.svg",
      "text":
          "Gérer vos soirées rapidement et simplement sur le tableau de board. Ajouter des produits à apporter, accepter des invitations et parcourir vos soirées n’a jamais été aussi facile. ",
    },
    {
      "image": "assets/illustrations/undraw_online_organizer_ofxm.svg",
      "text":
          "Organiser vos soirée en vous assurant de ne manquer de rien. Ajouter les courses que les invités doivent apporter et chatter directement avec tout les invités.",
    },
    {
      "image": "assets/illustrations/undraw_winners_ao2o.svg",
      "text": "tesksdsdjfk",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]['text'],
                    image: splashData[index]['image'],
                  )),
          Positioned(
              bottom: size.height * 0.023,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length,
                            (index) => buildDot(
                                index: index, currentPage: currentPage))),
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextButton(
                    press: () => currentPage != 2
                        ? _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate)
                        : {},
                    text: currentPage != 2 ? "Suivant" : "Terminé",
                  )
                ],
              )),
        ],
      ),
    );
  }
}
