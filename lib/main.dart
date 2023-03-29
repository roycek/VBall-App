import 'package:flutter/material.dart'; //testing git push

import 'src/team_list_screen.dart';
import 'src/team.dart';

void main() => runApp(VBallApp());

class VBallApp extends StatelessWidget {
  VBallApp({super.key});

  final List<Team> teamList = [
    // creating 3 default teams
    Team("Snap"),
    Team("Crackle"),
    Team("Pop"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TeamListPage(teamList), // launching team list page
      debugShowCheckedModeBanner: false,
    );
  }
}
