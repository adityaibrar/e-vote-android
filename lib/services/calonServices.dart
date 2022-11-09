import 'package:android_vote/model/calon.dart';
import 'package:http/http.dart' as http;

class CandidateServices {
  static final String BaseUrl = 'http://10.0.2.2/api/calon.php';

  Future getCandidate() async {
    Uri UrlApi = Uri.parse(BaseUrl);

    final response = await http.get(UrlApi);
    if (response.statusCode == 200) {
      return candidateFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data Candidate");
    }
  }
}
