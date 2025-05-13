import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class ClassificationService {
  late final Interpreter _interpreter;
  late final List<String> _labels;
  bool _modelLoaded = false;

  Future<void> loadModel() async {
    if (_modelLoaded) return;

    _interpreter = await Interpreter.fromAsset('model.tflite');
    _labels = await File('assets/labels.txt').readAsLines();
    _modelLoaded = true;
  }

  Future<String> classifyImage(File imageFile) async {
    await loadModel();

    final rawImage = img.decodeImage(await imageFile.readAsBytes());
    if (rawImage == null) {
      throw Exception("Could not decode image.");
    }

    final resized = img.copyResize(rawImage, width: 224, height: 224);

    // Build [1, 224, 224, 3] normalized float32 tensor
    final input = List.generate(1, (_) {
      return List.generate(224, (y) {
        return List.generate(224, (x) {
          final pixel = resized.getPixel(x, y);
          return [
            img.getRed(pixel) / 255.0,
            img.getGreen(pixel) / 255.0,
            img.getBlue(pixel) / 255.0,
          ];
        });
      });
    });

    final output = List.filled(
      _labels.length,
      0.0,
    ).reshape([1, _labels.length]);

    _interpreter.run(input, output);

    final result = output[0];
    final maxScore = result.reduce((a, b) => a > b ? a : b);
    final maxIndex = result.indexOf(maxScore);

    return _labels[maxIndex];
  }
}
