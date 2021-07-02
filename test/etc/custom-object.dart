class CustomObject {
  final String? key;
  final List? list;
  final bool? boolean;
  final int? number;
  final dynamic object;

  CustomObject({
    this.key,
    this.list,
    this.boolean,
    this.number,
    this.object,
  });

  CustomObject.fromJson(Map<String, dynamic> data)
      : key = data['key'],
        boolean = data['boolean'],
        list = data['list'],
        number = data['number'],
        object = data['object'];

  static jsonHandler(Map<String, dynamic> data) => CustomObject.fromJson(data);

  @override
  String toString() {
    return '<CustomObject>{key:$key, list: $list, boolean:$boolean, number:$number, object:$object}';
  }

  @override
  bool operator ==(o) => o is CustomObject && o.key == key;

  /// Override the hashCode for the sake of simplicity while testing.
  @override
  int get hashCode => 0;
}
