import 'package:bloc/bloc.dart';
import 'package:book_of_argus/cubits/status/player_status_state.dart';
import 'package:book_of_argus/models/player_data.dart';
import 'package:book_of_argus/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class PlayerStatusCubit extends Cubit<PlayerStatusState> {
  PlayerStatusCubit({
    required this.charId,
  }) : super(PlayerStatusState.isLoading());

  final String charId;

  Future<void> getCharData() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(AuthService.getCurrentUser()!.uid)
          .collection('characters')
          .doc(charId)
          .get();

      if (data.data() != null) {
        emit(
          PlayerStatusState.fecthed(
            playerData: PlayerData.fromMap(
              data.data()!['player_data'] as Map<String, dynamic>,
            ),
          ),
        );
      }
    } on Exception {
      debugPrint('failed on getCharData() on player status cubit');
    }
  }
}
