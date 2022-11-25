class PlayerData {
  final String name;
  final String race;
  final String charClass;
  final String aligment;
  final String background;
  final double xp;
  final String playerName;

  PlayerData({
    required this.name,
    required this.race,
    required this.charClass,
    required this.aligment,
    required this.background,
    required this.xp,
    required this.playerName,
  });

  static PlayerData fromMap(Map<String, dynamic> data) {
    return PlayerData(
      name: data['name'],
      race: data['race'],
      charClass: data['class'],
      aligment: data['aligment'],
      background: data['background'],
      xp: data['xp'],
      playerName: data['playerName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'race': race,
      'class': charClass,
      'aligment': aligment,
      'background': background,
      'xp': xp,
      'playerName': playerName,
    };
  }
}
