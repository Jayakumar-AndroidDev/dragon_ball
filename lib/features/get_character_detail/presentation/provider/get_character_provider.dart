import 'dart:async';

import 'package:dragon_ball_app/features/get_character_detail/data/data_source/get_character_api.dart';
import 'package:dragon_ball_app/features/get_character_detail/data/repository/get_character_repository_impl.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/entity/character_entity.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/use_case/get_character_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCharacterProvider extends AsyncNotifier<CharacterEntity?> {
  @override
  FutureOr<CharacterEntity?> build() {
    return null;
  }

  getCharacterDetail(String charactedId) async {
    state = AsyncLoading();
    final getCharacterUsecase = GetCharacterUsecase(
      getCharacterRepository: GetCharacterRepositoryImpl(
        getCharacterApi: GetCharacterApi(ref: ref),
      ),
    );
    final getCharacter = getCharacterUsecase.getCharacter(charactedId);
    state = await AsyncValue.guard(() => getCharacter,);
  }
}

final getCharacterProvider = AsyncNotifierProvider<GetCharacterProvider,CharacterEntity?>(GetCharacterProvider.new);


