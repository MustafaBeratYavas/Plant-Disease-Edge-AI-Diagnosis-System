// Represents a disease summary item used by library listings.

class DiseaseModel {
  // Standard immutable constructor
  const DiseaseModel({required this.id, required this.localizationKey});
  // Unique identifier
  final String id;
  // Localization resource key
  final String localizationKey;
}
