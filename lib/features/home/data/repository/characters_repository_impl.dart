import 'dart:io';

import 'package:dragon_ball_app/core/error/network_failure.dart';
import 'package:dragon_ball_app/features/home/data/data_source/get_characters_api.dart';
import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/features/home/domain/repository/character_repository.dart';
import 'package:result_dart/result_dart.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  GetCharactersApi getCharactersApi;
  CharactersRepositoryImpl({required this.getCharactersApi});

  @override
  Future<Result<List<CharactersEntity>>> getCharaters(String pageNumber) async {
    try {
      final response = await getCharactersApi.getCharacters(pageNumber);
      return Success(response.toCharactersEntity());
    } on SocketException {
      return Failure(const NetworkFailure("No Internet connection"));
    } on TimeoutFailure {
      return Failure(TimeoutFailure("Request timed out"));
    } on HttpException catch (err) {
      return Failure(ServerFailure("HTTP error: ${err.message}"));
    } on FormatException catch (e) {
      return Failure(ServerFailure("Parsing error: ${e.message}"));
    } on TypeError catch (e) {
      return Failure(ServerFailure("Type casting error: ${e.toString()}"));
    } catch (error) {
      return Failure(UnknownFailure("Unexpected error: $error"));
    }
  }
}
