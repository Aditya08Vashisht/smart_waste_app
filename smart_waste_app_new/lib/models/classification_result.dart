enum WasteType { dry, wet, other }

class WasteClassificationResult {
  final String label;
  final double confidence;
  final WasteType type;

  WasteClassificationResult({required this.label, required this.confidence})
    : type = _determineType(label);

  static WasteType _determineType(String label) {
    final cleanLabel = label.toLowerCase();
    if (cleanLabel.contains('sukha')) return WasteType.dry;
    if (cleanLabel.contains('geela')) return WasteType.wet;
    return WasteType.other;
  }
}

extension WasteTypeExtension on WasteType {
  String get name {
    switch (this) {
      case WasteType.dry:
        return 'Sukha';
      case WasteType.wet:
        return 'Geela';
      case WasteType.other:
        return 'Other';
    }
  }

  String get emoji {
    switch (this) {
      case WasteType.dry:
        return '🟤';
      case WasteType.wet:
        return '💧';
      case WasteType.other:
        return '❓';
    }
  }
}
