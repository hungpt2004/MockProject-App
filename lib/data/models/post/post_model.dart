class PostModel {
  final String avatarUser;
  final String nameUser;
  final String content;
  final String image;
  final int likeNumber;
  final int commentNumber;
  final int shareNumber;

  PostModel({
    required this.content,
    required this.image,
    required this.avatarUser,
    required this.nameUser,
    required this.likeNumber,
    required this.commentNumber,
    required this.shareNumber,
  });
}
