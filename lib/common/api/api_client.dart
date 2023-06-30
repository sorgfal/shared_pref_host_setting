import 'dart:developer';

class ApiClient {
  final String url;

  ApiClient(this.url);

  get(String path) {
    log([url, path].join('/'));
  }
}
