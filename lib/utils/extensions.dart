extension NullString on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> removeNullValues() {
    var result = <String, dynamic>{};
    for (var entry in entries) {
      var k = entry.key;
      var v = entry.value;
      if (v != null) {
        result[k] = v;
      }
    }
    return result;
  }

  String makeQuery() {
    var res = [];
    for (var entry in removeNullValues().entries) {
      var key = entry.key;
      var value = entry.value;
      res.add('$key=$value');
    }
    return res.join('&');
  }
}
