import 'package:equatable/equatable.dart';

enum AddCharactersError {
  emptyName,
  emptyRace,
  emptyAligment,
  emptyBackground,
  emptyXP,
  emptyPlayerName,
}

class AddCharactersState extends Equatable {
  const AddCharactersState({
    required this.isLoading,
    required this.added,
    required this.errorsType,
  });

  factory AddCharactersState.initial() => const AddCharactersState(
        isLoading: false,
        added: false,
        errorsType: [],
      );

  factory AddCharactersState.loading() => const AddCharactersState(
        isLoading: true,
        added: false,
        errorsType: [],
      );

  factory AddCharactersState.success() => const AddCharactersState(
        isLoading: false,
        added: true,
        errorsType: [],
      );

  factory AddCharactersState.error({
    required List<AddCharactersError> errors,
  }) =>
      AddCharactersState(
        isLoading: false,
        added: false,
        errorsType: errors,
      );

  final bool isLoading;
  final bool added;
  final List<AddCharactersError> errorsType;

  @override
  List<Object?> get props => [
        isLoading,
        added,
        errorsType,
      ];
}
