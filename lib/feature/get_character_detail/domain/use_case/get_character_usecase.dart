import 'package:dragon_ball_app/feature/get_character_detail/domain/entity/character_entity.dart';
import 'package:dragon_ball_app/feature/get_character_detail/domain/repository/get_character_repository.dart';
import 'package:flutter/material.dart';

class GetCharacterUsecase {
  
  GetCharacterRepository getCharacterRepository;

  GetCharacterUsecase({required this.getCharacterRepository});

  Future<CharacterEntity> getCharacter(String characterId) async {
    debugPrint('character_id: $characterId');
    final response = await getCharacterRepository.getCharacter(characterId);
    return response;
  }

}