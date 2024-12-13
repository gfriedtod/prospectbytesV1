import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/page/add_prospect_page.dart';

class ProspectDetailPageView extends StatelessWidget {
  const ProspectDetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Akoamballa & co',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddProspectPageView()));
        },
        icon: const Icon(
          LucideIcons.upload,
          color: Colors.white,
        ),
        label: Text(
          'Update',
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: size.width * 0.85,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://afriksportsmagazine.com/wp-content/uploads/2024/02/C3N09690.webp'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Sector of Activity',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Conseil juridique et fiscaliter',
                          style: GoogleFonts.poppins(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Location',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.map_pin),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Super U Bali près de Pategu',
                          style: GoogleFonts.poppins(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.mail),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'info@akoamballa.com',
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Contact',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.contact),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '+237 6 87 41 20 81',
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Contact Profession',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.user_round),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Avocat charger d\'affaire',
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.85,
                          child: Text(
                            softWrap: true,
                            """Absolument ! Pour vous aider à créer une description convaincante du cabinet Akoamballa, j'ai besoin de quelques informations supplémentaires :

Spécialité du cabinet : Droit des affaires, droit de la famille, droit du travail, etc. ?
Valeurs du cabinet : Excellence, proximité, innovation, etc. ?
Services proposés : Conseil juridique, représentation en justice, médiation, etc. ?
Taille du cabinet : Boutique, cabinet d'avocats d'affaires, etc. ?
Public cible : Particuliers, entreprises, etc. ?
Zone géographique d'intervention : Locale, nationale, internationale ?
Particularités du cabinet : Expérience dans un domaine spécifique, approche innovante, etc. ?
Voici quelques exemples de descriptions que vous pourriez adapter en fonction des informations que vous me fournirez :

Exemple 1 : Cabinet d'avocats d'affaires spécialisé
Akoamballa, votre partenaire de confiance pour le droit des affaires.

Fort d'une expertise reconnue dans le domaine du droit des sociétés, le cabinet Akoamballa accompagne les entreprises de toutes tailles dans leurs projets de développement. Notre équipe de juristes expérimentés met à votre disposition un savoir-faire pointu et une approche personnalisée pour vous assister dans vos négociations commerciales, vos opérations de fusion-acquisition et vos contentieux.

Exemple 2 : Cabinet généraliste à dimension humaine
Akoamballa, votre avocat de proximité.

Le cabinet Akoamballa est à votre écoute pour vous conseiller et vous représenter dans tous les domaines du droit. Nous accordons une importance particulière à la relation de confiance que nous établissons avec chacun de nos clients. Notre équipe dynamique et réactive vous garantit une prise en charge personnalisée et efficace de vos dossiers.

Exemple 3 : Cabinet innovant spécialisé dans le droit du numérique
Akoamballa, le droit numérique au service de votre entreprise.

Pionnier dans le domaine du droit de l'internet et des nouvelles technologies, le cabinet Akoamballa vous accompagne dans la transformation numérique de votre entreprise. Nous vous proposons des solutions juridiques sur mesure pour protéger vos données, sécuriser vos activités en ligne et vous conformer à la réglementation en vigueur.

Une fois que vous m'aurez fourni plus de détails, je pourrai vous proposer une description encore plus précise et personnalisée.

Voici quelques éléments supplémentaires qui pourraient enrichir votre description :

Témoignages de clients : Les témoignages de clients satisfaits peuvent renforcer la crédibilité de votre cabinet.
Publications et articles : Si votre cabinet publie des articles ou des études, cela peut démontrer votre expertise et votre veille juridique.
Partenariats : Si vous avez des partenariats avec d'autres professionnels (experts-comptables, notaires, etc.), cela peut élargir votre offre de services.
Engagement sociétal : Si votre cabinet s'engage dans des actions de responsabilité sociale, cela peut mettre en avant vos valeurs et votre implication dans la société.""",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
