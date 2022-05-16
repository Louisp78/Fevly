import 'package:fevly/components/dialog/delete_account.dart';
import 'package:fevly/components/dialog/disconnect.dart';
import 'package:fevly/model/option_item.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:flutter/material.dart';

List<OptionItem> buildOptions({required BuildContext context}) => [
      OptionItem(
        title: 'Politique de confidentialité',
        prefixWidget: const Icon(Icons.lock),
        onTap: () {},
      ),
      OptionItem(
        title: "Conditions d'utilisation",
        prefixWidget: const Icon(Icons.person_search_rounded),
        onTap: () => Navigator.pushNamed(context, '/terms_of_use'),
      ),
      OptionItem(
        title: 'Aide',
        prefixWidget: const Icon(Icons.help_outline_rounded),
        onTap: () {},
      ),
      OptionItem(
        title: 'Confidentialité du compte',
        prefixWidget: const Icon(Icons.admin_panel_settings_outlined),
        onTap: () {},
      ),
      OptionItem(
        title: 'Signaler un problème',
        prefixWidget: const Icon(Icons.bug_report_rounded),
        onTap: () {},
      ),
      OptionItem(
          title: 'Se déconnecter',
          prefixWidget: const Icon(Icons.logout_rounded),
          onTap: () => buildDisconnectDialog(context: context)),
      OptionItem(
        title: 'Supprimer le compte',
        prefixWidget: const Icon(Icons.delete_forever_rounded),
        onTap: () => buildDeleteAccountDialog(
          context: context,
          onRequiresRecentLogin: () => Navigator.pushNamed(
            context,
            '/reauthenticate',
            arguments: ReauthenticationType.deleteAccount,
          ),
        ),
      ),
    ];
