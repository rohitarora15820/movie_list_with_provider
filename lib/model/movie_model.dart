import 'dart:convert';

class Movie {
  final String title;
  final String duration;
  Movie({
   required this.title,
   required this.duration,
  });

  Movie copyWith({
    String? title,
    String? duration,
  }) {
    return Movie(
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'duration': duration,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      duration: map['duration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() => 'Movie(title: $title, duration: $duration)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Movie &&
      other.title == title &&
      other.duration == duration;
  }

  @override
  int get hashCode => title.hashCode ^ duration.hashCode;
}
