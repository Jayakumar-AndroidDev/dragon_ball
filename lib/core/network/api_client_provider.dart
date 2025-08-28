import 'package:dragon_ball_app/core/network/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider((ref) => ApiClient(baseUrl: "https://dragonball-api.com/api/"));