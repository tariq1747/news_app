enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
  upload;
}

enum MessageType {
  error,
  success,
  information;
}

enum NewsCategorys {
  general(0, 'general'),
  business(1, 'business'),
  entertainment(2, 'entertainment'),
  health(3, 'health'),
  science(4, 'science'),
  sports(5, 'sports'),
  technology(6, 'technology');

  const NewsCategorys(this.value, this.label);
  final int value;
  final String label;
}
