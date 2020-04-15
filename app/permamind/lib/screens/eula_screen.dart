import 'package:arch/arch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class EulaScreen extends StatefulWidget {

  @override
  _EulaScreenState createState() => _EulaScreenState();
}

class _EulaScreenState extends State<EulaScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context).appSettingsCgu}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              Text(
                  "1. Informations légales et champ d'application",
                  style: TextStyle(
                    fontSize: 2.5 * SizeConfig.textMultiplier,
                  )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  "1.1. Informations légales",
                  style: TextStyle(
                    fontSize: 2 * SizeConfig.textMultiplier,
                  )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''L’application  “Permamind" (ci-après l ”Application"), qui est accessible sur Playstore et Apple-Store, le site “Permamind" (ci-après le "Site"), qui est accessible à l'adresse https://permamind.com, est créé et exploité par la société Permamind SAS, société à responsabilité limitée de droit français, au capital sociale de EUR 100,00, dont le siège social est situé 18 RUE DES BERLIATTES 38390 MONTALIEU-VERCIEU, immatriculée auprès du Registre de Commerce et des Sociétés de Vienne sous le numéro 877511014. Nous sommes joignables par email à l'adresse info@permamind.com''',
                  style: TextStyle(
                    fontSize: 1.6 * SizeConfig.textMultiplier,
                  )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  "1.2. Champ d'application",
                  style: TextStyle(
                    fontSize: 2 * SizeConfig.textMultiplier,
                  )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Les présentes conditions générales d'utilisation (les "Conditions") s'appliquent à tout utilisateur  de l’Application.''',style: TextStyle(
                    fontSize: 1.6 * SizeConfig.textMultiplier,
                  )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),
              Text(
                  '''Elles ont notamment pour objet de définir les modalités de mise à disposition de l’Application .''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Tout accès et/ou utilisation de l’Application suppose l'acceptation et le respect de l'ensemble des Conditions. Lisez attention les Conditions avant de faire usage de l’Application. Si vous n'acceptez pas l'une quelconque des dispositions des présentes Conditions, n'utilisez pas l’Application. Afin d'utiliser certains services de l’Application, il est possible que nous vous demandions d'accepter des conditions supplémentaires.
