class CrickeMatchModel {
  bool status;
  List<Matches> matches;

  CrickeMatchModel({this.status, this.matches});

  CrickeMatchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['matches'] != null) {
      matches = new List<Matches>();
      json['matches'].forEach((v) {
        matches.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  int id;
  String name;
  String shortName;
  String seasonName;
  String format;
  String startDate;
  String remainTime;
  int totaljoin;
  TeamA teamA;
  TeamA teamB;

  Matches(
      {this.id,
      this.name,
      this.shortName,
      this.seasonName,
      this.format,
      this.startDate,
      this.remainTime,
      this.totaljoin,
      this.teamA,
      this.teamB});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    seasonName = json['season_name'];
    format = json['format'];
    startDate = json['start_date'];
    remainTime = json['remain_time'];
    totaljoin = json['totaljoin'];
    teamA = json['team_a'] != null ? new TeamA.fromJson(json['team_a']) : null;
    teamB = json['team_b'] != null ? new TeamA.fromJson(json['team_b']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['season_name'] = this.seasonName;
    data['format'] = this.format;
    data['start_date'] = this.startDate;
    data['remain_time'] = this.remainTime;
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
