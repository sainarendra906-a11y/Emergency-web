import 'package:flutter/material.dart';

void main() {
  runApp(const EmergencyCompanionApp());
}

class EmergencyCompanionApp extends StatelessWidget {
  const EmergencyCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergency Companion',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          primary: Colors.red,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      ),
      home: const SplashScreen(),
    );
  }
}

// ---------------- SPLASH SCREEN ----------------

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(.25),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.medical_services,
                color: Colors.white,
                size: 70,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Emergency',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Companion',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Be Prepared. Stay Safe.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 45),
            const CircularProgressIndicator(
              color: Colors.red,
            ),
            const SizedBox(height: 12),
            const Text('Loading...'),
          ],
        ),
      ),
    );
  }
}

// ---------------- HOME SCREEN ----------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeContent(),
    GuidesScreen(),
    SosScreen(),
    NearbyScreen(),
    AboutScreen(),
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Guides',
          ),
          NavigationDestination(
            icon: Icon(Icons.sos_outlined),
            selectedIcon: Icon(Icons.sos),
            label: 'SOS',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            selectedIcon: Icon(Icons.location_on),
            label: 'Nearby',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ---------------- HOME CONTENT ----------------

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.menu),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    'Emergency Companion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stay Prepared,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Stay Safe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your safety is our priority.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Choose a Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                CategoryCard(
                  icon: Icons.favorite,
                  title: 'Medical\nEmergency',
                  color: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MedicalEmergencyScreen(),
                      ),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.local_fire_department,
                  title: 'Fire\nEmergency',
                  color: Colors.orange,
                  onTap: () {},
                ),
                CategoryCard(
                  icon: Icons.directions_car,
                  title: 'Road\nAccident',
                  color: Colors.blue,
                  onTap: () {},
                ),
                CategoryCard(
                  icon: Icons.cloud,
                  title: 'Natural\nDisaster',
                  color: Colors.indigo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DisasterGuideScreen(),
                      ),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.shield,
                  title: 'Women\nSafety',
                  color: Colors.purple,
                  onTap: () {},
                ),
                CategoryCard(
                  icon: Icons.phone,
                  title: 'Emergency\nContacts',
                  color: Colors.green,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FirstAidKitScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.medical_services,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Aid Kit Guide',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Learn what your emergency kit should contain',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- CATEGORY CARD ----------------

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 7),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- GUIDES ----------------

class GuidesScreen extends StatelessWidget {
  const GuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Emergency Guides',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                GuideTile(
                  icon: Icons.favorite,
                  title: 'Medical Emergency',
                  subtitle: 'Heart attack, stroke, choking and more',
                  color: Colors.red,
                  page: const MedicalEmergencyScreen(),
                ),
                GuideTile(
                  icon: Icons.medical_services,
                  title: 'First Aid Kit',
                  subtitle: 'Essential emergency supplies',
                  color: Colors.blue,
                  page: const FirstAidKitScreen(),
                ),
                GuideTile(
                  icon: Icons.cloud,
                  title: 'Disaster Guide',
                  subtitle: 'Earthquake, flood, cyclone and more',
                  color: Colors.indigo,
                  page: const DisasterGuideScreen(),
                ),
                GuideTile(
                  icon: Icons.checklist,
                  title: 'Emergency Checklist',
                  subtitle: 'Things to prepare before an emergency',
                  color: Colors.green,
                  page: const ChecklistScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GuideTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Widget page;

  const GuideTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.12),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

// ---------------- MEDICAL EMERGENCY ----------------

class MedicalEmergencyScreen extends StatelessWidget {
  const MedicalEmergencyScreen({super.key});

