// Nhận một hàm load dữ liệu delay
// Nhận một child để render trong layout
import 'package:flutter/material.dart';
import '../../../../shared/widgets/loading/animation_loading.dart';

class LoadingPageLayout extends StatefulWidget {
  const LoadingPageLayout({super.key, required this.loadFuture, required this.child});

  final Future<void> Function() loadFuture;
  final Widget child;

  @override
  State<LoadingPageLayout> createState() => _LoadingPageLayoutState();
}

class _LoadingPageLayoutState extends State<LoadingPageLayout> {

  // Khởi tạo giá trị bool loading
  bool _isLoading = true;

  @override
  void initState() {
    loadDataDelay();
    super.initState();
  }

  // Hàm load dữ liệu từ widget được truyền vào
  Future<void> loadDataDelay() async {
    setState(() {
      _isLoading = true;
    });
    await widget.loadFuture();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isLoading) 
        Positioned.fill(
          child: Center(
            child: ColoredBox(
              color: Colors.black45,
              child: AnimationLoadingWidget(),
            ),
          ),
        )
      ],
    );
  }
}