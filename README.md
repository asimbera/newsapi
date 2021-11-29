# News API

A dart library for News API from newsapi.org.

## Getting started

- Get an API key at https://newsapi.org.

## Usage

Initialize the client

```dart
import 'package:dio/dio.dart';
import 'package:newsapi/newsapi.dart';

// Initialize the client maually (you must have to provide apiKey either with dio's BaseOptions or with apiKey param in each request).
var dio = Dio();
var api = NewsApi(dio);

// Initialize client with api key
var api = NewsApi.withApiKey("<your key here>");
```

### Everything

Search every article published by over 80,000 different sources large and small in the last 4 years.

All the params are optional but you must have to provide one param otherwise the api will return error.

```dart
var resp = await api.everything(q: 'bitcoin');
print("Status: ${resp.status}");
print("Total Results: ${resp.totalResults}");
print("Articles: ${resp.articles}");
```

### Top Headlines

Returns breaking news headlines for countries, categories, and singular publishers. This is perfect for use with news tickers or anywhere you want to use live up-to-date news headlines.

All the params are optional but you must have to provide one param otherwise the api will return error.

```dart
var resp = await api.topHeadlines(country: 'us');
print("Status: ${resp.status}");
print("Total Results: ${resp.totalResults}");
print("Articles: ${resp.articles}");
```

### Sources

Returns information (including name, description, and category) about the most notable sources available for obtaining top headlines from. This list could be piped directly through to your users when showing them some of the options available.

```dart
var sources = await api.sources();
print("Status: ${sources.status}");
print("Total Sources: ${sources.sources?.length}");
```

## Additional information

Know more about the api at <https://newsapi.org>

## License

MIT License
