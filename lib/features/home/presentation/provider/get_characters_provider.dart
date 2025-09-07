import 'dart:async';
import 'package:dragon_ball_app/features/home/data/data_source/get_characters_api.dart';
import 'package:dragon_ball_app/features/home/data/repository/characters_repository_impl.dart';
import 'package:dragon_ball_app/features/home/domain/use_case/character_usecase.dart';
import 'package:dragon_ball_app/features/home/presentation/provider/model/character_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCharactersProvider
    extends AutoDisposeAsyncNotifier<CharacterState> {
  int _pageNumber = 1;
  bool _isInitialLoad = true;
  @override
  FutureOr<CharacterState> build() async {
    final response = await CharacterUsecase(
      charactersRepository: CharactersRepositoryImpl(
        getCharactersApi: GetCharactersApi(ref: ref),
      ),
    ).getCharacters("1");
    _isInitialLoad = false;
    return CharacterState(list: response, hasMore: true);
  }

  Future changePage(pageNumber) async {
    _pageNumber = _pageNumber + 1;
    final currentValue = state.value;
    if (_isInitialLoad) {
      state = AsyncLoading();
    }
    final response = await CharacterUsecase(
      charactersRepository: CharactersRepositoryImpl(
        getCharactersApi: GetCharactersApi(ref: ref),
      ),
    ).getCharacters(_pageNumber.toString());
    
    state = AsyncData(CharacterState(list: [...currentValue!.list, ...response], hasMore: response.isNotEmpty) );
  }
}

final getCharactersProvider =
    AutoDisposeAsyncNotifierProvider<
      GetCharactersProvider,
      CharacterState
    >(GetCharactersProvider.new);
