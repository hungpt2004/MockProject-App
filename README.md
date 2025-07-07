lib/
├── core/                      # Mã dùng chung
│   ├── constants/
│   ├── utils/
│   └── extensions/
│
├── data/                      # Giao tiếp dữ liệu: API, local DB, models
│   ├── datasources/
│   │   ├── remote/
│   │   └── local/
│   ├── models/
│   ├── repositories_impl/
│   └── services/
│
├── domain/                    # Nghiệp vụ, không phụ thuộc Flutter
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/              # UI + MobX store (viewmodel)
│   ├── pages/
│   │       ├── view/          # UI (StatelessWidget/Observer)
│   │       ├── store/         # MobX store = ViewModel
│   │       ├── widgets/       # Các widget con (nếu có)
│   │       └── binding.dart   # (tuỳ dùng get_it, modular,...)
│   ├── shared/
│   └── themes/
│
├── injection/                 # DI (get_it, modular,...)
└── main.dart

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

## MOBX NOTE
### Lưu ý khi sử dụng
- reaction
- autorun
- when

