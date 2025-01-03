import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import 'addMenu.dart';

class AddRestaurantPage extends StatefulWidget {
  const AddRestaurantPage({Key? key}) : super(key: key);

  @override
  _AddRestaurantPageState createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  final phoneController = TextEditingController();
  final List<String> regions = ["Constantine", "Setif", "Algiers", "Oran"];
  String selectedRegion = "Constantine";
  double priceRange = 1.0;
  double openingTime = 9.0;
  double closingTime = 22.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: redpink1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Add Restaurant',
                  style: GoogleFonts.poppins(color: redpink1, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Restaurant Name',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1!, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1!, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedRegion,
              items: regions
                  .map((region) => DropdownMenuItem(
                value: region,
                child: Text(region, style: GoogleFonts.poppins(color: redpink1)),
              ))
                  .toList(),
              onChanged: (value) => setState(() => selectedRegion = value!),
              decoration: InputDecoration(
                labelText: 'Region',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1!, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
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
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1!, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
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
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redpink1!, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMenuPage()),
                );
              },
              child: Text(
                "Add Menu Items",
                style: GoogleFonts.poppins(color: redpink1),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Opening Time: ${openingTime.toInt()}h',
              style: GoogleFonts.poppins(color: redpink1),
            ),
            Slider(
              value: openingTime,
              min: 0,
              max: 24,
              divisions: 24,
              label: '${openingTime.toInt()}h',
              activeColor: redpink1,
              inactiveColor: Colors.grey,
              onChanged: (value) => setState(() => openingTime = value),
            ),
            const SizedBox(height: 16),
            Text(
              'Closing Time: ${closingTime.toInt()}h',
              style: GoogleFonts.poppins(color: redpink1),
            ),
            Slider(
              value: closingTime,
              min: 0,
              max: 24,
              divisions: 24,
              label: '${closingTime.toInt()}h',
              activeColor: redpink1,
              inactiveColor: Colors.grey,
              onChanged: (value) => setState(() => closingTime = value),
            ),
            /*
  // HADA IS JUST THE MENU AS A PDF
  Text(
    'Menu (PDF):',
    style: GoogleFonts.poppins(color: redpink1),
  ),
  const SizedBox(height: 10),
  ElevatedButton.icon(
    onPressed: pickMenuFile,
    icon: Icon(Icons.upload_file, color: redpink1),
    label: Text(
      menuFile != null ? "Menu Uploaded" : "Upload Menu",
      style: GoogleFonts.poppins(color: redpink1),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[100],
    ),
  ),
*/
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redpink1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      imageController.text.isNotEmpty) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add Restaurant',
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
