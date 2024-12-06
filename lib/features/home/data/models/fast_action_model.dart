class FastActionModel {
  final String name;
  final String description;
  final List<String> fastActionsList;

  FastActionModel({
    required this.name,
    required this.description,
    required this.fastActionsList,
  });

  factory FastActionModel.fromFirebase(Map<String, dynamic> jsonData) {
    return FastActionModel(
      name: jsonData['name'] ?? "",
      description: jsonData['description'] ?? "",
      fastActionsList: List<String>.from(jsonData['tasks'] ?? []),
    );
  }
}
