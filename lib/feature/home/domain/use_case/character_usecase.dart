import 'package:dragon_ball_app/feature/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/feature/home/domain/repository/character_repository.dart';

class CharacterUsecase {
  CharactersRepository charactersRepository;

  CharacterUsecase({required this.charactersRepository});

  Future<List<CharactersEntity>> getCharacters() async {
    final characters = await charactersRepository.getCharaters();
    return characters;
  }
}