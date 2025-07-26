class PlacesModel {
  final List<Prediction> predictions;
  final String status;

  PlacesModel({required this.predictions, required this.status});

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      predictions: (json['predictions'] as List)
          .map((p) => Prediction.fromJson(p))
          .toList(),
      status: json['status'],
    );
  }
}

class Prediction {
  final String description;
  final String placeId;
  final StructuredFormatting structuredFormatting;

  Prediction({
    required this.description,
    required this.placeId,
    required this.structuredFormatting,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      description: json['description'],
      placeId: json['place_id'],
      structuredFormatting:
      StructuredFormatting.fromJson(json['structured_formatting']),
    );
  }
}

class StructuredFormatting {
  final String mainText;
  final String secondaryText;

  StructuredFormatting({
    required this.mainText,
    required this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'],
      secondaryText: json['secondary_text'],
    );
  }
}
