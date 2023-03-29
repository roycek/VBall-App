import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

import 'team.dart';
import 'edit_page.dart';

class TeamStatsPage extends StatefulWidget {
  final Team team;
  const TeamStatsPage(this.team, {super.key});

  @override
  TeamStatsPageState createState() => TeamStatsPageState(team);
}

class TeamStatsPageState extends State<TeamStatsPage> {
  final Team team;
  String page = "team_stats"; // default page is team stats
  TeamStatsPageState(this.team);

  // navigating back to team list screen
  void _navigateBackPage(BuildContext context) => Navigator.pop(context, team.name);

  // changes page to team stats
  void _navigateTeamStatsPage(BuildContext context) {
    page = "team_stats";
    setState(() {});
  }

  // changes page to player list
  void _navigatePlayerListPage(BuildContext context) {
    page = "player_list";
    setState(() {});
  }

  // opens edit team page and awaits the edited name
  void _navigateEditTeamPage(BuildContext context) async {
    final name = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditPage("Team"))
    );

    // updates team name and screen
    setState(() {
      if (name != null) team.name = name;
    });
  }

  // opens create player page and awaits the new player name
  void _navigateCreatePlayerPage(BuildContext context) async {
    final playerName = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditPage('Player'))
    );

    // creates new player
    setState(() {
      if (playerName != null) team.players.add(Player(playerName));
    });
  }

  // opens edit player page and awaits the edited name
  void _navigateEditPlayerPage(BuildContext context, int player) async {
    final playerName = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditPage('Player'))
    );

    // updates player name
    setState(() {
      if (playerName != null) team.players[player].name = playerName;
    });
  }

  // deletes player and updates screen
  void _deletePlayer(int player) {
    team.players.removeAt(player);
    setState(() {});
  }

  // builds the team stats page widget
  Widget _buildTeamStatsPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            team.name
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
        leading: IconButton(
            onPressed: () => _navigateBackPage(context),
            icon: const Icon(Icons.arrow_back_rounded),
            padding: const EdgeInsets.all(10)
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => _navigateEditTeamPage(context),
              icon: const Icon(Icons.edit),
              padding: const EdgeInsets.all(10)
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () => _navigateTeamStatsPage(context),
                  child: Container(
                    height: 45,
                    width: (MediaQuery.of(context).size.width) / 2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(47, 107, 161, 1),
                    ),
                    child: const Center(
                      child: Text(
                        "Team Stats",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _navigatePlayerListPage(context),
                  child: Container(
                    height: 45,
                    width: (MediaQuery.of(context).size.width) / 2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(68, 133, 193, 1),
                    ),
                    child: const Center(
                      child: Text(
                        "Players",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 175,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(201, 242, 255, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 25,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Wins",
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      const SizedBox(
                          height: 5
                      ),
                      Text(
                        team.wins.toString(),
                        style: const TextStyle(
                            fontSize: 50
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 150,
                  width: 175,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(201, 242, 255, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 25,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Losses",
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      const SizedBox(
                          height: 5
                      ),
                      Text(
                        team.losses.toString(),
                        style: const TextStyle(
                            fontSize: 50
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 115,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(201, 242, 255, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 25,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Serve",
                        style: TextStyle(
                            fontSize: 25
                        ),
                      ),
                      const SizedBox(
                          height: 5
                      ),
                      Text(
                        "${(team.serve * 100).toInt()}%",
                        style: const TextStyle(
                            fontSize: 35
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 150,
                  width: 115,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(201, 242, 255, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 25,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Recieve",
                        style: TextStyle(
                            fontSize: 25
                        ),
                      ),
                      const SizedBox(
                          height: 5
                      ),
                      Text(
                        "${(team.recieve * 100).toInt()}%",
                        style: const TextStyle(
                            fontSize: 35
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 150,
                  width: 115,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(201, 242, 255, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 25,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Attack",
                        style: TextStyle(
                            fontSize: 25
                        ),
                      ),
                      const SizedBox(
                          height: 5
                      ),
                      Text(
                        "${(team.attack * 100).toInt()}%",
                        style: const TextStyle(
                            fontSize: 35
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () => {},
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(29, 53, 87, 1),
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 25,
                          cornerSmoothing: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                            Icons.sports_volleyball,
                            color: Color.fromRGBO(201, 242, 255, 1)
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Game Time",
                          style: TextStyle(
                            color: Color.fromRGBO(201, 242, 255, 1),
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  // builds the player list page widget
  Widget _buildPlayerListPage(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text(
            team.name
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
        leading: IconButton(
            onPressed: () => _navigateBackPage(context),
            icon: const Icon(Icons.arrow_back_rounded),
            padding: const EdgeInsets.all(10)
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => _navigateEditTeamPage(context),
              icon: const Icon(Icons.edit),
              padding: const EdgeInsets.all(10)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () => _navigateTeamStatsPage(context),
                    child: Container(
                      height: 45,
                      width: (MediaQuery.of(context).size.width) / 2,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(68, 133, 193, 1),
                      ),
                      child: const Center(
                        child: Text(
                          "Team Stats",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _navigatePlayerListPage(context),
                    child: Container(
                      height: 45,
                      width: (MediaQuery.of(context).size.width) / 2,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(47, 107, 161, 1),
                      ),
                      child: const Center(
                        child: Text(
                          "Players",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < team.players.length; i++)...[
                const SizedBox(
                    height: 10
                ),
                Container(
                  height: 75,
                  width: 480,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(201, 242, 255, 1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 37.5,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(68, 133, 193, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            team.players[i].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              onPressed: () => _navigateEditPlayerPage(
                                  context, i
                              ),
                              icon: const Icon(Icons.edit),
                              padding: const EdgeInsets.all(10)
                          ),
                          IconButton(
                              onPressed: () => _deletePlayer(i),
                              icon: const Icon(Icons.delete_outline),
                              padding: const EdgeInsets.all(10)
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(
                  height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => _navigateCreatePlayerPage(context),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: ShapeDecoration(
                        color: const Color.fromRGBO(29, 53, 87, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 25,
                            cornerSmoothing: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                              Icons.add,
                              color: Color.fromRGBO(201, 242, 255, 1)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "New Player",
                            style: TextStyle(
                              color: Color.fromRGBO(201, 242, 255, 1),
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // overriden build for team page with ternary operator to check selected page
  @override
  Widget build(BuildContext context) => page == "team_stats" ? _buildTeamStatsPage(context) : _buildPlayerListPage(context);

}
