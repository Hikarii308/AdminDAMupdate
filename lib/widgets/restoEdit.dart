import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class EditRestaurantPage extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const EditRestaurantPage({required this.restaurant});

  @override
  _EditRestaurantPageState createState() => _EditRestaurantPageState();
}

class _EditRestaurantPageState extends State<EditRestaurantPage> {
  late TextEditingController nameController;
  late TextEditingController regionController;
  late TextEditingController descriptionController;
  late TextEditingController categoryController;
  late TextEditingController imageController;
  late TextEditingController ratingController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.restaurant['name'] ?? '');
    regionController = TextEditingController(text: widget.restaurant['region'] ?? '');
    descriptionController = TextEditingController(text: widget.restaurant['description'] ?? '');
    categoryController = TextEditingController(text: widget.restaurant['category'] ?? '');
    imageController = TextEditingController(text: widget.restaurant['image'] ?? '');
    ratingController = TextEditingController(text: widget.restaurant['rating']?.toString() ?? '');
    priceController = TextEditingController(text: widget.restaurant['price']?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: redpink1),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 13),
                Text(
                  "Edit Restaurant",
                  style: GoogleFonts.poppins(color: redpink1, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 13),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: regionController,
              decoration: InputDecoration(
                labelText: 'Region',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: imageController,
              decoration: InputDecoration(
                labelText: 'Image URL',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ratingController,
              decoration: InputDecoration(
                labelText: 'Rating',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redpink1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  // Hnaya ndirou save option ma3ftch <3
                  Navigator.pop(context);
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
