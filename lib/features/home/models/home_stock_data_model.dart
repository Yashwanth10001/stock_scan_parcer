class StockDataModel {
  int id;
  String name;
  String tag;
  String color;
  List<Criteria> criteria;

  StockDataModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory StockDataModel.fromJson(Map<String, dynamic> json) {
    List<Criteria> criteria = List.from(json['criteria'] ?? [])
        .map((e) => Criteria.fromJson(e))
        .toList();

    return StockDataModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      tag: json['tag'] ?? '',
      color: json['color'] ?? '',
      criteria: criteria,
    );
  }
}

class Criteria {
  String type;
  String text;
  dynamic variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return Criteria(
      type: json['type'] ?? '',
      text: json['text'] ?? '',
      variable: json.containsKey('variable') ? json['variable'] : null,
    );
  }
}

class Variable {
  String type;
  List<int>? values;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;

  Variable({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      type: json['type'] ?? '',
      values: json['values'] ?? [],
      studyType: json['study_type'] ?? '',
      parameterName: json['parameter_name'] ?? '',
      minValue: json['min_value'] ?? 0,
      maxValue: json['max_value'] ?? 0,
      defaultValue: json['default_value'] ?? 0,
    );
  }
}