  final List<Map<String, dynamic>> emergencies = const [
    {
      'title': 'Heart Attack',
      'subtitle': 'Symptoms and what to do',
      'icon': Icons.favorite,
      'color': Colors.red,
    },
    {
      'title': 'Stroke',
      'subtitle': 'Signs and action steps',
      'icon': Icons.psychology,
      'color': Colors.pink,
    },
    {
      'title': 'Choking',
      'subtitle': 'How to help a choking person',
      'icon': Icons.air,
      'color': Colors.blue,
    },
    {
      'title': 'Burns',
      'subtitle': 'First aid for burns',
      'icon': Icons.local_fire_department,
      'color': Colors.orange,
    },
    {
      'title': 'Snake Bite',
      'subtitle': 'What to do in case of snake bite',
      'icon': Icons.pest_control,
      'color': Colors.green,
    },
    {
      'title': 'Fainting',
      'subtitle': 'Causes and recovery steps',
      'icon': Icons.person,
      'color': Colors.deepOrange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Emergency'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: emergencies.length,
        itemBuilder: (context, index) {
          final item = emergencies[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    (item['color'] as Color).withOpacity(.12),
                child: Icon(
                  item['icon'] as IconData,
                  color: item['color'] as Color,
                ),
              ),
              title: Text(
                item['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['subtitle']),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EmergencyDetailScreen(
                      title: item['title'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------------- EMERGENCY DETAIL ----------------

class EmergencyDetailScreen extends StatelessWidget {
  final String title;

  const EmergencyDetailScreen({
    super.key,
    required this.title,
  });

  String getDescription() {
    switch (title) {
      case 'Heart Attack':
        return 'Possible warning signs include chest discomfort, shortness of breath, sweating, nausea and pain spreading to the arm, back or jaw. Call emergency services immediately.';
      case 'Stroke':
        return 'Remember FAST: Face drooping, Arm weakness, Speech difficulty and Time to call emergency services. Act quickly.';
      case 'Choking':
        return 'If the person cannot breathe, cough or speak, seek emergency help and provide appropriate first aid if trained.';
      case 'Burns':
        return 'Cool a minor burn under cool running water for about 20 minutes. Do not apply ice directly to the burn.';
      case 'Snake Bite':
        return 'Keep the person calm and still and seek emergency medical care immediately. Do not cut or suck the bite.';
      default:
        return 'Keep the person safe, assess the situation and contact emergency services when necessary.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.medical_services,
              size: 70,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              getDescription(),
              style: const TextStyle(
                fontSize: 17,
                height: 1.5,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone),
                label: const Text('Call Emergency Services'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- FIRST AID KIT ----------------

class FirstAidKitScreen extends StatelessWidget {
  const FirstAidKitScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'name': 'Bandages',
      'description': 'Use to cover wounds',
      'icon': Icons.healing,
    },
    {
      'name': 'Antiseptics',
      'description': 'Use to clean wounds',
      'icon': Icons.local_pharmacy,
    },
    {
      'name': 'Pain Relievers',
      'description': 'For pain and fever',
      'icon': Icons.medication,
    },
    {
      'name': 'Scissors',
      'description': 'For cutting tape or clothes',
      'icon': Icons.content_cut,
    },
    {
      'name': 'Thermometer',
      'description': 'For checking body temperature',
      'icon': Icons.thermostat,
    },
    {
      'name': 'Other Essentials',
      'description': 'Gloves, safety pins, etc.',
      'icon': Icons.medical_services,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Aid Kit Guide')),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            child: ListTile(
              leading: Icon(
                item['icon'] as IconData,
                color: Colors.red,
              ),
              title: Text(
                item['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['description']),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- SOS ----------------

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'SOS',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Tap the button in an emergency',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 35),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Emergency SOS'),
                  content: const Text(
                    'SOS activated. Please contact emergency services immediately.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(.3),
                    blurRadius: 25,
                    spreadRadius: 12,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'SOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SosAction(
                icon: Icons.phone,
                title: 'Call\nEmergency',
                onTap: () {},
              ),
              SosAction(
                icon: Icons.location_on,
                title: 'Share\nLocation',
                onTap: () {},
              ),
              SosAction(
                icon: Icons.notifications_active,
                title: 'Alert\nContacts',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SosAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SosAction({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.red),
            const SizedBox(height: 7),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- NEARBY ----------------

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({super.key});

  final List<Map<String, String>> places = const [
    {
      'name': 'City Care Hospital',
      'distance': '1.2 km away',
    },
    {
      'name': 'Sunrise Hospital',
      'distance': '2.4 km away',
    },
    {
      'name': 'HealthPlus Clinic',
      'distance': '3.1 km away',
    },
    {
      'name': 'Life Line Hospital',
      'distance': '4.7 km away',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Nearby Help',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];

                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.local_hospital),
                    ),
                    title: Text(
                      place['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${place['distance']} • 24/7 Available',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {},
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

// ---------------- DISASTER GUIDE ----------------

class DisasterGuideScreen extends StatelessWidget {
  const DisasterGuideScreen({super.key});

  final List<Map<String, dynamic>> disasters = const [
    {
      'name': 'Earthquake',
      'subtitle': 'What to do before, during and after earthquake',
      'icon': Icons.warning,
    },
    {
      'name': 'Flood',
      'subtitle': 'Stay safe during floods',
      'icon': Icons.water,
    },
    {
      'name': 'Cyclone',
      'subtitle': 'How to stay safe during cyclones',
      'icon': Icons.cyclone,
    },
    {
      'name': 'Lightning',
      'subtitle': 'Safety tips during lightning',
      'icon': Icons.flash_on,
    },
    {
      'name': 'Landslide',
      'subtitle': 'Precautions and actions',
      'icon': Icons.landscape,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Disaster Guide')),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: disasters.length,
        itemBuilder: (context, index) {
          final disaster = disasters[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(disaster['icon'] as IconData),
              ),
              title: Text(
                disaster['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(disaster['subtitle']),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}

// ---------------- CHECKLIST ----------------

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final List<String> items = [
    'Water Bottles',
    'Non-perishable Food',
    'Flashlight',
    'Power Bank',
    'First Aid Kit',
    'Important Documents',
    'Medicines',
    'Extra Clothes',
  ];

  final List<bool> checked = List.filled(8, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Checklist')),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: CheckboxListTile(
              value: checked[index],
              onChanged: (value) {
                setState(() {
                  checked[index] = value ?? false;
                });
              },
              title: Text(items[index]),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        },
      ),
    );
  }
}

// ---------------- ABOUT ----------------

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.medical_services,
                color: Colors.white,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Emergency Companion',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 25),
            const Text(
              'Your personal safety companion for emergencies. '
              'Be prepared for emergencies and stay safe in critical situations.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            const InfoRow(
              icon: Icons.check_circle_outline,
              text: 'Easy to use',
            ),
            const InfoRow(
              icon: Icons.wifi_off,
              text: 'Offline Access',
            ),
            const InfoRow(
              icon: Icons.star_border,
              text: 'Trusted Information',
            ),
            const InfoRow(
              icon: Icons.favorite_border,
              text: 'Life Saving Guidance',
            ),
            const Spacer(),
            const Text(
              'Made with ❤️ for your safety',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}