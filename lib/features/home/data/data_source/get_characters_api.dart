import 'dart:io';

import 'package:dragon_ball_app/core/network/api_client.dart';
import 'package:dragon_ball_app/core/network/api_client_provider.dart';
import 'package:dragon_ball_app/features/home/data/model/characters_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCharactersApi {
  final Ref ref;
  GetCharactersApi({required this.ref});

  Future<CharactersModel> getCharacters(String pageNumber) async {
    ApiClient apiClient = ref.read(apiClientProvider);
    
   final response = await apiClient.get("characters?page=$pageNumber");
   return CharactersModel.fromJson(response);
  }
}