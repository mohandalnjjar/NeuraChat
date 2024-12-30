class GeniusModelModel {
  final String responseMode;
  final String userInstuctions;

  GeniusModelModel({required this.responseMode, required this.userInstuctions});

  factory GeniusModelModel.fromFirebase({required Map<String, dynamic> data}) {
    return GeniusModelModel(
      responseMode: data['ResponseMode'],
      userInstuctions: data['UserInstuctions'],
    );
  }
}
