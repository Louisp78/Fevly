import 'package:fevly/model/chat.dart';
import 'package:fevly/model/location.dart';
import 'package:fevly/model/party.dart';
import 'package:fevly/model/user_infos.dart';
import 'package:test/test.dart';

void main() {
  group("Party Basics", () {
    var party = Party(
        name: "Party 1",
        organizer: CurrentUserInfos(
            pseudo: "login", name: "name", password: "password"),
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: Location(
            city: "Bailly",
            address: "1 impasse du poirier au large",
            country: "France"),
        chat: Chat());
    test("get name", () {
      expect(party.name, "Party 1");
    });
  });
}
