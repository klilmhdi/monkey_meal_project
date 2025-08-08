import 'package:flutter/material.dart';

import '../../../core/consts/colors/colors.dart'; // Assurez-vous que le chemin est correct
import '../../helper/helper.dart'; // Assurez-vous que le chemin est correct
import '../home/home_screen.dart'; // Assurez-vous que le chemin est correct et que HomeScreen a un routeName défini

class FirstIntroScreen extends StatefulWidget {
  static String routeName = "/intro"; // Définition de la route pour cet écran

  const FirstIntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<FirstIntroScreen> {
  late PageController _controller; // Déclaration du PageController
  late int count; // Variable pour suivre la page actuelle

  // Liste des pages d'introduction avec image, titre et description
  final List<Map<String, String>> _pages = [
    {
      // Correction des noms d'images pour correspondre aux assets réels (selon l'erreur précédente)
      "image": "first.png",
      "title": "Find Food You Love",
      "desc":
      "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    },
    {
      "image": "sec.png",
      "title": "Fast Delivery",
      "desc": "Fast food delivery to your home, office wherever you are"
    },
    {
      "image": "third.png",
      "title": "Live Tracking",
      "desc":
      "Real time tracking of your food on the app once you placed the order"
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(); // Initialisation du PageController
    count = 0; // Initialisation de la page actuelle à 0
  }

  @override
  void dispose() {
    _controller.dispose(); // Très important : libérer les ressources du controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Spacer(), // Espace flexible en haut
                Container(
                  height: 400, // Hauteur fixe pour le PageView
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value; // Mise à jour de la page actuelle
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/images/${_pages[index]["image"]!}', // Chemin de l'image
                        fit: BoxFit.contain, // Ajustement de l'image
                      );
                    },
                    itemCount: _pages.length, // Nombre total de pages
                  ),
                ),
                // Indicateurs de page (points)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor:
                        count == index ? AppColor.orange : AppColor.placeholder,
                      ),
                    );
                  }),
                ),
                Spacer(), // Espace flexible
                // Titre de la page actuelle
                Text(
                  _pages[count]["title"]!,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold, // Style en gras
                    fontSize: 24, // Taille de police
                    color: Colors.black, // Couleur du texte
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(), // Espace flexible
                // Description de la page actuelle
                Text(
                  _pages[count]["desc"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700], // Couleur de texte plus douce
                  ),
                ),
                Spacer(), // Espace flexible
                // Bouton "Next"
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Vérifie si ce n'est pas la dernière page
                      if (count < _pages.length - 1) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300), // Durée de l'animation
                          curve: Curves.easeIn, // Courbe d'animation
                        );
                      } else {
                        // Si c'est la dernière page, navigue vers l'écran d'accueil
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.orange, // Couleur du bouton
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Bords arrondis
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 18), // Style du texte du bouton
                    ),
                  ),
                ),
                Spacer() // Espace flexible en bas
              ],
            ),
          ),
        ),
      ),
    );
  }
}
