/*
=== HƯỚNG DẪN SỬ DỤNG MobX CONTROLLERS ===

1. Cài đặt dependencies (đã thêm vào pubspec.yaml):
   - mobx: ^2.3.0+1
   - flutter_mobx: ^2.2.0+2
   - build_runner: ^2.4.7
   - mobx_codegen: ^2.4.0

2. Chạy lệnh để cài đặt:
   flutter pub get

3. Chạy code generation:
   flutter packages pub run build_runner build

4. Để watch changes (optional):
   flutter packages pub run build_runner watch

=== CẤU TRÚC CONTROLLERS ===

lib/presentation/pages/
├── auth/controller/
│   └── auth_controller.dart           # Xử lý đăng nhập, đăng ký, quên mật khẩu
├── dashboard/controller/
│   └── dashboard_controller.dart      # Quản lý navigation, drawer, notifications
├── friends/controller/
│   └── friends_controller.dart        # CRUD bạn bè, lời mời, gợi ý
├── home/controller/
│   └── home_controller.dart          # CRUD posts, stories, likes, shares
└── shared/controller/
    └── store_provider.dart           # Global store provider

=== CÁCH SỬ DỤNG ===

1. Wrap app với StoreProvider trong main.dart:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize all stores
  await StoreFactory.initializeAll();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      authController: StoreFactory.authController,
      dashboardController: StoreFactory.dashboardController,
      friendsController: StoreFactory.friendsController,
      homeController: StoreFactory.homeController,
      child: MaterialApp(
        home: MyDashboardScreen(),
      ),
    );
  }
}
```

2. Sử dụng trong widgets:

```dart
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = context.authController;
    
    return Observer(
      builder: (_) => Column(
        children: [
          TextField(
            onChanged: authController.setEmail,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: authController.hasError ? authController.errorMessage : null,
            ),
          ),
          TextField(
            onChanged: authController.setPassword,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: authController.isLoading ? null : () async {
              final success = await authController.login();
              if (success) {
                // Navigate to dashboard
              }
            },
            child: authController.isLoading 
              ? CircularProgressIndicator()
              : Text('Đăng nhập'),
          ),
        ],
      ),
    );
  }
}
```

3. Quản lý danh sách bạn bè:

```dart
class FriendsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final friendsController = context.friendsController;
    
    return Observer(
      builder: (_) => ListView.builder(
        itemCount: friendsController.friends.length,
        itemBuilder: (context, index) {
          final friend = friendsController.friends[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(friend['avatar']),
            ),
            title: Text(friend['name']),
            subtitle: Text(friend['email']),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () async {
                await friendsController.removeFriend(friend['id']);
              },
            ),
          );
        },
      ),
    );
  }
}
```

4. Tạo bài viết mới:

```dart
class CreatePostWidget extends StatefulWidget {
  @override
  _CreatePostWidgetState createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeController = context.homeController;
    
    return Observer(
      builder: (_) => Column(
        children: [
          TextField(
            controller: _contentController,
            decoration: InputDecoration(
              labelText: 'Nội dung bài viết',
              errorText: homeController.hasError ? homeController.errorMessage : null,
            ),
            maxLines: 3,
          ),
          ElevatedButton(
            onPressed: homeController.isLoading ? null : () async {
              final success = await homeController.createPost(_contentController.text);
              if (success) {
                _contentController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đăng bài thành công!')),
                );
              }
            },
            child: homeController.isLoading 
              ? CircularProgressIndicator()
              : Text('Đăng bài'),
          ),
        ],
      ),
    );
  }
}
```

=== API METHODS TRONG CONTROLLERS ===

AuthController:
- login() - Đăng nhập
- register() - Đăng ký
- logout() - Đăng xuất
- forgotPassword() - Quên mật khẩu
- resetPassword() - Đặt lại mật khẩu

FriendsController:
- loadFriends() - Tải danh sách bạn bè
- removeFriend() - Xóa bạn bè
- loadFriendRequests() - Tải lời mời kết bạn
- acceptFriendRequest() - Chấp nhận lời mời
- rejectFriendRequest() - Từ chối lời mời
- sendFriendRequest() - Gửi lời mời
- loadFriendSuggestions() - Tải gợi ý kết bạn
- searchUsers() - Tìm kiếm người dùng

HomeController:
- loadPosts() - Tải danh sách bài viết
- createPost() - Tạo bài viết mới
- updatePost() - Cập nhật bài viết
- deletePost() - Xóa bài viết
- toggleLike() - Thích/bỏ thích bài viết
- sharePost() - Chia sẻ bài viết
- loadStories() - Tải stories
- addStory() - Thêm story mới

DashboardController:
- navigateToPage() - Chuyển trang
- loadNotifications() - Tải thông báo
- markNotificationAsRead() - Đánh dấu đã đọc
- markAllNotificationsAsRead() - Đánh dấu tất cả đã đọc
- deleteNotification() - Xóa thông báo

=== LƯU Ý ===

1. Tất cả các method API hiện tại đang sử dụng mock data
2. Cần thay thế bằng actual API calls trong production
3. Chạy build_runner để generate các file .g.dart
4. Sử dụng Observer widget để rebuild UI khi state thay đổi
5. Các computed values sẽ tự động update khi observable thay đổi

*/
