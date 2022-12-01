import 'package:book_of_argus/models/player_data.dart';
import 'package:equatable/equatable.dart';

class PlayerStatusState extends Equatable {
  final bool isLoading;
  final PlayerData? playerData;

  const PlayerStatusState({
    required this.isLoading,
    required this.playerData,
  });

  factory PlayerStatusState.isLoading() => const PlayerStatusState(
        isLoading: true,
        playerData: null,
      );

  factory PlayerStatusState.fecthed({
    required PlayerData playerData,
  }) =>
      PlayerStatusState(
        isLoading: false,
        playerData: playerData,
      );

  @override
  List<Object?> get props => [
        isLoading,
        playerData,
      ];
}
