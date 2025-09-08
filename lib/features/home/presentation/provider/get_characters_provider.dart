import 'dart:async';
import 'package:dragon_ball_app/core/error/network_failure.dart';
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

   return response.fold(
      (success) {
        return CharacterState(list: success, hasMore: true);
      },
      (failure) {
        return CharacterState(list: [], hasMore: false,errorMessage: (failure as ApiFailure).message);
      },
    );

    
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

    state = response.fold((success) {
      return AsyncData(CharacterState(list: [...currentValue!.list, ...success], hasMore: success.isNotEmpty) );
    }, (failure) {
      return AsyncData(CharacterState(list: [], hasMore: false,errorMessage: (failure as ApiFailure).message) );
    },);
    
    
  }
}

final getCharactersProvider =
    AutoDisposeAsyncNotifierProvider<
      GetCharactersProvider,
      CharacterState
    >(GetCharactersProvider.new);
