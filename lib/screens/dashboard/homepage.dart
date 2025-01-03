import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../constants/colors.dart';
import '../../sidebar/RegionManage.dart';
import '../../sidebar/RestoManage.dart';
import '../../sidebar/ReviewManage.dart';
import '../../sidebar/users.dart';
import '../login/loginScreen.dart';

const String plats = "images/login/plats.png";

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  bool isSearchEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: isSearchEnabled
              ? Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          )
              : null,
          actions: [
            IconButton(
              icon: Icon(isSearchEnabled ? Icons.close : Icons.search, color: Colors.pink.shade800),
              onPressed: () {
                setState(() {
                  isSearchEnabled = !isSearchEnabled;
                });
              },
            ),
            //idk think we need notifications
            /*
            IconButton(
              icon: Icon(LineAwesomeIcons.bell, color: Colors.pink.shade800),
              onPressed: () {},
            ),*/
            IconButton(
              icon: Icon(LineAwesomeIcons.user_secret, color: Colors.pink.shade800),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: lightpink,
                ),
                child: Center(
                  child: Text(
                    'Admin Menu',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade800,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.map, color: lightblue),
                title: Text('Regions', style: GoogleFonts.poppins()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ManageRegionsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.utensils, color: Colors.pink.shade800),
                title: Text('Restaurants', style: GoogleFonts.poppins()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ManageRestaurantsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.star, color: graypurple),
                title: Text('Reviews', style: GoogleFonts.poppins()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ManageReviewsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.user_friends, color: peach),
                title: Text('Users', style: GoogleFonts.poppins()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ManageUsersPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: lightpink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/media/FqGqu9naYAA6Knt?format=jpg&name=4096x4096'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kang Minhee',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'kangMinhee@gmail.com',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Quick Access',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkpink,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShortcutCard('Regions', LineAwesomeIcons.map, lightgreen, lightblue, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ManageRegionsPage()),
                    );
                  }),
                  _buildShortcutCard('Restaurants', LineAwesomeIcons.utensils, peach, lightpink, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ManageRestaurantsPage()),
                    );
                  }),
                  _buildShortcutCard('Reviews', LineAwesomeIcons.star, lavender, graypurple, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ManageReviewsPage()),
                    );
                  }),
                  _buildDoughnutChart(),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: lightpink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMetricCard('Total Restaurants', '120', LineAwesomeIcons.utensils, redpink),
                    _buildMetricCard('Active Regions', '15', LineAwesomeIcons.map, redpink),
                    _buildMetricCard('Total Users', '320', LineAwesomeIcons.user_friends, redpink),
                    _buildMetricCard('Total Reviews', '500', LineAwesomeIcons.star, redpink),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Insights',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkpink,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Restaurant Insights'),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries>[
                    ColumnSeries<ChartData, String>(
                      dataSource: [
                        ChartData('Regions', 150),
                        ChartData('Restaurants', 120),
                        ChartData('Reviews', 500),
                        ChartData('User', 320),
                      ],
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Stats',
                      color: lightblue,
                      borderRadius: BorderRadius.circular(20),
                    )
                  ],
                ),
              ),
              //Hna THE RECENT ACTIVITY
              /*
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Restaurants',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: graypurple1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: lavender,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(LineAwesomeIcons.utensils, color: lavender1),
                                title: Text('Restaurant ${index + 1}', style: GoogleFonts.poppins()),
                                subtitle: Text(
                                  'Added on: 2024-12-30',
                                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Reviews',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: redpink,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: lightpink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(LineAwesomeIcons.star, color: peach),
                                title: Text('Review ${index + 1}', style: GoogleFonts.poppins()),
                                subtitle: Text(
                                  'Date: 2024-12-30',
                                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color iconColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: iconColor),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: iconColor),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildShortcutCard(String title, IconData icon, Color backgroundColor, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: backgroundColor,
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDoughnutChart() {
    return Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 100,
      child: SfCircularChart(
        legend: Legend(isVisible: false),
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            dataSource: [
              ChartData('Regions', 20),
              ChartData('Restaurants', 40),
              ChartData('Reviews', 30),
              ChartData('Admins', 10),
            ],
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: DataLabelSettings(isVisible: false),
            pointColorMapper: (ChartData data, _) {
              if (data.x == 'Regions') {
                return lightblue;
              } else if (data.x == 'Restaurants') {
                return redpink;
              } else if (data.x == 'Reviews') {
                return peach;
              } else {
                return lavender;
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
