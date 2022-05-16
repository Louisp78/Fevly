import 'package:fevly/model/user_infos.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  group("User Basics", () {
    test("Instanciate", () {
      var user =
          UserInfos(name: "Loulou", pseudo: "llouisp78", password: "123456799");
      expect(user.toString(),
          "User(name: Loulou, login: llouisp, password: 123456799)");
    });
    group("User relations", () {
      var user1 =
          UserInfos(name: "Loulou", pseudo: "llouisp", password: "123456799");
      var user2 = UserInfos(
        name: "Loulou",
        pseudo: "llouisp",
        password: "123456799",
      );
      test("Block user", () {
        expect(user1.isBlockedWith(user2), false);
        expect(user1.blockUser(user2), true);
        expect(user1.isBlockedWith(user2), true); // Only user1 have the info
        expect(user2.isBlockedWith(user1), false);
      });
      test("Block user advanced", () {
        expect(user1.sendRequestTo(user2), false);
        expect(user2.sendRequestTo(user1), true);

        expect(user2.unblockUser(user1), false);
        expect(user1.unblockUser(user2), true);
        expect(user1.sendRequestTo(user2), true);
        expect(user2.sendRequestTo(user1), true);

        expect(user1.isFriendWith(user2), true);
        expect(user2.isFriendWith(user1), true);
      });
      test("Friend relationship", () {
        expect(user1.sendRequestTo(user2), false);
        expect(user2.sendRequestTo(user1), false);
        expect(user1.isFriendWith(user2), true);
        expect(user2.isFriendWith(user1), true);

        expect(user1.removeFriend(user2), true);
        expect(user2.sendRequestTo(user1), true);
        expect(user2.undoRequestTo(user1), true);
        expect(user1.acceptRequestFrom(user2), false);

        expect(user2.isFriendWith(user1), false);
        expect(user1.isFriendWith(user2), false);
      });
    });
  });
}
