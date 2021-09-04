import 'package:fevly/models/custom_notification.dart';

List<CustomNotification> listOfNotifications1 = [
  CustomNotification.newInvite(
      title: "Sophie vous a invité", date: DateTime.now()),
  CustomNotification.voteNow(title: "Vote des badges", date: DateTime.now()),
  CustomNotification.productRemindToBuy(
      title: "12 produits", date: DateTime.now()),
  CustomNotification.productRemindToBuy(
      title: "5 produits", date: DateTime.now()),
  CustomNotification.newInvite(
      title: "Alicia vous a invité", date: DateTime.now()),
  CustomNotification.newInvite(
      title: "John vous a invité", date: DateTime.now()),
  CustomNotification.productRemindToBuy(
      title: "4 produits", date: DateTime.now()),
  CustomNotification.newInvite(
      title: "Malek vous a invité", date: DateTime.now()),
  CustomNotification.newInvite(
      title: "Louis vous a invité", date: DateTime.now()),
];
