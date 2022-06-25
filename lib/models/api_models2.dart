class GetNews {
  // String name;
  String? author;
  String? title;
  String? description;
  String? image;
  String? content;

  GetNews(
      {this.author, this.title, this.content, this.description, this.image});

  factory GetNews.fromJson(dynamic json) {
    return GetNews(
        // name: json['name'] as String,
        author: json['author'],
        title: json['title'],
        description: json['description'],
        image: json['urlToImage'],
        content: json['content']);
  }

  static List<GetNews> getnewsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return GetNews.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'GetNews {author: $author, title:$title, description: $description, image: $image, content: $content}';
  }
}
