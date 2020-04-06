import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'home': "My gardens",
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
      'tab_bar_garden': "Gardens",
      'tab_bar_tutos': "Tutorials",
      'tab_bar_profile': "Profile",
      'speed_dial_add_activity': "Add Activity",
      'speed_dial_create_garden': "Create a garden",
      'speed_dial_join_garden': "Join a garden",
      'speed_dial_create_parcel': "Create a parcel",
      'details_parcel_none_association_message': 'No combination of plants is planned in this parcel. Shall we add one ?',
      'details_parcel_add_association_message': "Add a new plant's association",
      'discover_modelings_modeling_tile': "Associations",
      'discover_modelings_tendency_tile': "Tendency",
      'discover_modelings_browse_title': "Browse all",
      'details_modeling_screen_sowing_title': "Sowing",
      'details_modeling_screen_harvest_title': "Harvest",
      'details_modeling_screen_duration': "Duration",
      'details_modeling_screen_months': "months",
      'details_modeling_screen_difficulty': "Difficulty",
      'details_modeling_screen_yield': "Yield",
      'details_modeling_screen_sun': "Sunlight",
      'details_modeling_screen_water': "Water",
      'add_parcel_title': "Create a parcel",
      'add_parcel_name_title': "What's garden's name ?",
      'add_parcel_name_hint': "Parcel's name",
      'add_parcel_name_error': "Parcel's name can't be empty",
      'add_parcel_garden_ground_title': "Do you use a garden box ?",
      'add_parcel_dimensions_title': "What are the dimensions of the parcel ?",
      'add_parcel_garden_scale_label': "(centimeters)",
      'settings_parcel_title': "Parcel's Settings",
      'settings_parcel_delete_button': "Delete this parcel",
      'settings_parcel_delete_title': "Delete this parcel ?",
      'settings_parcel_delete_message': "This action will result in the permanent removal of the parcel.",
      'settings_parcel_leave_button': "Leave parcel ",
      'settings_parcel_leave_title': "Leave this parcel ?",
      'settings_parcel_leave_message': "This action will result in the permanent leaving of the parcel.",
      'extra_actions_settings_button': "Settings",
      'extra_actions_log_out_button': "Log Out",
      'login_title': "Login",
      'login_form_failure_message': "Login Failure",
      'login_form_loading': "Logging In",
      'email': 'Email',
      'email_error': 'Invalid email addresse',
      'speed_dial_activity': "Activity",
      'add_activity_title': "New Activity",
      'add_activity_name': "Activity Name",
      'add_activity_name_error': "Activity Name can't be empty",
      'add_activity_day_selection': "Select activity day",
      'password': 'Password',
      'invalid_password': 'Invalid password',
      'registration_title': 'Registration',
      'registration_failure': 'Registration Failure',
      'registration_loading': 'Registering...',
      'registration_button': "Create an Account"

},
    'fr': {
      'home': "Mes jardins",
      'title': "Partie pédagogie",
      'settings_garden_title': "Paramètres du jardin",
      'settings_garden_name': "Nom du jardin",
      'settings_garden_name_error': "Nom du jardin ne peut être vide",
      'settings_garden_friends_title': "Amis du jardin 😃",
      'settings_confirm_changes': "Confirmer changements",
      'settings_garden_delete_button': "Supprimer jardin",
      'settings_garden_delete_title': "Supprimer ce jardin ?",
      'settings_garden_delete_message': "Cette action entraîne la suppression définitive de toutes les données de ce jardin.",
      'settings_garden_leave_button': "Quitter jardin",
      'settings_garden_leave_title': "Quitter ce jardin ?",
      'settings_garden_leave_message': "Cette action entraîne votre départ de ce jardin et de ces parcelles.",
      'add_garden_title': "Créer un jardin",
      'add_garden_name_title': "Quel est le nom de votre jardin ?",
      'add_garden_name_hint': "Nom jardin",
      'add_garden_name_error': "Nom du jardin ne peut être vide",
      'add_garden_visibilityTitle': "Souhaitez vous rendre ce jardin public ?",
      'button_continue': "Continuer",
      'button_cancel': "Annuler",
      'yes_choice': 'Oui',
      'no_choice': 'Non',
      'add_garden_gardeners_title': "Ajouter quelques jardiniers ?",
      'optional_title': "(optionnel)",
      'continue_button': "CONTINUER",
      'back_button': "REVENIR",
      'finalize_button': 'FINALISER',
      'tab_bar_garden': "Jardins",
      'tab_bar_tutos': "Tutoriels",
      'tab_bar_profile': "Profil",
      'speed_dial_add_activity': "Ajouter Activité",
      'speed_dial_create_garden': "Créer un jardin",
      'speed_dial_join_garden': "Rejoindre un jardin",
      'speed_dial_create_parcel': "Créer une parcelle",
      'details_parcel_none_association_message': 'Aucune association de plantes prévu dans cette parcelle. On en rajoute une ?',
      'details_parcel_add_association_message': "Ajouter une nouvelle association",
      'discover_modelings_modeling_tile': "Associations",
      'discover_modelings_tendency_tile': "Associations du moment",
      'discover_modelings_browse_title': "Autres associations",
      'details_modeling_screen_sowing_title': "Semi",
      'details_modeling_screen_harvest_title': "Récolte",
      'details_modeling_screen_duration': "Durée",
      'details_modeling_screen_months': "mois",
      'details_modeling_screen_difficulty': "Difficulté",
      'details_modeling_screen_yield': "Rendement",
      'details_modeling_screen_sun': "Ensoleillement",
      'details_modeling_screen_water': "Eau",
      'add_parcel_title': "Créer une parcelle",
      'add_parcel_name_title': "Quel est le nom de la parcelle ?",
      'add_parcel_name_hint': "Nom parcelle",
      'add_parcel_name_error': "Nom de la parcelle ne peut être vide",
      'add_parcel_garden_ground_title': "Utilisez vous un bac de culture ?",
      'add_parcel_dimensions_title': "Quelles sont les dimensions de la parcelle ?",
      'add_parcel_garden_scale_label': "(centimètres)",
      'settings_parcel_title': "Paramètres de la parcelle",
      'settings_parcel_delete_button': "Supprimer parcelle",
      'settings_parcel_delete_title': "Supprimer cette parcelle ?",
      'settings_parcel_delete_message': "Cette action entraîne la suppression définitive de toutes les données de cette parcelle.",
      'settings_parcel_leave_button': "Quitter parcelle",
      'settings_parcel_leave_title': "Quitter cette parcelle ?",
      'settings_parcel_leave_message': "Cette action entraîne votre départ de cette parcelle.",
      'extra_actions_settings_button': "Paramètres",
      'extra_actions_log_out_button': "Déconnexion",
      'login_title': "Connexion",
      'login_form_failure_message': "Échec de la connexion",
      'login_form_loading': "Connexion en cours",
      'email': 'Adresse email',
      'email_error': 'Adresse email invalide',
      'speed_dial_activity': "Activité",
      'add_activity_title': "Nouvelle Activité",
      'add_activity_name': "Nom Activité",
      'add_activity_name_error': "Nom de l'activité ne peut être vide",
      'add_activity_day_selection': "Sélectionner le jour de l'activité",
      'password': "Mot de passe",
      'invalid_password': "Mot de passe invalide",
      'registration_title': "Inscription",
      'registration_failure': "Échec de l'inscription",
      'registration_loading': "Inscription en cours",
      'registration_button': "Créer un compte"
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get home {
    return _localizedValues[locale.languageCode]['home'];
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

  String get GardenAddedTitle {
    return _localizedValues[locale.languageCode]['add_garden_title'];
  }

  String get GardenAddedNameTitle {
    return _localizedValues[locale.languageCode]['add_garden_name_title'];
  }

  String get GardenAddedNameHint {
    return _localizedValues[locale.languageCode]['add_garden_name_hint'];
  }

  String get GardenAddedNameError {
    return _localizedValues[locale.languageCode]['add_garden_name_error'];
  }

  String get GardenAddedVisibilityTitle {
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

  String get tabBarGarden {
    return _localizedValues[locale.languageCode]['tab_bar_garden'];
  }

  String get tabBarTutorials {
    return _localizedValues[locale.languageCode]['tab_bar_tutos'];
  }

  String get tabBarProfile {
    return _localizedValues[locale.languageCode]['tab_bar_profile'];
  }

  String get speedDialActivityAdded {
    return _localizedValues[locale.languageCode]['speed_dial_add_activity'];
  }

  String get speedDialCreateGarden {
    return _localizedValues[locale.languageCode]['speed_dial_create_garden'];
  }

  String get speedDialJoinGarden {
    return _localizedValues[locale.languageCode]['speed_dial_join_garden'];
  }

  String get speedDialCreateParcel {
    return _localizedValues[locale.languageCode]['speed_dial_create_parcel'];
  }

  String get detailsParcelAssociationEmpty {
    return _localizedValues[locale.languageCode]['details_parcel_none_association_message'];
  }

  String get detailsParcelAddAssociationMessage {
    return _localizedValues[locale.languageCode]['details_parcel_add_association_message'];
  }

  String get discoverModelingsTitle {
    return _localizedValues[locale.languageCode]['discover_modelings_modeling_tile'];
  }

  String get discoverModelingsTendencyTitle {
    return _localizedValues[locale.languageCode]['discover_modelings_tendency_tile'];
  }

  String get discoverModelingsBrowseTitle {
    return _localizedValues[locale.languageCode]['discover_modelings_browse_title'];
  }

  String get detailsModelingScreenSowingTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_sowing_title'];
  }

  String get detailsModelingScreenHarvestTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_harvest_title'];
  }

  String get detailsModelingScreenDurationTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_duration'];
  }

  String get detailsModelingScreenMonthsLabel {
    return _localizedValues[locale.languageCode]['details_modeling_screen_months'];
  }

  String get detailsModelingScreenDifficultyTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_difficulty'];
  }

  String get detailsModelingScreenYieldTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_yield'];
  }

  String get detailsModelingScreenSunlightTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_sun'];
  }

  String get detailsModelingScreenWaterTitle {
    return _localizedValues[locale.languageCode]['details_modeling_screen_water'];
  }

  String get addParcelTitle {
    return _localizedValues[locale.languageCode]['add_parcel_title'];
  }

  String get addParcelNameTitle  {
    return _localizedValues[locale.languageCode]['add_parcel_name_title'];
  }

  String get addParcelNameHint  {
    return _localizedValues[locale.languageCode]['add_parcel_name_hint'];
  }

  String get addParcelNameError  {
    return _localizedValues[locale.languageCode]['add_parcel_name_error'];
  }

  String get addParcelGardenGroundTitle  {
    return _localizedValues[locale.languageCode]['add_parcel_garden_ground_title'];
  }

  String get addParcelDimensionTitle  {
    return _localizedValues[locale.languageCode]['add_parcel_dimensions_title'];
  }

  String get addParcelScaleLabel  {
    return _localizedValues[locale.languageCode]['add_parcel_garden_scale_label'];
  }

  String get settingsParcelTitle  {
    return _localizedValues[locale.languageCode]['settings_parcel_title'];
  }

  String get settingsParcelDeleteButton  {
    return _localizedValues[locale.languageCode]['settings_parcel_delete_button'];
  }

  String get settingsParcelDeleteTitle  {
    return _localizedValues[locale.languageCode]['settings_parcel_delete_title'];
  }


  String get settingsParcelDeleteMessage  {
    return _localizedValues[locale.languageCode]['settings_parcel_delete_message'];
  }


  String get settingsParcelLeaveButton  {
    return _localizedValues[locale.languageCode]['settings_parcel_leave_button'];
  }

  String get settingsParcelLeaveTitle  {
    return _localizedValues[locale.languageCode]['settings_parcel_leave_title'];
  }


  String get settingsParcelLeaveMessage  {
    return _localizedValues[locale.languageCode]['settings_parcel_leave_message'];
  }

  String get extraActionsSettingsButton  {
    return _localizedValues[locale.languageCode]['extra_actions_settings_button'];
  }


  String get extraActionsLogOutButton  {
    return _localizedValues[locale.languageCode]['extra_actions_log_out_button'];
  }

  String get loginTitle  {
    return _localizedValues[locale.languageCode]['login_title'];
  }


  String get loginFormFailureMessage  {
    return _localizedValues[locale.languageCode]['login_form_failure_message'];
  }

  String get speedDialActivity  {
    return _localizedValues[locale.languageCode]['speed_dial_activity'];
  }


  String get ActivityAddedTitle  {
    return _localizedValues[locale.languageCode]['add_activity_title'];
  }

  String get ActivityAddedName  {
    return _localizedValues[locale.languageCode]['add_activity_name'];
  }

  String get ActivityAddedNameError {
    return _localizedValues[locale.languageCode]['add_activity_name_error'];
  }

  String get ActivityAddedDaySelection {
    return _localizedValues[locale.languageCode]['add_activity_day_selection'];
  }

  String get loginFormLoading {
    return _localizedValues[locale.languageCode]['login_form_loading'];
  }

  String get email {
    return _localizedValues[locale.languageCode]['email'];
  }

  String get invalidEmail {
    return _localizedValues[locale.languageCode]['email_error'];
  }

  String get password {
    return _localizedValues[locale.languageCode]['password'];
  }

  String get invalidPassword {
    return _localizedValues[locale.languageCode]['invalid_password'];
  }

  String get registrationTitle {
    return _localizedValues[locale.languageCode]['registration_title'];
  }

  String get registrationFailure {
    return _localizedValues[locale.languageCode]['registration_failure'];
  }

  String get registrationLoading {
    return _localizedValues[locale.languageCode]['registration_loading'];
  }

  String get registrationButton {
    return _localizedValues[locale.languageCode]['registration_button'];
  }



}


class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}