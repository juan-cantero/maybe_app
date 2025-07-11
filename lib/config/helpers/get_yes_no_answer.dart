import 'dart:math';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:maybe_app/domain/entities/message.dart';
import 'package:maybe_app/domain/infrastructure/models/giphy_response.dart';

class GetYesNoAnswer {
  static String get _giphyApiKey => dotenv.env['GIPHY_API_KEY'] ?? '';
  static const _giphyApiUrl = 'api.giphy.com';

  Future<Message> getAnswer() async {
    // 1️⃣ Generate answer locally
    final answers = ['yes', 'no', 'maybe'];
    final randomAnswer = answers[Random().nextInt(answers.length)];

    // 2️⃣ Get GIF from Giphy
    final gifUrl = await _fetchGifUrl(randomAnswer);

    return Message(text: randomAnswer, fromWho: FromWho.hers, imageUrl: gifUrl);
  }

  Future<String> _fetchGifUrl(String query) async {
    final giphyUri = Uri.https(_giphyApiUrl, '/v1/gifs/search', {
      'api_key': _giphyApiKey,
      'q': query,
      'limit': '10',
      'rating': 'g',
    });

    final httpResponse = await http.get(giphyUri);

    if (httpResponse.statusCode != 200) {
      throw Exception('Failed to load GIF from Giphy');
    }

    final giphyData = jsonDecode(httpResponse.body);
    final giphyResponse = GiphyResponse.fromJson(giphyData);

    if (giphyResponse.data.isEmpty) {
      throw Exception('No GIFs found for $query');
    }

    final random = Random();
    final randomGif = giphyResponse.data[random.nextInt(giphyResponse.data.length)];
    final gifUrl = randomGif.images.downsizedMedium.url;

    return gifUrl;
  }
}
