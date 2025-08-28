
import 'package:dragon_ball_app/feature/get_character_detail/data/data_source/get_character_api.dart';
import 'package:dragon_ball_app/feature/get_character_detail/data/repository/get_character_repository_impl.dart';
import 'package:dragon_ball_app/feature/get_character_detail/domain/entity/character_entity.dart';
import 'package:dragon_ball_app/feature/get_character_detail/domain/use_case/get_character_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCharacterProvider = FutureProvider.family<CharacterEntity, String>((ref, arg) async {
  final getCharacterUsecase = GetCharacterUsecase(
    getCharacterRepository: GetCharacterRepositoryImpl(
      getCharacterApi: GetCharacterApi(ref: ref),
    ),
  );

  final getCharacter = await getCharacterUsecase.getCharacter(arg);
  return getCharacter;
});