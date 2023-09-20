import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MentorPage extends StatefulWidget {
  const MentorPage({super.key});

  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  bool showMentorForm = false;
  bool showSearchBar = false;
  String domain = ""; // Domaine saisi par le demandeur
  List<Mentor> mentors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(domain.isEmpty ? "MENTORAT" : "Mentors - $domain"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(20, 60),
                  backgroundColor: const Color.fromARGB(255, 0, 60, 109)),
              onPressed: () {
                setState(() {
                  showMentorForm = !showMentorForm;
                });
              },
              child: Text(
                showMentorForm ? "Fermer le formulaire" : "Devenir Mentor",
                style: TextStyle(color: Colors.white),
              ),
            ),
            if (showMentorForm)
              MentorForm(
                onSubmit: (String domain) {
                  setState(() {
                    this.domain = domain;
                    showMentorForm = false;
                    showSearchBar = true;
                  });
                },
              ),
            if (mentors.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: mentors.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(mentors[index].image),
                      ),
                      title: Text(
                          "${mentors[index].firstName} ${mentors[index].lastName}"),
                      subtitle: Text("${mentors[index].email}"),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Domaine: ${mentors[index].domain}"),
                          Text("Disponibilité: ${mentors[index].availability}"),
                          Text(
                              "Année d'expérience: ${mentors[index].experience}"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(20, 60),
                  backgroundColor: const Color.fromARGB(255, 0, 60, 109)),
              onPressed: () {
                setState(() {
                  showSearchBar = !showSearchBar;
                });
              },
              child: Text(
                  showSearchBar ? "Fermer la recherche" : "Avoir un Mentor",
                  style: const TextStyle(color: Colors.white)),
            ),
            if (showSearchBar)
              MentorSearchBar(
                onSearch: (String domain) {
                  _searchMentors(domain);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _searchMentors(String domain) async {
    final url = Uri.parse("https://votre-api.com/mentors?domain=$domain");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> mentorData = jsonDecode(response.body);
      List<Mentor> fetchedMentors =
          mentorData.map((data) => Mentor.fromJson(data)).toList();

      setState(() {
        this.domain = domain;
        mentors = fetchedMentors;
      });
    } else {
      // Gestion des erreurs
      print("Erreur lors de la récupération des mentors.");
    }
  }
}

class MentorForm extends StatelessWidget {
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final Function(String) onSubmit;

  MentorForm({super.key, required this.onSubmit});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: "Domaine"),
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Disponibilité"),
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Année d'expérience"),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              String domain = _domainController.text;
              String availability = _availabilityController.text;
              String experience = _experienceController.text;
              onSubmit("$domain, $availability, $experience");
            },
            child: const Text("Rechercher des mentors"),
          ),
        ],
      ),
    );
  }
}

class MentorSearchBar extends StatelessWidget {
  final TextEditingController _domainController = TextEditingController();
  final Function(String) onSearch;
  MentorSearchBar({super.key, required this.onSearch});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _domainController,
            decoration:
                const InputDecoration(labelText: "Saisir votre domaine"),
          ),
          ElevatedButton(
            onPressed: () {
              String domain = _domainController.text;
              onSearch(domain);
            },
            child: const Text("Rechercher"),
          ),
        ],
      ),
    );
  }
}

class Mentor {
  final String image;
  final String firstName;
  final String lastName;
  final String email;
  final String domain;
  final String availability;
  final String experience;

  Mentor({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.domain,
    required this.availability,
    required this.experience,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      image: json['image'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      domain: json['domain'],
      availability: json['availability'],
      experience: json['experience'],
    );
  }
}
