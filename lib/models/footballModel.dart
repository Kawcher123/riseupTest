class FootballMatchModel {
  bool status;
  List<FootballMatches> matches;
  String date;

  FootballMatchModel({this.status, this.matches, this.date});

  FootballMatchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['matches'] != null) {
      matches = new List<FootballMatches>();
      json['matches'].forEach((v) {
        matches.add(new FootballMatches.fromJson(v));
      });
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    return data;
  }
}

class FootballMatches {
  int id;
  String name;
  String shortName;
  String tournamentName;
  String startDate;
  int totaljoin;
  TeamA teamA;
  TeamA teamB;

  FootballMatches(
      {this.id,
      this.name,
      this.shortName,
      this.tournamentName,
      this.startDate,
      this.totaljoin,
      this.teamA,
      this.teamB});

  FootballMatches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    tournamentName = json['tournament_name'];
    startDate = json['start_date'];
    totaljoin = json['totaljoin'];
    teamA = json['team_a'] != null ? new TeamA.fromJson(json['team_a']) : null;
    teamB = json['team_b'] != null ? new TeamA.fromJson(json['team_b']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['tournament_name'] = this.tournamentName;
    data['start_date'] = this.startDate;
    data['totaljoin'] = this.totaljoin;
    if (this.teamA != null) {
      data['team_a'] = this.teamA.toJson();
    }
    if (this.teamB != null) {
      data['team_b'] = this.teamB.toJson();
    }
    return data;
  }
}

class TeamA {
  String name;
  String shortName;
  String banner;
  String jersey;

  TeamA({this.name, this.shortName, this.banner, this.jersey});

  TeamA.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['short_name'];
    banner = json['banner'];
    jersey = json['jersey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['banner'] = this.banner;
    data['jersey'] = this.jersey;
    return data;
  }
}
