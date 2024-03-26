import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Navigation Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 0;

  Widget getBody() {
    switch (selectedTab) {
      case 0:
        return const Center(
          child: Icon(Icons.home),
        );
      case 1:
        return const Center(
          child: Icon(Icons.search),
        );
      default:
        return const Center(
          child: Icon(Icons.settings),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)),
      body: getBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (value) {
          setState(() {
            selectedTab = value;
          });
        },
        labelBehavior:
            NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Dashboard",
            selectedIcon: Icon(Icons.home_filled),
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
            selectedIcon: Icon(
              Icons.settings_applications,
            ),
          ),
        ],
      ),
    );
  }
}
