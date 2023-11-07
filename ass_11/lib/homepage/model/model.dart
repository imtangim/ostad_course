// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class APIModel {
  final int albumid;
  final int id;
  final String url;
  final String thumbnailUrl;
  final String title;
  APIModel({
    required this.albumid,
    required this.id,
    required this.url,
    required this.thumbnailUrl,
    required this.title,
  });


  

  APIModel copyWith({
    int? albumid,
    int? id,
    String? url,
    String? thumbnailUrl,
    String? title,
  }) {
    return APIModel(
      albumid: albumid ?? this.albumid,
      id: id ?? this.id,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumid': albumid,
      'id': id,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'title': title,
    };
  }

  factory APIModel.fromMap(Map<String, dynamic> map) {
    return APIModel(
      albumid: map['albumid'] as int,
      id: map['id'] as int,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory APIModel.fromJson(String source) => APIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'APIModel(albumid: $albumid, id: $id, url: $url, thumbnailUrl: $thumbnailUrl, title: $title)';
  }

  @override
  bool operator ==(covariant APIModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.albumid == albumid &&
      other.id == id &&
      other.url == url &&
      other.thumbnailUrl == thumbnailUrl &&
      other.title == title;
  }

  @override
  int get hashCode {
    return albumid.hashCode ^
      id.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode ^
      title.hashCode;
  }
}
