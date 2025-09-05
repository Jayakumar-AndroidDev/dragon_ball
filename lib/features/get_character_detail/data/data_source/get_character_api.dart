import 'package:dragon_ball_app/core/network/api_client.dart';
import 'package:dragon_ball_app/core/network/api_client_provider.dart';
import 'package:dragon_ball_app/features/get_character_detail/data/model/character_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCharacterApi {
  Ref ref;

  GetCharacterApi({required this.ref});

  Future<CharacterModel> getCharacter({required String id}) async {
    ApiClient apiClient = ref.read(apiClientProvider);
    final response = await apiClient.get("Characters/$id");
    return CharacterModel.fromJson(response);
  }
}
