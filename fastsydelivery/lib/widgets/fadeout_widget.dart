import 'package:flutter/cupertino.dart';

class FadeOutWidget extends StatefulWidget {
  final Widget child;

  FadeOutWidget({required this.child});

  @override
  State<FadeOutWidget> createState() => _FadeOutWidgetState();
}

class _FadeOutWidgetState extends State<FadeOutWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
