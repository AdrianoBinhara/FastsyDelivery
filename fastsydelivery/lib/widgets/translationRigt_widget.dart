import 'package:flutter/cupertino.dart';

class TranslationRightWidget extends StatefulWidget {
  final Widget child;

  const TranslationRightWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<TranslationRightWidget> createState() => _TranslationRightWidgetState();
}

class _TranslationRightWidgetState extends State<TranslationRightWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> translationAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    translationAnimation = Tween(
      begin: -87.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(translationAnimation.value, 0.0),
          child: widget.child,
        );
      },
    );
  }
}
