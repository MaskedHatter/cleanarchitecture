import 'package:cleanarchitecture/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  // Create an immutable instance
  // that is what is required in this case
  // using super allows us to instantiate the 
  // the parent class parameters. allowing 
  // immutability of ArticleModel and ArticleEntity
  const ArticleModel({
    super.id,
    super.title,
    super.author,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  // Factory method to return the immutable articleModel
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
        author: map['author'] ?? "",
        title: map['title'] ?? "",
        description: map['description'] ?? "",
        url: map['url'] ?? "",
        urlToImage: map['urlToImage'] ?? "",
        publishedAt: map['publishedAt'] ?? "",
        content: map['content'] ?? "");
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content
    );
  }
}
