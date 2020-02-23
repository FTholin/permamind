import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'settings_garden_title': "Garden's Settings",
      'settings_garden_name': "Garden's Name",
      'settings_garden_name_error': "Garden's name can't be empty",
      'settings_garden_friends_title': "Garden friends 😃",
      'settings_confirm_changes': "Confirm changes",
      'settings_garden_delete_button': "Delete this garden",
      'settings_garden_delete_title': "Delete this garden ?",
      'settings_garden_delete_message': "This action will result in the permanent removal of the garden.",
      'button_continue': "Continue",
      'button_cancel': "Cancel",
      'settings_garden_leave_button': "Leave garden",
      'settings_garden_leave_title': "Leave this garden ?",
      'settings_garden_leave_message': "This action will result in the permanent leaving of the garden.",
      'add_garden_title': "Create a garden",
      'add_garden_name_title': "What's garden's name ?",
      'add_garden_name_hint': "Garden's name",
      'add_garden_name_error': "Garden's name can't be empty",
      'add_garden_visibilityTitle': "Would you like to make this garden public ?",
      'yes_choice': 'Yes',
      'no_choice': 'No',
      'add_garden_gardeners_title': "Add a few gardeners ?",
      'optional_title': "(optional)",
      'continue_button': "CONTINUE",
      'back_button': "BACK",
      'finalize_button': 'FINALIZE',
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': "",
      '': ""
    },
    'fr': {
      'title': "Partie pédagogie",
      'settings_garden_title': "Paramètres du potager",
      'settings_garden_name': "Nom du potager",
      'settings_garden_name_error': "Nom du potager ne peut être vide",
      'settings_garden_friends_title': "Amis du potager 😃",
      'settings_confirm_changes': "Confirmer changements",
      'settings_garden_delete_button': "Supprimer potager",
      'settings_garden_delete_title': "Supprimer ce potager ?",
      'settings_garden_delete_message': "Cette action entraîne la suppression définitive de toutes les données de ce potager.",
      'settings_garden_leave_button': "Quitter potager",
      'settings_garden_leave_title': "Quitter ce potager ?",
      'settings_garden_leave_message': "Cette action entraîne votre départ de ce potager et de ces parcelles.",
      'add_garden_title': "Créer un potager",
      'add_garden_name_title': "Quel est le nom de votre potager ?",
      'add_garden_name_hint': "Nom potager",
      'add_garden_name_error': "Nom du potager ne peut être vide",
      'add_garden_visibilityTitle': "Souhaitez vous rendre ce potager public ?",
      'button_continue': "Continuer",
      'button_cancel': "Annuler",
      'yes_choice': 'Oui',
      'no_choice': 'Non',
      'add_garden_gardeners_title': "Ajouter quelques jardiniers ?",
      'optional_title': "(optionnel)",
      'continue_button': "CONTINUER",
      'back_button': "REVENIR",
      'finalize_button': 'FINALISER',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get settingsGardenTitle {
    return _localizedValues[locale.languageCode]['settings_garden_title'];
  }

  String get settingsGardenName {
    return _localizedValues[locale.languageCode]['settings_garden_name'];
  }

  String get settingsGardenNameError {
    return _localizedValues[locale.languageCode]['settings_garden_name_error'];
  }

  String get settingsGardenFriendsTitle {
    return _localizedValues[locale.languageCode]['settings_garden_friends_title'];
  }

  String get buttonConfirmChanges {
    return _localizedValues[locale.languageCode]['button_confirm_changes'];
  }

  String get settingsConfirmChanges {
    return _localizedValues[locale.languageCode]['settings_confirm_changes'];
  }

  String get settingsGardenDelete {
    return _localizedValues[locale.languageCode]['settings_garden_delete_button'];
  }

  String get settingsGardenDeleteTitle {
    return _localizedValues[locale.languageCode]['settings_garden_delete_title'];
  }

  String get settingsGardenDeleteMessage {
    return _localizedValues[locale.languageCode]['settings_garden_delete_message'];
  }

  String get settingsGardenLeaveButton {
    return _localizedValues[locale.languageCode]['settings_garden_leave_button'];
  }

  String get settingsGardenLeaveTitle {
    return _localizedValues[locale.languageCode]['settings_garden_leave_button'];
  }

  String get settingsGardenLeaveMessage {
    return _localizedValues[locale.languageCode]['settings_garden_leave_message'];
  }

  String get buttonContinue {
    return _localizedValues[locale.languageCode]['button_continue'];
  }

  String get buttonCancel {
    return _localizedValues[locale.languageCode]['button_cancel'];
  }

  String get addGardenTitle {
    return _localizedValues[locale.languageCode]['add_garden_title'];
  }

  String get addGardenNameTitle {
    return _localizedValues[locale.languageCode]['add_garden_name_title'];
  }

  String get addGardenNameHint {
    return _localizedValues[locale.languageCode]['add_garden_name_hint'];
  }

  String get addGardenNameError {
    return _localizedValues[locale.languageCode]['add_garden_name_error'];
  }

  String get addGardenVisibilityTitle {
    return _localizedValues[locale.languageCode]['add_garden_visibilityTitle'];
  }

  String get yesChoice {
    return _localizedValues[locale.languageCode]['yes_choice'];
  }

  String get noChoice {
    return _localizedValues[locale.languageCode]['no_choice'];
  }

  String get addFewGardenersTitle {
    return _localizedValues[locale.languageCode]['add_garden_gardeners_title'];
  }

  String get optionalTitle {
    return _localizedValues[locale.languageCode]['optional_title'];
  }

  String get continueButton {
    return _localizedValues[locale.languageCode]['continue_button'];
  }

  String get backButton {
    return _localizedValues[locale.languageCode]['back_button'];
  }

  String get finalizeButton {
    return _localizedValues[locale.languageCode]['finalize_button'];
  }





}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}