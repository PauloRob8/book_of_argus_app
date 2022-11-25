import 'package:book_of_argus/models/player_data.dart';
import 'package:equatable/equatable.dart';

class CharactersState extends Equatable {
  const CharactersState({
    required this.isLoading,
    required this.chars,
  });

  factory CharactersState.isLoading() => const CharactersState(
        isLoading: true,
        chars: [],
      );

  factory CharactersState.fecthed({
    required List<PlayerData> chars,
  }) =>
      CharactersState(
        isLoading: false,
        chars: chars,
      );

  final bool isLoading;
  final List<PlayerData> chars;

  @override
  List<Object?> get props => [
        isLoading,
        chars,
      ];
}
