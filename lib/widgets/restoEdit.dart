import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditRestaurantPage extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const EditRestaurantPage({required this.restaurant});

  @override
  _EditRestaurantPageState createState() => _EditRestaurantPageState();
}

class _EditRestaurantPageState extends State<EditRestaurantPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController openingTimeController = TextEditingController();
  final TextEditingController closingTimeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceRangeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.restaurant['name'];
    phoneController.text = widget.restaurant['Phone'];
    descriptionController.text = widget.restaurant['Description'];
    imageUrlController.text = widget.restaurant['ImageURL'];
    regionController.text = widget.restaurant['RegionName'];
    categoryController.text = widget.restaurant['CategoryName'];
    openingTimeController.text = widget.restaurant['OpeningTime'];
    closingTimeController.text = widget.restaurant['ClosingTime'];
    locationController.text = widget.restaurant['Location'];
    priceRangeController.text = widget.restaurant['PriceRange'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Restaurant', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lime[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: regionController,
              decoration: InputDecoration(labelText: 'Region'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: openingTimeController,
              decoration: InputDecoration(labelText: 'Opening Time'),
            ),
            TextField(
              controller: closingTimeController,
              decoration: InputDecoration(labelText: 'Closing Time'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: priceRangeController,
              decoration: InputDecoration(labelText: 'Price Range'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hna normalement save
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lime[800],
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Save',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
