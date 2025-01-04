import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/colors.dart';

class ManageRegionsPage extends StatefulWidget {
  const ManageRegionsPage({Key? key}) : super(key: key);

  @override
  _ManageRegionsPageState createState() => _ManageRegionsPageState();
}

class _ManageRegionsPageState extends State<ManageRegionsPage> {
  final List<String> regions = ["Constantine", "Setif", "Batna", "Algiers"];
  String searchQuery = "";

  void addRegion(String name) {
    setState(() {
      regions.add(name);
    });
  }

  void deleteRegion(int index) {
    setState(() {
      regions.removeAt(index);
    });
  }

  void filterRegions(String query) {
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
                      delegate: RegionSearchDelegate(
                        regions: regions,
                        onSearch: filterRegions,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: regions
                  .where((region) => region.toLowerCase().contains(searchQuery.toLowerCase()))
                  .toList()
                  .length,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              itemBuilder: (context, index) {
                final filteredRegions = regions
                    .where((region) => region.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList();
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      const Icon(LineAwesomeIcons.map_marker, color: darkblue),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          filteredRegions[index],
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(LineAwesomeIcons.alternate_trash, color: redpink1),
                        onPressed: () => deleteRegion(index),
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

class RegionSearchDelegate extends SearchDelegate {
  final List<String> regions;
  final Function(String) onSearch;

  RegionSearchDelegate({required this.regions, required this.onSearch});

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
    final filteredRegions = regions
        .where((region) => region.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredRegions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredRegions[index],
                style: GoogleFonts.poppins(color: darkblue)),
            onTap: () {
              onSearch(filteredRegions[index]);
              close(context, null);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredRegions = regions
        .where((region) => region.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredRegions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredRegions[index],
                style: GoogleFonts.poppins(color: darkblue)),
            onTap: () {
              onSearch(filteredRegions[index]);
              close(context, null);
            },
          );
        },
      ),
    );
  }
}
