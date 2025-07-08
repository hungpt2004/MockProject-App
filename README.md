
## Cấu trúc dự án

```bash
lib/
├── core/                      # Mã dùng chung
│   ├── constants/             # Giá trị constant
│   │       ├── data/          # Mock data
│   │       ├── fontsize/      # Cấu hình các fontsize
│   │       ├── gen/           # Đường dẫn các ảnh
│   │       ├── storage/       # Các key lưu trữ shared-preferences
│   │       ├── routes/        # Chứa các tên route
│   ├── api_response/          # Định nghĩa dữ liệu trả về của API (list/object)
│   └── network/               # Cấu hình dio interceptor
│
├── data/                      # Giao tiếp dữ liệu: API, local DB, models
│   ├── models/
│   └── services/
│
├── domain/                    # Nghiệp vụ, không phụ thuộc Flutter
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/              # UI + MobX store (viewmodel)
│   ├── pages/
│   │       ├── screens/       # UI (StatelessWidget/Observer)
│   │       ├── controller/    # Xử lý Mobx
│   │       ├── service/       # Tương tác với API
│   │       ├── widgets/       # Các widget con (nếu có)
│   │       ├── routes/        # Chứa các tên route
│   ├── shared/
│   └── themes/
│
└── main.dart
```

## Entity & Model 
- Mọi thao tác với logic nghiệp vụ, usecase, store,.. -> sử dụng Entity
- Mọi thao tác với API, JSON... bạn dùng UserModel và ánh xạ qua lại.

## Cách sử dụng go_router trong dự án
### Bước 1: Config đường dẫn của page trong AppRouter
```bash
routes: [
      GoRoute(
        path: AuthRoute.signInScreen,
        name: 'login',
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const SignInScreen(),
          SlideTransitionType.slideRight,
        ),
      ),
      // Thêm route vào đây
    ];
```

### Bước 2: Tạo hàm điều hướng nhanh trong AppNavigator để tái sử dụng
- Viết trong app_navigator
```bash
  void toLogin() {
    GoRouter.of(_context).go('/login');
  }
```

### Bước 3: Cách gọi và sử dụng hàm điều hướng
- Kiểm tra xem widget được gán trạng thái chưa ?
- Kiểm tra biến mounted
```bash
if (mounted) {
    // Sử dụng GoRouter thay vì Navigator
    context.go('/home');
}
```

### Cách sử dụng hàm điều hướng có truyền tham số

#### Sử dụng điều hướng có tham số 

```bash
  AppNavigator.goNamed(
    context,
    'user',
    pathParameters: {
      'userId': '123',
    }
  );
  URL: /user/123 -> pathParameter

  AppNavigator.goNamed(
  context,
  'post-detail',
  pathParameters: {'postId': '789'},      // Bắt buộc
  queryParameters: {                      // Tùy chọn
    'comment': 'true',
    'share': 'false',
    'tab': 'comments'
    }
  );
  URL: /post/789?comment=true&share=false&tab=comments
```


## MOBX NOTE
### Lưu ý khi sử dụng
- reaction
- autorun
- when

