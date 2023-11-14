import 'package:http/http.dart' as http;
import 'package:yc_game_poc/models/game_model.dart';

class Api {
  String url = 'http://192.168.29.250:50000/';

  Future<GameModel?> getGameModel(int gameNo) async {
    final response =
        await http.get(Uri.parse('${url}game$gameNo'), headers: {});
    if (response.statusCode == 200) {
      return gameModelFromJson(response.body);
    }
    return null;
  }
}
