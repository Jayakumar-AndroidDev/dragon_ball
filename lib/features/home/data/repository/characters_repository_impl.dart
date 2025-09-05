import 'package:dragon_ball_app/features/home/data/data_source/get_characters_api.dart';
import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/features/home/domain/repository/character_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {

  GetCharactersApi getCharactersApi;
  CharactersRepositoryImpl({required this.getCharactersApi});

  @override
  Future<List<CharactersEntity>> getCharaters() async {
      final response = await getCharactersApi.getCharacters();
      return response.toCharactersEntity();
  }
}