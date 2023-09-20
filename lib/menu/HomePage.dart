import 'package:empowertogether/menu/Accueil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 214, 214, 214)),
            child: IconButton(
              icon: const Icon(Icons
                  .notifications), // Icône de notification (vous pouvez choisir l'icône souhaitée)
              onPressed: () {
                // Action à exécuter lors du clic sur l'icône de notification
              },
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: const AccueilPage(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 157, 150, 150),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 63, 114),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/dgpmogg2w/image/upload/v1689605308/insta_nyzdoe.png'), // Chemin de l'image de l'utilisateur
                ),
                SizedBox(height: 8),
                Text(
                  'Nom de l\'utilisateur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              // Action lorsque Accueil est sélectionné
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: Text('Cours en ligne'),
            onTap: () {
              // Action lorsque Cours en ligne est sélectionné
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervisor_account_outlined),
            title: const Text('Mentorat'),
            onTap: () {
              Navigator.pushNamed(context, '/mentor');
              // Action lorsque Mentorat est sélectionné
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Partage de ressources'),
            onTap: () {
              // Action lorsque Partage de ressources est sélectionné
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Opportunités'),
            onTap: () {
              // Action lorsque Opportunités est sélectionné
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Communauté'),
            onTap: () {
              // Action lorsque Communauté est sélectionné
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              // Action lorsque Profil est sélectionné
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Déconnexion'),
            onTap: () {
              // Action lorsque Déconnexion est sélectionné
            },
          ),
        ],
      ),
    );
  }
}