''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Text(
                  "1.3. Modification",
                  style: TextStyle(
                    fontSize: 2 * SizeConfig.textMultiplier,
                  )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''Nous nous réservons le droit de réviser et de modifier ces Conditions de temps à autre sans préavis notamment pour refléter les changements des conditions du marché affectant nos activités, les changements technologiques,  les changements dans les lois pertinentes et les exigences réglementaires et des changements dans les capacités de notre système.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Votre utilisation continue des services après que de telles modifications soient faites, démontre votre acceptation de ces changements.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''2. Accès et utilisation''',style: TextStyle(
                fontSize: 2.5 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''2.1. Création d'un compte''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Pour  accéder aux services de l’Application vous devez préalablement créer un compte en remplissant le formulaire d'inscription où vous ferez figurer, selon les indications qui lui seront demandées en ligne et dans les champs prévus à cet effet, les informations obligatoires pour la prise en compte de votre inscription, à savoir notamment une adresse e-mail valide,  en choisissant un mot de passe puis en validant son inscription, ou alternativement en utilisant le compte personnel Google dont vous êtes déjà titulaire en cliquant sur l'onglet "S’inscrire avec Google", et en acceptant préalablement les présentes Conditions.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Dans le cas d'un oubli de mot de passe, vous disposez d'une fonction pour le réinitialiser sur le Site.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''2.2. Identifiant et mot de passe''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''L'identifiant et le mot de passe que vous avez choisis lors de la création de votre compte vous sont propres, personnels et confidentiels.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),

              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),
              Text(
                  '''Vous vous engagez à conserver secret votre identifiant et votre mot de passe et à ne pas le divulguer sous quelque forme que ce soit. La conservation, l'utilisation et la transmission de votre identifiant et de votre mot de passe s'effectuent sous votre entière et unique responsabilité.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Particulièrement, vous êtes averti de l'insécurité inhérente à l'utilisation de la fonction de mémorisation automatique des données de connexion que votre système informatique peut permettre, et déclare assumer l'entière responsabilité de l'utilisation et des conséquences éventuelles d'une telle fonction.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),

              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Toute utilisation de votre identifiant et de votre mot de passe sera présumée avoir été effectuée ou dûment autorisée par vous.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Par conséquent, nous ne saurions en aucun cas être tenu responsable des conséquences préjudiciables résultant des utilisations illicites, frauduleuses ou abusives de votre identifiant et de votre mot de passe et de l'accès au Site par un tiers non expressément autorisé par vous qui résulteraient de votre faute ou de votre négligence.
''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Text(
                  '''En cas d'impossibilité de connexion avec votre identifiant et votre mot de passe, vous devez nous avertir sans délai par email.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),

              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''2.3. Services''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''a) Pack Pionnier''',style: TextStyle(
                fontSize: 1.8 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''L’Application propose à tout utilisateur ayant préalablement créé un compte un service d’accompagnement dans la création et l’entretien d’un potager selon les préceptes de l’écoculture  une méthode de production diversifiée de produits agricoles, développée à la Ferme du Bec-Hellouin par Charles et Perrine Hervé-Gruyer. Le nombre de jardin disponible est limité à unique composé au maximum de 3 parcelles de culture.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''2.4. Garanties''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''En créant un compte sur l’application et en utilisant les services, vous certifiez, garantissez et vous engagez à ce que :''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Les informations que vous fournissez vous sont personnelles, sont exactes et que vous n'utilisez pas les informations personnelles d'autrui sans autorisation, vous êtes légalement capable de conclure des engagements juridiques; vous êtes âgé d'au moins 13 ans et si âgé de moins de 18 ans (ou de l'âge de la majorité selon la loi qui vous est applicable), vous créez votre compte et vous engagés sous la direction, la supervision et avec le consentement de vos représentants légaux;
vos informations personnelles seront mises à jour si nécessaire.
''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''3. Propriété intellectuelle et licence d'utilisation''',style: TextStyle(
                fontSize: 2.5 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''3.1. Propriété intellectuelle''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),



              Text(
                  '''L'ensemble de l’Application et de ses services y incluant leur structure, arborescence, graphisme, codes objet ou source ainsi que leur contenu (notamment textes, graphiques, images, photographies, vidéos, informations, logos, icônes-boutons, logiciels, fichiers audio et autres, bases de données) est la propriété de Permamind, ou de leurs propriétaires respectifs et est protégé par la propriété intellectuelle, notamment par le droit d'auteur et le droit des marques. La dénomination "Permamind App" et le logo "Permamind" sont notamment des marques protégées de Permamind.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''4. Disponibilité des services''',style: TextStyle(
                fontSize: 2.5 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Bien que nous nous efforçons de vous offrir le meilleur service possible, nous ne faisons pas la promesse que les services seront toujours disponibles et répondront à vos besoins, attentes et à la charge; nous ne pouvons garantir que les services seront sans défaut. Si une erreur se produit dans les services, merci de nous le signaler à info@permamind.com et nous essaierons de le corriger la faute dans des délais raisonnable.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Si le besoin s'en fait sentir, nous pouvons suspendre l'accès aux services alors que nous essayons de régler le problème. Nous ne pourrons pas être tenus responsables envers vous si les services ne sont pas disponibles pour une période de temps.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Votre accès aux services peut être occasionnellement restreint pour permettre des réparations, l'entretien ou la mise en place de nouvelles installations ou services. Nous essaierons de rétablir les services dès qu'il sera raisonnablement possible. ''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''5. Limitation de responsabilité''',style: TextStyle(
                fontSize: 2.5 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Nous mettons tous les moyens raisonnables à notre disposition pour assurer un accès de qualité à l’Application ainsi que la sécurité des données que vous nous transmettez via celle-ci, mais n'assumons aucune obligation de résultat à cet égard.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Nous ne garantissons pas le fonctionnement continu de l’Application qui peut notamment être interrompu pour des raisons de maintenance.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Nous ne pouvons être tenus responsable de tout autre dysfonctionnement ou défaillance du réseau ou des serveurs ou de tout autre dysfonctionnement technique échappant à notre contrôle raisonnable qui empêcherait ou altérerait l'accès à tout ou partie de l’Application, ainsi qu'en cas de force majeure telle que définie par la réglementation applicable.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Nous attirons plus particulièrement votre attention sur les limitations et contraintes propres au réseau internet et, l'impossibilité de garantir de manière totale la sécurisation des échanges de données. Il vous appartient à ce titre de prendre toutes les mesures nécessaires pour vous protéger contre les intrusions non autorisées au sein de votre système d'information, notamment en sécurisant votre connexion internet par un mot de passe et un code de sécurité.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''En conséquence, nous ne saurions en aucun cas voir notre responsabilité engagée, directement ou indirectement, du fait des dysfonctionnements de l’Application, y incluant toute perte de données sauvegardées par sur votre compte, causés par une ou plusieurs des caractéristiques techniques inhérentes au réseau Internet, ou au matériel informatique ou aux logiciels utilisés par vos soins, et ce pour quelque raison que ce soit''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''De même, aucun dysfonctionnement de l’Application, y incluant toute perte de données sauvegardées par sur votre compte, ne pourra nous être reproché dès lors qu'un tel dysfonctionnement résulterait d'une mauvaise utilisation de l’Application par vos soins, ou de l'inadéquation du matériel et des logiciels informatiques que vous utilisez au regard des spécifications techniques visées ci-dessus.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''6. Données personnelles''',style: TextStyle(
                fontSize: 2.5 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''Les données à caractère personnel ainsi recueillies sur l’Application sont traitées conformément à la loi modifiée du 2 août 2002 relative à la protection des personnes à l'égard du traitement des données à caractère personnel. Vous disposez d'un droit d'accès et de rectification aux données vous concernant, sous réserve de disposer d'un interêt légitime, et vous pouvez, sous réserve de justifier de raisons prépondérantes et légitimes, vous opposer à leur traitement en vous adressant à info@permamind.com.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''Permamind se réserve, dans l'hypothèse où le membre se rendrait responsable d'une infraction à la législation en vigueur ou d'une atteinte aux droits des tiers, le droit de fournir, à la demande de toute autorité légitime (juridiction, autorité administrative, services de police), tous renseignements permettant ou facilitant l'identification du membre contrevenant.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


              Text(
                  '''Pour plus d'informations, merci de consulter notre "Politique de confidentialité" qui est accessible en ligne et fait partie intégrante des présentes Conditions.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''7.1. Force majeure''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Nous ne serons pas responsables envers vous pour tout manque de performance, indisponibilité ou panne des services, ou pour tout manquement ou retard de notre part pour se conformer à ces conditions, dans le cas où ce manque de performance, indisponibilité ou panne est dû à une cause hors de notre contrôle raisonnable.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''7.2 Preuve / Archivage des preuves''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Les données informatiques générées en raison de l'accès et/ou de l'utilisation de l’Application  (y incluant, notamment, les programmes, données de connexion, fichiers, enregistrements, opérations et autres éléments sur support informatique ou électronique) (les "Données") sont susceptibles d'être conservées et archivées, dans la limite prévue par la loi, par nos soins au sein de notre système informatique, dans des conditions de nature à en garantir l'intégrité.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Les Données font foi entre vous et nous, et seront considérées comme les preuves des communications entre vous et nous.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Les Données constituent une preuve littérale au sens de l'article 1341 du Code civil et ont la même force probante qu'un document qui serait établi, reçu ou conservé par écrit sur support papier.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Par conséquent, les Données pourront être valablement produites comme moyens de preuve et vous être opposées dans le cadre de toute réclamation ou action en justice avec la même force probante que tout document qui serait établi, reçu ou conservé par écrit sur support papier, ce que vous reconnaissez expressément.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Nous nous engageons à ne pas contester la recevabilité, l'opposabilité ou la force probante des Données en raison de leur nature électronique. Vous vous engagez de même.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Vous pouvez avoir accès à l'ensemble des Données sur simple demande nous adressée par courrier simple ou par courrier électronique.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''7.3. Divisibilité''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Si un tribunal ou une autorité compétente décide que l'une des dispositions de ces Conditions n'est pas valide, ou est illégale ou inapplicable dans une certaine mesure, la disposition sera, dans cette mesure seulement, être séparé des autres dispositions, qui continueront à être valables dans toute la mesure permise par la loi.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''7.4. Intégralité de l'accord''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Ces Conditions, ainsi que les conditions supplémentaires éventuelles et tout autre document expressément nommé dans ces termes représentent l'intégralité de l'accord entre nous et remplacent toutes les précédentes discussions, correspondances, négociations, arrangements précédents, entente ou accord entre nous concernant l' objet de ces termes. Nous reconnaissons qu'aucun de nous se fonde sur, une déclaration ou une garantie (si faite involontairement ou par négligence) qui ne figurent pas dans ces termes ou les documents auxquels ils se réfèrent''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Chacun d'entre nous accepte que notre seul recours à l'égard de ces déclarations et garanties tels qu'énoncés dans cet accord (si fait involontairement ou par négligence) sera la rupture de contrat. Rien dans cette section ne limite ou n'exclut la responsabilité en cas de fraude ou de vol.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''7.5. Droit applicable''',style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Les présentes Conditions sont soumises au droit français.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Sous réserve des dispositions légales impératives applicables, les tribunaux français seront exclusivement compétents pour connaître de tout litige lié à l'interprétation, l'application et l'exécution des présentes Conditions, ainsi que de tout litige lié à l'utilisation de l’Application.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),

              Text(
                  '''Ces Conditions sont effectives à compter de leur dernière mise à jour le 15 avril 2020.''',style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
              )),
              Padding(padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),child: Container(),),


            ],
          ),
        ),
      ),
    );
  }
}