import 'dart:async';
import 'dart:io';

import 'package:dragon_ball_app/core/error/network_failure.dart';
import 'package:dragon_ball_app/features/get_character_detail/data/data_source/get_character_api.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/entity/character_entity.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/repository/get_character_repository.dart';
import 'package:result_dart/result_dart.dart';

class GetCharacterRepositoryImpl extends GetCharacterRepository {
  GetCharacterApi getCharacterApi;

  GetCharacterRepositoryImpl({required this.getCharacterApi});

  @override
  Future<Result<CharacterEntity>> getCharacter(String characterId) async {
    try {
      final response = await getCharacterApi.getCharacter(id: characterId);
      

      return Success(response.toCharacterEntity());
    } on SocketException {
      return Failure(NetworkFailure());
    } on TimeoutException {
      return Failure(TimeoutFailure());
    } on HttpException catch (err) {
      return Failure(ServerFailure('Request error: ${err.message}'));
    } on FormatException catch (err) {
      return Failure(ParsingFailure('Parsing error! ${err.toString()}'));
    } on TypeError catch (err) {
      return Failure(ParsingFailure('Type error! ${err.toString()}'));
    } catch (err) {
      return Failure(UnknownFailure('Somthing went wrong! ${err.toString()}'));
    }
  }
}
