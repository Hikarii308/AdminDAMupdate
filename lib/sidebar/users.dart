import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../constants/colors.dart';
import '../profile/profile.dart';
import '../profile/personaldetails.dart';

class ManageUsersPage extends StatefulWidget {
  const ManageUsersPage({Key? key}) : super(key: key);

  @override
  _ManageUsersPageState createState() => _ManageUsersPageState();
}

class _ManageUsersPageState extends State<ManageUsersPage> {
  final List<Map<String, String>> users = [
    {'name': 'Norhane Benf', 'email': 'norhanebenf@gmail.com', 'phone': '+1234567890', 'image': 'https://pbs.twimg.com/media/FqGqu9naYAA6Knt?format=jpg&name=4096x4096'},
    {'name': 'Kang Minhee', 'email': 'kangMinhee@gmail.com', 'phone': '+0987654321', 'image': 'https://pbs.twimg.com/media/FqGqu9naYAA6Knt?format=jpg&name=4096x4096'},
  ];

  String searchQuery = "";

  void deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void filterUsers(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lavenderlight,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: graypurple1),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: graypurple1,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(LineAwesomeIcons.search, color: graypurple1),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: UserSearchDelegate(
                        users: users,
                        onSearch: filterUsers,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users
                  .where((user) => user["name"]!.toLowerCase().contains(searchQuery.toLowerCase()))
                  .toList()
                  .length,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              itemBuilder: (context, index) {
                final filteredUsers = users
                    .where((user) => user["name"]!.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList();
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilePage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(filteredUsers[index]['image']!),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredUsers[index]['name']!,
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              filteredUsers[index]['email']!,
                              style: GoogleFonts.poppins(color: Colors.grey[700]),
                            ),
                            Text(
                              filteredUsers[index]['phone']!,
                              style: GoogleFonts.poppins(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(LineAwesomeIcons.alternate_trash, color: redpink1),
                            onPressed: () => deleteUser(index),
                          ),
                          IconButton(
                            icon: const Icon(LineAwesomeIcons.user, color: graypurple1),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const PersonalDetails()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> users;
  final Function(String) onSearch;

  UserSearchDelegate({required this.users, required this.onSearch});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: darkblue),
        onPressed: () {
          query = '';
          onSearch(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: darkblue),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredUsers = users
        .where((user) => user["name"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredUsers[index]["name"]!,
                style: GoogleFonts.poppins(color: darkblue)),
            onTap: () {
              onSearch(filteredUsers[index]["name"]!);
              close(context, null);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredUsers = users
        .where((user) => user["name"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredUsers[index]["name"]!,
                style: GoogleFonts.poppins(color: darkblue)),
            onTap: () {
              onSearch(filteredUsers[index]["name"]!);
              close(context, null);
            },
          );
        },
      ),
    );
  }
}
