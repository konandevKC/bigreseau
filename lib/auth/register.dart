import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final apiUrl = 'https://yakinci.com/testing/register.php';
  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
            height: longeur,
            width: largeur,
            child: SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode
                    .always, // Activer la validation automatique
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        BackButton(
                          color: const Color.fromARGB(255, 0, 57, 103),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer()
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'EmpowerTogether',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 60, 163)),
                      ),
                    ),
                    const Text(
                      'Creer un nouveau compte.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FormBuilderTextField(
                        name: 'nom&prenom',
                        decoration: const InputDecoration(
                            labelText: 'Nom & Prenom',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FormBuilderTextField(
                        name: 'email',
                        decoration: const InputDecoration(
                            labelText: 'Adresse e-mail',
                            suffixText: '@gmail.com',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FormBuilderTextField(
                        name: 'password',
                        decoration: const InputDecoration(
                            labelText: 'Mot de passe',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FormBuilderTextField(
                        name: 'password',
                        decoration: const InputDecoration(
                            labelText: 'Mot de passe comfirme',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 34),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(20, 60),
                          backgroundColor:
                              const Color.fromARGB(255, 0, 60, 109)),
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          // Validation réussie, traiter les données du formulaire
                          final formData = _formKey.currentState!.value;
                          try {
                            // Envoyer les données du formulaire à l'API
                            final response = await http.post(
                              Uri.parse(apiUrl),
                              body: formData,
                            );

                            if (response.statusCode == 200) {
                              // Traitement réussi, afficher un message de succès
                              print("Succès : ${response.body}");
                            } else {
                              // Traitement échoué, afficher un message d'erreur
                              print("Erreur : ${response.statusCode}");
                            }
                          } catch (e) {
                            // Erreur lors de la connexion à l'API
                            print("Erreur : $e");
                          }

                          // Effectuer les opérations de connexion sécurisée ici
                          print(formData);
                        }
                      },
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      '-Or sign in with-',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Action lorsque le bouton Facebook est cliqué
                            // Insérez le code de connexion avec Facebook ici
                          },
                          child: Image.network(
                            'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689605308/insta_nyzdoe.png', // Chemin de votre image pour Facebook
                            width: 100,
                            height: 70,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Action lorsque le bouton Google est cliqué
                            // Insérez le code de connexion avec Google ici
                          },
                          child: Image.network(
                            'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689605308/go_hbj3m9.png', // Chemin de votre image pour Google
                            width: 100,
                            height: 70,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Action lorsque le bouton Twitter est cliqué
                            // Insérez le code de connexion avec Twitter ici
                          },
                          child: Image.network(
                            'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689605308/ikon_gyi840.png', // Chemin de votre image pour Twitter
                            width: 100,
                            height: 70,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
