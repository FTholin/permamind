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
      'learning_title': 'Tutorials',
      'profile_title': 'My profile',
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
      'add_garden_name_title': "Give a name to your garden",
      'add_garden_name_hint': "Garden's name",
      'add_garden_name_error': "Garden's name can't be empty",
      'add_garden_visibilityTitle': "Making the garden public ?",
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
      'create_parcel': "Create a parcel",
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
      'add_parcel_dimensions_title': "Dimensions in centimeters",
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
      'registration_button': "Create an Account",
      'language': "en_US",
      'profile_garden_counter': "gardens",
      'profile_parcel_counter': "parcels",
      'profile_activites_counter': "completed activities",
      'add_parcel_veggies_asking': "What vegetables do you want to grow ?",
      'add_parcel_hint_name': "Give parcel's name",
      'add_parcel_width': 'Width',
      'add_parcel_length': 'Length',
      'add_parcel_none_modeling': 'No association corresponding to your search.',
      'add_parcel_modeling_propositions': 'Here are the associations we recommend !',
      'search': 'Search',
      'add_garden_public_visibility': "The garden is public.",
      'add_garden_private_visibility': "The garden is private.",
      'add_activity_title': 'Title of the new activity ?',
      'add_activity_type': "Type of activity ?",
      'add_activity_snooze': 'When would you like to do it ?',
      'add_activity_submit': 'Submit the activity',
      'rename': 'Rename',
      'update': 'Update',
      'delete': 'Delete',
      'close': 'Close',
      'details_parcel_rename_title': "Rename this parcel",
      'details_parcel_add_culture': 'Launching the culture',
      'details_parcel_add_culture_more': "Click here to start the adventure !",
      'contact_us_title': 'Contact us',
      'contact_us_subject_title': 'Subject',
      'contact_us_subject_hint': "Mail's subject",
      'contact_us_body_title': "Body",
      'contact_us_body_send': "Send Email",
      'premium_dialog_title': "Number of gardens exceeded",
      'premium_dialog_content': "Upgrade to the premium version to take full advantage of the offer",
      'garden_item_rename_tile': "Rename this garden",
      'garden_item_rename_tile': "Rename this garden",
      'garden_item_none_activity': "No activities today",
      'garden_item_one_activity': "activity to be carried out today.",
      'garden_item_multiple_activity': "activities to be carried out today.",
      'parcel_caroussel_wait': "Awaiting launch",
      'parcel_premium_dialog_title': "Number of parcels exceeded",
      'create_parcel_content': "Click here to add a parcel to your garden",
      'profile_stats_tile': "My Stats",
      'profile_status': 'You are a pioneer !',
      'app_settings_cgu': "End-user license agreement",
      'app_settings_thanks': "Acknowledgements",
      'app_settings_disconnect_title': "Logging out of your account",
      'app_settings_disconnect_content': "You're about to disconnect from Permamind.",
      'app_settings_delete_account_title': "Deleting your account",
      'app_settings_delete_account_content': "The deletion of your account will be final.",
      'add_parcel_choose': "Choose this association",
      'forgot_password': 'Forgot password?',
      'log_in_not_member': 'Not a member?',
      'log_in_join': ' Join Permamind 🌱',
      'log_in_or_separator': 'OR',
      'sign_in_google_title': 'Sign in with Google',
    },
    'fr': {
      'home': "Mes jardins",
      'learning_title': 'Tutoriels',
      'profile_title': 'Mon profil',
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
      'add_garden_name_title': "Donner un nom à votre jardin",
      'add_garden_name_hint': "Nom jardin",
      'add_garden_name_error': "Le nom du jardin ne peut être vide",
      'add_garden_visibilityTitle': "Rendre le jardin public ?",
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
      'create_parcel': "Créer une parcelle",
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
      'add_parcel_name_error': "Le nom d'une parcelle ne peut être vide",
      'add_parcel_garden_ground_title': "Utilisez-vous un bac de culture ?",
      'add_parcel_dimensions_title': "Dimensions en centimètres",
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
      'registration_button': "Créer un compte",
      'language': "fr_FR",
      'profile_garden_counter': 'jardins',
      'profile_parcel_counter': 'parcelles',
      'profile_activites_counter': 'activités réalisées',
      'add_parcel_veggies_asking': 'Quels légumes voulez-vous cultiver ?',
      'add_parcel_hint_name': "Donner un nom à votre parcelle",
      'add_parcel_width': 'Largeur',
      'add_parcel_length': 'Longueur',
      'add_parcel_none_modeling': 'Aucune association correspondante à votre recherche.',
      'add_parcel_modeling_propositions': 'Voici les associations que nous vous conseillons !',
      'search': 'Rechercher',
      'add_garden_public_visibility': "Le jardin est public.",
      'add_garden_private_visibility': "Le jardin est privé.",
      'add_activity_title': 'Titre de la nouvelle activité ?',
      'add_activity_type': "Type d'activité ?",
      'add_activity_snooze': 'Quand souhaitez vous la réaliser ?',
      'add_activity_submit': "Soumettre l'activité",
      'rename': 'Renommer',
      'update': 'Mettre à jour',
      'delete': 'Supprimer',
      'close': 'Fermer',
      'details_parcel_rename_title': "Renommer cette parcelle",
      'details_parcel_add_culture': 'Lancer la culture',
      'details_parcel_add_culture_more': "Cliquer ici pour démarrer l'aventure !",
      'contact_us_title': 'Contactez nous',
      'contact_us_subject_title': 'Objet',
      'contact_us_subject_hint': "Objet du mail",
      'contact_us_body_title': "Contenu",
      'contact_us_body_send': "Envoyer email",
      'premium_dialog_title': "Nombre de jardins dépassé",
      'premium_dialog_content': "Passer à la version premium pour profiter pleinement de l'offre",
      'garden_item_rename_tile': "Renommer ce jardin",
      'garden_item_none_activity': "Pas d'activités aujourd'hui",
      'garden_item_one_activity': "activité à réaliser aujourd'hui.",
      'garden_item_multiple_activity': "activités à réaliser aujourd'hui.",
      'parcel_caroussel_wait': "En attente de lancement",
      'parcel_premium_dialog_title': "Nombre de parcelles dépassé",
      'create_parcel_content': "Cliquer ici pour ajouter une parcelle à votre potager",
      'profile_stats_tile': "Mes statistiques",
      'profile_status': 'Vous êtes un pionnier',
      'app_settings_cgu': "Conditions générales d'utilisation",
      'app_settings_thanks': "Remerciements",
      'app_settings_disconnect_title': "Déconnexion de votre compte",
      'app_settings_disconnect_content': "Vous êtes sur le point de vous déconnecter de Permamind.",
      'app_settings_delete_account_title': "Suppression de votre compte",
      'app_settings_delete_account_content': "La suppression de votre compte sera définitive.",
      'add_parcel_choose': "Choisir cette association",
      'forgot_password': 'Mot de passe oublié?',
      'log_in_not_member': 'Non membre?',
      'log_in_join': ' Rejoindre Permamind 🌱',
      'log_in_or_separator': 'OU',
      'sign_in_google_title': 'Connectez-vous avec Google',

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

  String get gardenAddedTitle {
    return _localizedValues[locale.languageCode]['add_garden_title'];
  }

  String get gardenAddedNameTitle {
    return _localizedValues[locale.languageCode]['add_garden_name_title'];
  }

  String get gardenAddedNameHint {
    return _localizedValues[locale.languageCode]['add_garden_name_hint'];
  }

  String get gardenAddedNameError {
    return _localizedValues[locale.languageCode]['add_garden_name_error'];
  }

  String get gardenAddedVisibilityTitle {
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

  String get createParcel {
    return _localizedValues[locale.languageCode]['create_parcel'];
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

  String get language {
    return _localizedValues[locale.languageCode]['language'];
  }

  String get learningTitle {
    return _localizedValues[locale.languageCode]['learning_title'];
  }

  String get profileTitle {
    return _localizedValues[locale.languageCode]['profile_title'];
  }

  String get profileGardenCounter {
    return _localizedValues[locale.languageCode]['profile_garden_counter'];
  }

  String get profileGardenParcels {
    return _localizedValues[locale.languageCode]['profile_parcel_counter'];
  }

  String get profileActivitiesCounter {
    return _localizedValues[locale.languageCode]['profile_activites_counter'];
  }


  String get addParcelVeggiesAsking {
    return _localizedValues[locale.languageCode]['add_parcel_veggies_asking'];
  }

  String get addParcelHintName {
    return _localizedValues[locale.languageCode]['add_parcel_hint_name'];
  }


  String get addParcelWidth {
    return _localizedValues[locale.languageCode]['add_parcel_width'];
  }

  String get addParcelLength {
    return _localizedValues[locale.languageCode]['add_parcel_length'];
  }

  String get addParcelNoneModeling {
    return _localizedValues[locale.languageCode]['add_parcel_none_modeling'];
  }


  String get addParcelModelingPropositions {
    return _localizedValues[locale.languageCode]['add_parcel_modeling_propositions'];
  }

  String get search {
    return _localizedValues[locale.languageCode]['search'];
  }

  String get addGardenPublicVisibility {
    return _localizedValues[locale.languageCode]['add_garden_public_visibility'];
  }

  String get addGardenPrivateVisibility {
    return _localizedValues[locale.languageCode]['add_garden_private_visibility'];
  }

  String get addActivityTitle {
    return _localizedValues[locale.languageCode]['add_activity_title'];
  }

  String get addActivityType {
    return _localizedValues[locale.languageCode]['add_activity_type'];
  }

  String get addActivitySnooze {
    return _localizedValues[locale.languageCode]['add_activity_snooze'];
  }

  String get addActivitySubmit {
    return _localizedValues[locale.languageCode]['add_activity_submit'];
  }

  String get rename {
    return _localizedValues[locale.languageCode]['rename'];
  }

  String get detailsParcelRenameTitle {
    return _localizedValues[locale.languageCode]['details_parcel_rename_title'];
  }

  String get update {
    return _localizedValues[locale.languageCode]['update'];
  }

  String get delete {
    return _localizedValues[locale.languageCode]['delete'];
  }

  String get detailsParcelAddCulture {
    return _localizedValues[locale.languageCode]['details_parcel_add_culture'];
  }

  String get detailsParcelAddCultureMore {
    return _localizedValues[locale.languageCode]['details_parcel_add_culture_more'];
  }

  String get contactUsTitle {
    return _localizedValues[locale.languageCode]['contact_us_title'];
  }


  String get contactUsSubjectHint {
    return _localizedValues[locale.languageCode]['contact_us_subject_hint'];
  }

  String get contactUsSubjectTitle {
    return _localizedValues[locale.languageCode]['contact_us_subject_title'];
  }

  String get contactUsBodyTitle {
    return _localizedValues[locale.languageCode]['contact_us_body_title'];
  }


  String get contactUsBodySend {
    return _localizedValues[locale.languageCode]['contact_us_body_send'];
  }

  String get premiumDialogTitle {
    return _localizedValues[locale.languageCode]['premium_dialog_title'];
  }

  String get premiumDialogContent {
    return _localizedValues[locale.languageCode]['premium_dialog_content'];
  }


  String get close {
    return _localizedValues[locale.languageCode]['close'];
  }

  String get gardenItemRenameTitle {
    return _localizedValues[locale.languageCode]['garden_item_rename_tile'];
  }

  String get gardenItemNoneActivity {
    return _localizedValues[locale.languageCode]['garden_item_none_activity'];
  }


  String get gardenItemOneActivity {
    return _localizedValues[locale.languageCode]['garden_item_one_activity'];
  }

  String get gardenItemMultipleActivity {
    return _localizedValues[locale.languageCode]['garden_item_multiple_activity'];
  }

  String get parcelCarousselWait {
    return _localizedValues[locale.languageCode]['parcel_caroussel_wait'];
  }

  String get parcelPremiumDialogTitle {
    return _localizedValues[locale.languageCode]['parcel_premium_dialog_title'];
  }

  String get createParcelContent {
    return _localizedValues[locale.languageCode]['create_parcel_content'];
  }

  String get profileStatsTile {
    return _localizedValues[locale.languageCode]['profile_stats_tile'];
  }


  String get profileStatus {
    return _localizedValues[locale.languageCode]['profile_status'];
  }

  String get appSettingsCgu {
    return _localizedValues[locale.languageCode]['app_settings_cgu'];
  }

  String get appSettingsThanks {
    return _localizedValues[locale.languageCode]['app_settings_thanks'];
  }


  String get appSettingsDisconnectTitle {
    return _localizedValues[locale.languageCode]['app_settings_disconnect_title'];
  }

  String get appSettingsDisconnectContent {
    return _localizedValues[locale.languageCode]['app_settings_disconnect_content'];
  }

  String get appSettingsDeleteAccountTitle {
    return _localizedValues[locale.languageCode]['app_settings_delete_account_title'];
  }

  String get appSettingsDeleteAccountContent {
    return _localizedValues[locale.languageCode]['app_settings_delete_account_content'];
  }

  String get addParcelChoose {
    return _localizedValues[locale.languageCode]['add_parcel_choose'];
  }

  String get forgotPassword {
    return _localizedValues[locale.languageCode]['forgot_password'];
  }

  String get logInNotMember {
    return _localizedValues[locale.languageCode]['log_in_not_member'];
  }

  String get logInJoin {
    return _localizedValues[locale.languageCode]['log_in_join'];
  }

  String get logInOrSeparator {
    return _localizedValues[locale.languageCode]['log_in_or_separator'];
  }


  String get signInGoogleTitle {
    return _localizedValues[locale.languageCode]['sign_in_google_title'];
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