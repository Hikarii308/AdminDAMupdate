import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/colors.dart';

class ManageReviewsPage extends StatefulWidget {
  const ManageReviewsPage({Key? key}) : super(key: key);

  @override
  _ManageReviewsPageState createState() => _ManageReviewsPageState();
}

class _ManageReviewsPageState extends State<ManageReviewsPage> {
  final List<Map<String, dynamic>> reviews = [
    {
      "reviewer": "Norhane",
      "rating": 5,
      "review": "Great food and ambiance!",
      "restaurant": "Magic House",
    },
    {
      "reviewer": "Norhane Tani",
      "rating": 3.5,
      "review": "Decent experience, but service was slow.",
      "restaurant": "Pizza Hut",
    },
    {
      "reviewer": "Minhee",
      "rating": 1.0,
      "review": "Awful food! Highly unrecommend.",
      "restaurant": "Magic House",
    },
  ];

  double selectedRating = 0.0;
  List<Map<String, dynamic>> filteredReviews = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredReviews = List.from(reviews);
  }

  void filterReviews() {
    setState(() {
      filteredReviews = reviews
          .where((review) =>
      review["rating"] >= selectedRating &&
          (review["reviewer"].toLowerCase().contains(searchQuery.toLowerCase()) ||
              review["restaurant"].toLowerCase().contains(searchQuery.toLowerCase())))
          .toList();
    });
  }

  void deleteReview(int index) {
    setState(() {
      reviews.removeAt(index);
      filterReviews();
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
                  icon: const Icon(Icons.arrow_back, color: darkblue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "Manage Reviews",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: darkblue,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(LineAwesomeIcons.search, color: darkblue1),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ReviewSearchDelegate(
                        reviews: reviews,
                        onSearch: (query) {
                          setState(() {
                            searchQuery = query;
                            filterReviews();
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  "Filter by Rating",
                  style: GoogleFonts.poppins(fontSize: 14, color: darkblue),
                ),
                Slider(
                  value: selectedRating,
                  min: 0.0,
                  max: 5.0,
                  divisions: 10,
                  label: selectedRating.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      selectedRating = value;
                      filterReviews();
                    });
                  },
                  activeColor: darkblue,
                  inactiveColor: lavender,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredReviews.length,
              itemBuilder: (context, index) {
                final review = filteredReviews[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      "${review["reviewer"]} - ${review["restaurant"]}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: darkblue1),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review["review"],
                          style: GoogleFonts.poppins(color: darkblue),
                        ),
                        const SizedBox(height: 5),
                        RatingBarIndicator(
                          rating: review["rating"],
                          itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                          itemSize: 20.0,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(LineAwesomeIcons.alternate_trash, color: redpink1),
                      onPressed: () => deleteReview(reviews.indexOf(review)),
                    ),
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

class ReviewSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> reviews;
  final Function(String) onSearch;

  ReviewSearchDelegate({required this.reviews, required this.onSearch});

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
    final filteredReviews = reviews
        .where((review) =>
    review["reviewer"].toLowerCase().contains(query.toLowerCase()) ||
        review["restaurant"].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredReviews.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                "${filteredReviews[index]["reviewer"]} - ${filteredReviews[index]["restaurant"]}",
                style: GoogleFonts.poppins(color: darkblue)),
            onTap: () {
              onSearch(query);
              close(context, null);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredReviews = reviews
        .where((review) =>
    review["reviewer"].toLowerCase().contains(query.toLowerCase()) ||
        review["restaurant"].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredReviews.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                "${filteredReviews[index]["reviewer"]} - ${filteredReviews[index]["restaurant"]}",
                style: GoogleFonts.poppins(color: darkblue)),
            onTap: () {
              onSearch(query);
              close(context, null);
            },
          );
        },
      ),
    );
  }
}
