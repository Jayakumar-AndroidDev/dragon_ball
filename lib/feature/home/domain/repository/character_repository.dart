import 'package:dragon_ball_app/feature/home/domain/entity/characters_entity.dart';

abstract class CharactersRepository {
  Future<List<CharactersEntity>> getCharaters();
}