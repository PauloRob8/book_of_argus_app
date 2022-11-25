import 'package:bloc/bloc.dart';
import 'package:book_of_argus/cubits/characters/add_characters/add_characters_state.dart';
import 'package:book_of_argus/models/player_data.dart';
import 'package:book_of_argus/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AddCharactersCubit extends Cubit<AddCharactersState> {
  AddCharactersCubit() : super(AddCharactersState.initial());

  void verifyFields({
    required String name,
    required String race,
    required String charClass,
    required String aligment,
    required String background,
    required String xp,
    required String playerName,
  }) {
    final emptyFields = <AddCharactersError>[];
    if (name.isEmpty) {
      emptyFields.add(AddCharactersError.emptyName);
    }
    if (race.isEmpty) {
      emptyFields.add(AddCharactersError.emptyRace);
    }
    if (aligment.isEmpty) {
      emptyFields.add(AddCharactersError.emptyAligment);
    }
    if (background.isEmpty) {
      emptyFields.add(AddCharactersError.emptyBackground);
    }
    if (xp.isEmpty) {
      emptyFields.add(AddCharactersError.emptyXP);
    }
    if (playerName.isEmpty) {
      emptyFields.add(AddCharactersError.emptyPlayerName);
    }

    if (emptyFields.isNotEmpty) {
      emit(AddCharactersState.error(errors: emptyFields));
    } else {
      final data = PlayerData(
        name: name,
        race: race,
        charClass: charClass,
        aligment: aligment,
        background: background,
        xp: double.parse(xp),
        playerName: playerName,
      );
      addCharacter(data: data);
    }
  }

  void addCharacter({
    required PlayerData data,
  }) {
    emit(AddCharactersState.loading());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(AuthService.getCurrentUser()!.uid)
          .collection('characters')
          .doc()
          .set({
        'player_data': data.toMap(),
      });

      emit(AddCharactersState.success());
    } on Exception {
      debugPrint('xii');
    }
  }
}
