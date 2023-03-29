class Team { //creating default team
  String name;
  int wins = 19;
  int losses = 5;
  double serve = 0.88;
  double recieve = 0.91;
  double attack = 0.85;
  final players = <Player>[
    Player("Alice"), Player("Bob"), Player("Charlie")
  ];

  Team(this.name);
}

class Player {
  String name;

  Player(this.name);
}
