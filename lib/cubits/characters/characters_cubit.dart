import 'package:book_of_argus/cubits/characters/characters_state.dart';
import 'package:book_of_argus/models/player_data.dart';
import 'package:book_of_argus/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersState.isLoading());

  void loadChars() async {
    final charsData = await FirebaseFirestore.instance
        .collection('users')
        .doc(AuthService.getCurrentUser()!.uid)
        .collection('characters')
        .get();

    final charsModel = charsData.docs
        .map(
          (data) => PlayerData.fromMap(data.data()['player_data']),
        )
        .toList();

    emit(CharactersState.fecthed(chars: charsModel));
  }
}
