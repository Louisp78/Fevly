import 'package:fevly/model/media.dart';

class TimeCapsule {
  final List<Media> _medias = List.empty();

  //* Getters
  /// Return unmodifiable list of Media
  /// Use addMedia(Media media) for mutation
  List<Media> medias()
  {
    return List.unmodifiable(_medias);
  }

  void addMedia({required Media media})
  {
    return _medias.add(media);
  }
  bool removeMedia({required Media media})
  {
    return _medias.remove(media);
  }

}
