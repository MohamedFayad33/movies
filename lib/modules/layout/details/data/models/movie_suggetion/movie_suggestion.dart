import 'package:movies_app/modules/layout/details/domin/entities/movie_suggestions_entity.dart';

import 'torrent.dart';

class MovieSuggestionModel extends MovieSuggestionsEntity {
  num? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  double? rating;
  num? runtime;
  List<dynamic>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? state;
  List<Torrent>? torrents;
  String? dateUploaded;
  num? dateUploadedUnix;

  MovieSuggestionModel({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  }) : super(movieId: id, movieImage: mediumCoverImage, movieRating: rating);

  factory MovieSuggestionModel.fromJson(Map<String, dynamic> data) {
    return MovieSuggestionModel(
      id: data['id'] as num,
      url: data['url'] as String?,
      imdbCode: data['imdb_code'] as String?,
      title: data['title'] as String?,
      titleEnglish: data['title_english'] as String?,
      titleLong: data['title_long'] as String?,
      slug: data['slug'] as String?,
      year: data['year'] as num?,
      rating: (data['rating'] as num?)?.toDouble(),
      runtime: data['runtime'] as num?,
      genres: data['genres'] as List<dynamic>?,
      summary: data['summary'] as String?,
      descriptionFull: data['description_full'] as String?,
      synopsis: data['synopsis'] as String?,
      ytTrailerCode: data['yt_trailer_code'] as String?,
      language: data['language'] as String?,
      mpaRating: data['mpa_rating'] as String?,
      backgroundImage: data['background_image'] as String?,
      backgroundImageOriginal: data['background_image_original'] as String?,
      smallCoverImage: data['small_cover_image'] as String?,
      mediumCoverImage: data['medium_cover_image'] as String?,
      state: data['state'] as String?,
      torrents: (data['torrents'] as List<dynamic>?)
          ?.map((e) => Torrent.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateUploaded: data['date_uploaded'] as String?,
      dateUploadedUnix: data['date_uploaded_unix'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'imdb_code': imdbCode,
      'title': title,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'summary': summary,
      'description_full': descriptionFull,
      'synopsis': synopsis,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'mpa_rating': mpaRating,
      'background_image': backgroundImage,
      'background_image_original': backgroundImageOriginal,
      'small_cover_image': smallCoverImage,
      'medium_cover_image': mediumCoverImage,
      'state': state,
      'torrents': torrents?.map((e) => e.toJson()).toList(),
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}
