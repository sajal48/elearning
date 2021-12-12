import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/screens/screens.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  HomepageController hm = new HomepageController();
  final List<Widget> _screens = [
    HomeScreen(),
    // Scaffold(),
    CoursePage(),
    MyCourseScreen(),
    MyProfileScreen(),
  ];
  final List<String> _icons = const [
    'assets/images/home_icon.svg',
    // 'assets/images/notification_icon.svg',
    'assets/images/courses_icon.svg',
    'assets/images/chat_icon.svg',
    'assets/images/profile_icon.svg'
  ];
  final List<String> _label = const [
    'Home',
    // 'Notification',
    'All Courses',
    'My Courses',
    'Profile'
  ];
  int _selectedIndex = 0;

  @override
  initState() {
    super.initState();
    // Add listeners to this class
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: CustomTabBar(
            icons: _icons,
            label: _label,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index)),
      ),
      length: _icons.length,
    );
  }
}
