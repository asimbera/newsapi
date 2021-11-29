import 'package:newsapi/newsapi.dart';

Future<void> main() async {
  var api = NewsApi.withApiKey("<your api key>");
  var resp = await api.everything(q: 'bitcoin');
  print("Status: ${resp.status}");
  print("Total Results: ${resp.totalResults}");
  print("Articles: ${resp.articles}");

  resp = await api.topHeadlines(country: 'us');
  print("Status: ${resp.status}");
  print("Total Results: ${resp.totalResults}");
  print("Articles: ${resp.articles}");

  var sources = await api.sources();
  print("Status: ${sources.status}");
  print("Total Sources: ${sources.sources?.length}");
}
