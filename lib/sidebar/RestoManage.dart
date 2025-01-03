import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../constants/colors.dart';
import '../screens/AddOption/addResto.dart';
import '../widgets/restoEdit.dart';

class ManageRestaurantsPage extends StatefulWidget {
  const ManageRestaurantsPage({Key? key}) : super(key: key);

  @override
  _ManageRestaurantsPageState createState() => _ManageRestaurantsPageState();
}

class _ManageRestaurantsPageState extends State<ManageRestaurantsPage> {
  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "Magic House",
      "region": "Constantine",
      "description": "A cozy place for family dining.",
      "category": "Grills",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWaqcqJokedi4iM52owNqCyO6PL47X_CIOQ&s",
      "rating": 4.5,
      "price": 3
    },
    {
      "name": "Pizza Hut",
      "region": "Setif",
      "description": "Serving the best pizzas in town!",
      "category": "Fast Food",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWaqcqJokedi4iM52owNqCyO6PL47X_CIOQ&s",
      "rating": 4.0,
      "price": 2
    },
    {
      "name": "Grill Master",
      "region": "Algiers",
      "description": "Best place for grilled delicacies.",
      "category": "Grills",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWaqcqJokedi4iM52owNqCyO6PL47X_CIOQ&s",
      "rating": 2.5,
      "price": 1
    },
    {
      "name": "7anout ta3 minhee",
      "region": "Algiers",
      "description": "Best place for grilled delicacies.",
      "category": "Grills",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWaqcqJokedi4iM52owNqCyO6PL47X_CIOQ&s",
      "rating": 5.0,
      "price": 3
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = restaurants
        .where((restaurant) =>
        restaurant["name"].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: redpink1),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 300,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.search, color: redpink1),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchQuery = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Search Restaurants...",
                                  hintStyle: GoogleFonts.poppins(
                                    color: redpink1,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return ListView.builder(
                        itemCount: filteredRestaurants.length,
                        itemBuilder: (context, index) {
                          final restaurant = filteredRestaurants[index];
                          return buildListViewCard(restaurant);
                        },
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: filteredRestaurants.length,
                        itemBuilder: (context, index) {
                          final restaurant = filteredRestaurants[index];
                          return buildRestaurantCard(restaurant);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redpink1,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddRestaurantPage(),
                    ),
                  );
                },
                child: Text(
                  'Add Restaurant',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: lightpink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRestaurantCard(Map<String, dynamic> restaurant) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      shadowColor: lightpink,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(restaurant["image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              restaurant["name"],
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              restaurant["region"],
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            ),
            Text(
              restaurant["category"],
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    restaurant["price"],
                        (index) => const Icon(
                      Icons.attach_money,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
                RatingBarIndicator(
                  rating: restaurant["rating"],
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 1),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditRestaurantPage(restaurant: restaurant),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        restaurants.remove(restaurant);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListViewCard(Map<String, dynamic> restaurant) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      shadowColor: lightpink,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(
                  image: NetworkImage(restaurant["image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                restaurant["name"],
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Region: ${restaurant["region"]}',
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    ' ${restaurant["category"]}',
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    restaurant["description"],
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 5),
                  RatingBarIndicator(
                    rating: restaurant["rating"],
                    itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                    itemSize: 20,
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditRestaurantPage(restaurant: restaurant),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: redpink),
                    onPressed: () => setState(
                            () => restaurants.remove(restaurant)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
