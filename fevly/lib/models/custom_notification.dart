import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NotificationType { newInvite, voteNow, newFriend, productRemindToBuy }

class CustomNotification {
  final String title, subtitle;
  final DateTime date;
  final IconData? leadingIcon;

  CustomNotification(
      {required this.title,
      required this.subtitle,
      required this.leadingIcon,
      required this.date});

  CustomNotification.newInvite(
      {required this.title,
      this.subtitle = _kSubtitleNewInvite,
      this.leadingIcon = _kNewInvite,
      required this.date});

  CustomNotification.voteNow(
      {required this.title,
      this.subtitle = _kSubtitleVoteNow,
      this.leadingIcon = _kVoteNow,
      required this.date});

  CustomNotification.productRemindToBuy(
      {required this.title,
      this.subtitle = _kSubtitleProductRemindToBuy,
      this.leadingIcon = _kProductRemindToBuy,
      required this.date});
}

//$ CONSTANTS
//$ ========================================================

const IconData _kNewInvite = Icons.mark_email_unread_rounded;
const IconData _kVoteNow = Icons.emoji_events_rounded;
const IconData _kProductRemindToBuy = Icons.shopping_bag_rounded;

const String _kSubtitleVoteNow = "Attribution des badges";
const String _kSubtitleNewInvite = "Invitation à une soirée";
const String _kSubtitleProductRemindToBuy = "Produits à acheter";

//$ METHOD
//$ ========================================================
IconData? getLeadingIconData({required NotificationType type}) {
  switch (type) {
    case NotificationType.newInvite:
      return Icons.mark_email_unread_rounded;

    case NotificationType.voteNow:
      return Icons.emoji_events_rounded;

    case NotificationType.productRemindToBuy:
      return Icons.shopping_bag_rounded;
    default:
      return null;
  }
}
