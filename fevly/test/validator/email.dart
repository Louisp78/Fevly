import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final email_pattern =
      RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  group("email basics", () {
    test("valid one",
        () => expect(email_pattern.hasMatch('placelouis@gmail.com'), true));
    test("missing pseudo",
        () => expect(email_pattern.hasMatch('@domainsample.com'), false));
    test("missing @",
        () => expect(email_pattern.hasMatch('johndoedomainsample.com'), false));
    test("fixing missing pseudo",
        () => expect(email_pattern.hasMatch('ok@domainsample.com'), true));
    test("no domain",
        () => expect(email_pattern.hasMatch('john.doe@.net'), false));
    test("fix no domain",
        () => expect(email_pattern.hasMatch('john.doe@gmail.net'), true));
    test("no dot",
        () => expect(email_pattern.hasMatch('john.doe43@domainsample'), false));
    test(
        "fix no dot",
        () => expect(
            email_pattern.hasMatch('john.doe43@domainsample.com'), true));
  });
  group("weird shit", () {
    test("double dot",
        () => expect(email_pattern.hasMatch('John..Doe@example.com'), false));
    test("before dot",
        () => expect(email_pattern.hasMatch('".John.Doe"@example.com'), true));
    test("after dot",
        () => expect(email_pattern.hasMatch('"John.Doe."@example.com'), true));
    test("good double dot",
        () => expect(email_pattern.hasMatch('"John..Doe"@example.com'), true));
  });
  group("Hardcore valid tests", () {
    test("simple@example.com",
        () => expect(email_pattern.hasMatch('simple@example.com'), true));
    test("very.common@example.com",
        () => expect(email_pattern.hasMatch('very.common@example.com'), true));
    test(
        "disposable.style.email.with+symbol@example.com",
        () => expect(
            email_pattern
                .hasMatch('disposable.style.email.with+symbol@example.com'),
            true));
    test(
        "other.email-with-hyphen@example.com",
        () => expect(
            email_pattern.hasMatch('other.email-with-hyphen@example.com'),
            true));
    test(
        "fully-qualified-domain@example.com",
        () => expect(
            email_pattern.hasMatch('fully-qualified-domain@example.com'),
            true));
    test(
        "user.name+tag+sorting@example.com",
        () => expect(
            email_pattern.hasMatch('user.name+tag+sorting@example.com'), true));
    test("x@example.com",
        () => expect(email_pattern.hasMatch('x@example.com'), true));
    test(
        "example-indeed@strange-example.com",
        () => expect(
            email_pattern.hasMatch('example-indeed@strange-example.com'),
            true));
    test("test/test@test.com",
        () => expect(email_pattern.hasMatch('test/test@test.com'), true));
    test("admin@mailserver1",
        () => expect(email_pattern.hasMatch('admin@mailserver1'), true));
    test("example@s.example",
        () => expect(email_pattern.hasMatch('example@s.example'), true));
    test('" "@example.org',
        () => expect(email_pattern.hasMatch('" "@example.org'), true));
    test('"john..doe"@example.org',
        () => expect(email_pattern.hasMatch('"john..doe"@example.org'), true));
    test(
        "mailhost!username@example.org",
        () => expect(
            email_pattern.hasMatch('mailhost!username@example.org'), true));
    test(
        '"very.(),:;<>[]\".VERY.\"very@\\ \"very\".unusual"@strange.example.com',
        () => expect(
            email_pattern.hasMatch(
                '"very.(),:;<>[]\".VERY.\"very@\\ \"very\".unusual"@strange.example.com'),
            true));

    test(
        "user%example.com@example.org",
        () => expect(
            email_pattern.hasMatch('user%example.com@example.org'), true));

    test("user-@example.org",
        () => expect(email_pattern.hasMatch('user-@example.org'), true));
    test(
        "postmaster@[123.123.123.123]",
        () => expect(
            email_pattern.hasMatch('postmaster@[123.123.123.123]'), true));
    test(
        "postmaster@[IPv6:2001:0db8:85a3:0000:0000:8a2e:0370:7334]",
        () => expect(
            email_pattern.hasMatch(
                'postmaster@[IPv6:2001:0db8:85a3:0000:0000:8a2e:0370:7334]'),
            true));
  });
  group("Hardcore not valid", () {
    test('Abc.example.com',
        () => expect(email_pattern.hasMatch('Abc.example.com'), false));

    test('A@b@c@example.com',
        () => expect(email_pattern.hasMatch('A@b@c@example.com'), false));

    test(
        'a"b(c)d,e:f;g<h>i[j\k]l@example.com',
        () => expect(
            email_pattern.hasMatch('a"b(c)d,e:f;g<h>i[j\k]l@example.com'),
            false));
  });
}
