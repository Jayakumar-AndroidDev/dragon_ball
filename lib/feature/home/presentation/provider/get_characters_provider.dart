import 'package:dragon_ball_app/feature/home/data/data_source/get_characters_api.dart';
import 'package:dragon_ball_app/feature/home/data/repository/characters_repository_impl.dart';
import 'package:dragon_ball_app/feature/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/feature/home/domain/use_case/character_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCharactersProvider = FutureProvider<List<CharactersEntity>>((ref)async {
final response =  await CharacterUsecase(
    charactersRepository:  CharactersRepositoryImpl(getCharactersApi: GetCharactersApi(ref: ref))
  ).getCharacters();

  return response;
});