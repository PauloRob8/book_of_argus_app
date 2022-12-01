import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerData {
  final String id;
  final String name;
  final String race;
  final String charClass;
  final String aligment;
  final String background;
  final int xp;
  final int lvl;
  final String playerName;

  PlayerData({
    required this.id,
    required this.name,
    required this.race,
    required this.charClass,
    required this.aligment,
    required this.background,
    required this.xp,
    required this.lvl,
    required this.playerName,
  });

  static get artificer => 'artífice';
  static get barbarian => 'bárbaro';
  static get bard => 'bardo';
  static get warlock => 'bruxo';
  static get cleric => 'clérigo';
  static get druid => 'druida';
  static get sorcerer => 'feiticeiro';
  static get warrior => 'guerreiro';
  static get rogue => 'ladino';
  static get mage => 'mago';
  static get monk => 'monge';
  static get ranger => 'patrulheiro';
  static get paladin => 'paladino';

  static PlayerData fromFirebaseCollection(
    QueryDocumentSnapshot<Map<String, dynamic>> data,
  ) {
    final playerData = data.data()['player_data'];
    return PlayerData(
      id: data.id,
      name: playerData['name'],
      race: playerData['race'],
      charClass: playerData['class'],
      aligment: playerData['aligment'],
      background: playerData['background'],
      lvl: playerData['lvl'],
      xp: playerData['xp'],
      playerName: playerData['playerName'],
    );
  }

  static PlayerData fromMap(
    Map<String, dynamic> data,
  ) =>
      PlayerData(
        id: data['id'],
        name: data['name'],
        race: data['race'],
        charClass: data['class'],
        aligment: data['aligment'],
        background: data['background'],
        lvl: data['lvl'],
        xp: data['xp'],
        playerName: data['playerName'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'race': race,
      'class': charClass,
      'aligment': aligment,
      'background': background,
      'xp': xp,
      'lvl': lvl,
      'playerName': playerName,
    };
  }
}
