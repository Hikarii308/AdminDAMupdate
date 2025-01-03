import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final dishNameController = TextEditingController();
  final dishDescriptionController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: redpink1),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add Menu Items",
          style: GoogleFonts.poppins(color: redpink1, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: dishNameController,
              decoration: InputDecoration(
                labelText: 'Dish Name',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dishDescriptionController,
              decoration: InputDecoration(
                labelText: 'Dish Description',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price (DA)',
                labelStyle: GoogleFonts.poppins(color: redpink1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),


            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redpink1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  if (dishNameController.text.isNotEmpty &&
                      dishDescriptionController.text.isNotEmpty &&
                      priceController.text.isNotEmpty) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Save Dish",
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
