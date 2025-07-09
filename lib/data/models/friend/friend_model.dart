class FriendModel {
  String? id;
  String requester; //ID người gửi
  String recipient; //ID người nhận
  FriendType? type;
  StatusType? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  FriendModel({
    this.id,
    required this.requester,
    required this.recipient,
    this.type = FriendType.friendRequest,
    this.status = StatusType.pending,
    this.createdAt,
    this.updatedAt
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      id: json['_id'], //ObjectID
      requester: json['requester'],
      recipient: json['reciptient'],
      type: FriendType.fromString(json['type']),
      status: StatusType.fromString(json['status']),
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt'])
    );
  }

  Map<String, dynamic> toJson() => {
  };

  static DateTime? _parseDateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }

}

  enum FriendType {
  follow,
  friendRequest;

  /// Convert từ string sang enum
  static FriendType? fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'follow':
        return FriendType.follow;
      case 'friend_request':
        return FriendType.friendRequest;
      default:
        return null;
    }
  }

  /// Convert enum sang string
  String toApiString() {
    switch (this) {
      case FriendType.follow:
        return 'follow';
      case FriendType.friendRequest:
        return 'friend_request';
    }
  }
}

/// Enum định nghĩa trạng thái của friend request
enum StatusType {
  pending,
  accepted,
  rejected,
  following;

  /// Convert từ string sang enum
  static StatusType? fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'pending':
        return StatusType.pending;
      case 'accepted':
        return StatusType.accepted;
      case 'rejected':
        return StatusType.rejected;
      case 'following':
        return StatusType.following;
      default:
        return null;
    }
  }

  /// Convert enum sang string
  String toApiString() {
    switch (this) {
      case StatusType.pending:
        return 'pending';
      case StatusType.accepted:
        return 'accepted';
      case StatusType.rejected:
        return 'rejected';
      case StatusType.following:
        return 'following';
    }
  }

}