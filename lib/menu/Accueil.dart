import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 202, 202),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: longeur,
          width: largeur,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/mentor');
                          // Action lorsque l'image est cliquée
                        },
                        child: Container(
                          height: longeur * 0.35,
                          width: largeur * 0.4,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689672067/mentor_ltcvty.png'),
                                  fit: BoxFit.cover)),
                          child: const Center(
                              child: Text(
                            'Mentorat',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 164, 25)),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Action lorsque l'image est cliquée
                        },
                        child: Container(
                          height: longeur * 0.35,
                          width: largeur * 0.3,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689672067/cous_mnqhiz.jpg'),
                                  fit: BoxFit.cover)),
                          child: const Center(
                              child: Text(
                            'E-Learning',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 251, 255, 7)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Action lorsque l'image est cliquée
                        },
                        child: Container(
                          height: longeur * 0.35,
                          width: largeur * 0.3,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689672067/ressources_z0mo0k.png'),
                                  fit: BoxFit.cover)),
                          child: const Center(
                              child: Text(
                            'Partage de\n Ressources',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 76, 255)),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Action lorsque l'image est cliquée
                        },
                        child: Container(
                          height: longeur * 0.35,
                          width: largeur * 0.3,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689672067/communaute_q7zv9b.jpg'),
                                  fit: BoxFit.cover)),
                          child: const Center(
                              child: Text(
                            'Communauté',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 0, 238)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // Action lorsque l'image est cliquée
                  },
                  child: Container(
                    height: longeur * 0.2,
                    width: largeur,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689678926/op_nqpazp.jpg'),
                            fit: BoxFit.cover)),
                    child: const Center(
                        child: Text(
                      'Opportunité',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 243, 8, 8)),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
