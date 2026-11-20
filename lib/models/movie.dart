class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String runtime;
  final String screeningTime;
  final double ticketPrice;
  final String posterImagePath;
  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.runtime,
    required this.screeningTime,
    required this.ticketPrice,
    required this.posterImagePath,
  });

  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}';

  factory Movie.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final title = json['title'] as String;
    final synopsis = json['synopsis'] as String;
    final ageRating = json['ageRating'] as String;
    final runtime = json['runtime'] as String;
    final screeningTime = json['screeningTime'] as String;
    final ticketPrice = (json['ticketPrice'] as num).toDouble();
    final posterImagePath = json['posterImagePath'] as String;
  
    return Movie(
      id: id,
      title: title,
      synopsis: synopsis,
      ageRating: ageRating,
      runtime: runtime,
      screeningTime: screeningTime,
      ticketPrice: ticketPrice,
      posterImagePath: posterImagePath
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'ageRating': ageRating,
      'runtime': runtime,
      'screeningTime': screeningTime,
      'ticketPrice': ticketPrice,
      'posterImagePath': posterImagePath,
    };
    return data;
  }

}
