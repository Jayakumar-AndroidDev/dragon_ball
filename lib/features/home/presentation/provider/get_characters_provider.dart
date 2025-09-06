import 'dart:async';

import 'package:dragon_ball_app/features/home/data/data_source/get_characters_api.dart';
import 'package:dragon_ball_app/features/home/data/repository/characters_repository_impl.dart';
import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/features/home/domain/use_case/character_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCharactersProvider
    extends AutoDisposeAsyncNotifier<List<CharactersEntity>?> {
  @override
  FutureOr<List<CharactersEntity>?> build() {
   final response = CharacterUsecase(
      charactersRepository: CharactersRepositoryImpl(
        getCharactersApi: GetCharactersApi(ref: ref),
      ),
    ).getCharacters();

    return response;
  }

  Future changePage() async {
    state = AsyncLoading();
    final response =  CharacterUsecase(
      charactersRepository: CharactersRepositoryImpl(
        getCharactersApi: GetCharactersApi(ref: ref),
      ),
    ).getCharacters();
    state  = await AsyncValue.guard(() => response,);
  }
}

final getCharactersProvider = AutoDisposeAsyncNotifierProvider<GetCharactersProvider,List<CharactersEntity>?>(GetCharactersProvider.new);


