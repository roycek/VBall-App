import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

import 'team_page_screen.dart';
import 'team.dart';
import 'edit_page.dart';

class TeamListPage extends StatefulWidget {
  final List<Team> teamList;
  const TeamListPage(this.teamList, {super.key});

  @override
  TeamListPageState createState() => TeamListPageState(teamList);  //state inheritance for more structured screens
}

class TeamListPageState extends State<TeamListPage> {
  final List<Team> teamList;  //teamList arg is handled here
  TeamListPageState(this.teamList);

  void _navigateCreateTeamPage(BuildContext context) async { //navigating to the team creation page and awaiting a name for the team
    final teamName = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditPage('Team'))
    );

    setState(() { //updating team list with new team
      if (teamName != null) teamList.add(Team(teamName));
    });
  }

  void _navigateTeamStatsPage(BuildContext context, int team) async {  //navigating to team stats page and awaiting a possible team name change
    final teamName = await Navigator.push(context, MaterialPageRoute(
        builder: (context) => TeamStatsPage(teamList[team])
    ));

    setState(() {  //updating team name change
      teamList[team].name = teamName;
    });
  }

  void _deleteTeam(BuildContext context, int team) {  //handling team deletion
    teamList.removeAt(team);
    setState(() {});  //updating screen with new teamlist
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(
            'Team List'
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < teamList.length; i++)...[
                const SizedBox(
                    height: 10
                ),
                InkWell(
                  onTap: () => _navigateTeamStatsPage(context, i),
                  child: Container(
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
                              teamList[i].name,
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
                                onPressed: () => _deleteTeam(context, i),
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
                ),
              ],
              const SizedBox(
                  height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => _navigateCreateTeamPage(context),
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
                            "New Team",
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
}
