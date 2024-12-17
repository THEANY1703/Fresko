// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NavCustom extends StatefulWidget {
  const NavCustom({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<NavCustom> createState() => _NavCustomState();
}

class _NavCustomState extends State<NavCustom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -2), // Posizione della ombra
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home, // Sostituisci con l'icona del mockup
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search, // Sostituisci con l'icona del mockup
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Cerca',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on, // Sostituisci con l'icona del mockup
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person, // Sostituisci con l'icona del mockup
              color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: 'Profilo',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
