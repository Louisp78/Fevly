import 'package:fevly/models/badge.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String specialChar = "!\"#\$%&'()*+=`./\\:;<>@[]^_|~";

const String termOfUse = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Venenatis duis fames ut ipsum venenatis et et. Eget nibh vitae quam vitae scelerisque quis natoque. Ut purus enim cras hendrerit sed id ornare. Feugiat leo fermentum in auctor molestie sed pulvinar. Pretium cursus volutpat tortor ultricies senectus blandit scelerisque id fames.
Nisl, urna, est nunc nisl nisl. In ut quis dui egestas ipsum in sagittis vulputate massa. Neque ut cursus quis tempor blandit ac in gravida cursus. Fermentum vel mi, imperdiet pretium. Tristique mi tortor velit non varius. Adipiscing augue tristique odio sit leo commodo cursus.
Tempor nam nisi bibendum arcu, faucibus eget ut. Justo faucibus felis quam feugiat porttitor in nullam cras. Lacus a donec nulla amet dignissim ipsum. Quis et massa purus, sapien. Consectetur vitae neque, nisl, a. Sodales vivamus nec a, enim cum pharetra. Posuere gravida justo, elementum sodales ut est commodo.
Sed amet, velit senectus est nisl. A suspendisse viverra faucibus at mi ipsum a at. Eu iaculis vitae massa tristique blandit leo praesent. Convallis in mauris imperdiet mollis orci nunc nunc. Ut curabitur in eget cras imperdiet libero. Massa quam vitae eu cursus. Ornare egestas amet, pharetra non eros, facilisis. Quam ac imperdiet enim leo amet non.
Pellentesque sem suscipit leo adipiscing sed. Aliquam donec rhoncus vel nunc dictumst cras montes. Ullamcorper integer quisque nisi enim vel pretium nunc, lectus lectus. Nibh purus rhoncus sit et ornare aliquam diam faucibus. Sit et fermentum auctor dignissim blandit. Ullamcorper fermentum ut nunc suspendisse tortor duis cras viverra vel. Et euismod vitae sed tellus venenatis in bibendum ut orci. Risus amet vel scelerisque faucibus proin mauris enim. Lorem molestie vulputate turpis mi. Ultrices ac consequat ultrices scelerisque nam ac.
Vulputate pellentesque vitae arcu tincidunt imperdiet ut adipiscing. Sed aliquam tellus vestibulum molestie sagittis id lacus. Eu duis viverra eu sapien. Scelerisque diam ultricies tellus quis viverra at. Varius eleifend suspendisse malesuada nisl at aenean velit. Morbi quis magna ullamcorper adipiscing tellus hendrerit. Consectetur ipsum praesent quisque iaculis. Vitae aliquam ac vitae aliquam tortor ullamcorper. Quis cum eget libero, eleifend diam eu, et urna. Magnis tempus ornare hendrerit tincidunt congue vitae orci vulputate. Tortor, duis vehicula non a turpis sagittis, quam pulvinar magna. Sodales malesuada a amet lorem in. Fames vitae morbi in metus. Sed aliquet a a feugiat luctus aliquam. Convallis risus vitae turpis gravida posuere fames at.
Lorem congue feugiat nec ut consequat massa, duis ut. Maecenas gravida congue rhoncus ut tortor, volutpat amet ut mi. Sed massa enim, sed in massa eu eget. Lectus felis, eu aliquam adipiscing fringilla morbi viverra. Lorem hendrerit scelerisque id interdum. Viverra aliquet sed dictum vel felis. Turpis varius amet, dolor nisi, vel. Nisl dignissim bibendum aliquam nunc vitae nibh tortor. Vitae lobortis integer sem sagittis. Dictumst varius viverra lorem pellentesque. Fusce turpis pellentesque odio tortor neque odio vitae amet.
Risus suspendisse amet erat quis nulla ut maecenas mus urna. Quis praesent erat nec sed donec in. Egestas imperdiet adipiscing scelerisque consectetur posuere blandit tristique erat fusce. Nisi pellentesque neque faucibus sed porta commodo dignissim convallis. Sed auctor iaculis vulputate lectus sapien lacus, purus nisl. Nec, porta rhoncus, sem venenatis non. Vulputate cursus faucibus sed placerat massa arcu egestas mi, ipsum. Id id in consectetur nulla non tellus auctor.
Viverra quisque id pulvinar tempus eu pulvinar integer porta amet. Consequat gravida in lacinia consectetur ligula purus risus. Commodo et vel ante sit interdum. At sagittis interdum diam sem. Magna at condimentum quis integer urna. Diam, ut risus congue amet egestas eu sed adipiscing odio. Neque, pretium sed nunc, vitae nibh. Consectetur vestibulum morbi aenean cursus diam augue integer pellentesque.
Volutpat ornare volutpat eu ut. Dignissim sit diam donec bibendum fringilla tristique in amet. At pharetra et adipiscing magna elit ac faucibus porta egestas. Tellus eget amet imperdiet ornare magnis. Mi pretium quis bibendum lacus, sed sociis in. Erat nisi, lectus cursus non tristique. In arcu est, vulputate elit. Sem ullamcorper eget cras dictum purus a, eu et cursus. Leo tellus fermentum auctor molestie. At urna, tortor, amet sed nibh neque vulputate iaculis. Enim eget ultrices lorem convallis id amet amet. Ac leo lectus pretium pretium aliquam nibh et. Sed senectus mauris condimentum platea viverra eget gravida. At etiam turpis ridiculus ac enim facilisis.
''';

String validatorMissed({required String source}) =>
    "Oops vous avez oublier votre $source.";

const String snackBarMissingField =
    "Il semble que vous ayez oublié 2 ou 3 trucs...";

String needToBeFriendMessage({required String username}) =>
    "Devenez ami avec $username pour voir ses badges.";

String kBadgeSpecialName({required BadgeCategory category}) {
  switch (category) {
    case BadgeCategory.drink:
      return "d'ambroisie";
    default:
      throw Exception("SpecialName not define for ${category.name}");
  }
}

const double kSmallIconSize = 14;

TextStyle kBasicHintStyle({required TextTheme textTheme}) =>
    textTheme.headline4!.copyWith(color: kTextColor);

TextStyle kSearchHintStyle({required TextTheme textTheme}) =>
    textTheme.headline6!.copyWith(color: kTextColor);

TextStyle kBottomSheetHintStyle({required TextTheme textTheme}) =>
    textTheme.headline5!.copyWith(color: kTextColor);

double kGridCrossSpacing({required Size size}) => size.width * 0.05;
double kGridMainSpacing({required Size size}) => size.height * 0.02;
double kBasicVerticalPadding({required Size size}) => size.height * 0.03;
double kBasicHorizontalPadding({required Size size}) => size.width * 0.05;
