import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class CharactersRepository {
  Future<Result<List<CharactersEntity>>> getCharaters(String pageNumber);
}