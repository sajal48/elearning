import 'package:elearning/screens/screens.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    CoursePage(),
    Scaffold(),
    Scaffold(),
  ];
  final List<String> _icons = const [
    'assets/images/home_icon.svg',
    'assets/images/notification_icon.svg',
    'assets/images/courses_icon.svg',
    'assets/images/chat_icon.svg',
    'assets/images/profile_icon.svg'
  ];
  final List<String> _label = const [
    'Home',
    'Notification',
    'Courses',
    'Chat',
    'Profile'
  ];
  int _selectedIndex = 0;
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
