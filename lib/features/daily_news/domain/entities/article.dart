import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? title;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity(
      {required this.id,
      required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  @override
  List<Object?> get props {
    return [
      id,
      title,
      author,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }
}
