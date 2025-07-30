import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class SlideToActionButton extends StatefulWidget {
  const SlideToActionButton({
    required this.onAccept,
    required this.onReject,
    super.key,
  });
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  State<SlideToActionButton> createState() => _SlideToCallActionState();
}

class _SlideToCallActionState extends State<SlideToActionButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0;
  final double _threshold = 100;

  late AnimationController _arrowController;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _arrowAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  Future<void> _handleEnd() async {
    if (_dragPosition >= _threshold) {
      HapticFeedback.mediumImpact();
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate(duration: 100);
      }
      widget.onAccept(); // Slide Right
    } else if (_dragPosition <= -_threshold) {
      HapticFeedback.mediumImpact();
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate(duration: 100);
      }
      widget.onReject(); // Slide Left
    }

    setState(() {
      _dragPosition = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.serfeceBG,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.serfeceBG),
        ),
        height: 70,
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [_leftArrow(), _rightArrow(), _knob()],
          ),
        ),
      ),
    );
  }

  GestureDetector _knob() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dragPosition += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (_) => _handleEnd(),
      child: Transform.translate(
        offset: Offset(_dragPosition.clamp(-110.0, 110.0), 0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryButton,
            border: BoxBorder.all(color: AppColors.success, width: 2),
            boxShadow: [
              if (_dragPosition >= _threshold)
                const BoxShadow(color: AppColors.success, blurRadius: 10),
              if (_dragPosition <= -_threshold)
                const BoxShadow(color: AppColors.error, blurRadius: 10),
            ],
          ),
          child: const Icon(Icons.phone, color: AppColors.serfeceBG, size: 25),
        ),
      ),
    );
  }

  Positioned _rightArrow() {
    return Positioned(
      right: 30,
      child: AnimatedBuilder(
        animation: _arrowAnimation,
        builder:
            (_, __) => Transform.translate(
              offset: Offset(-_arrowAnimation.value, 0),
              child: const Icon(
                Icons.double_arrow,
                color: AppColors.primaryButton,
              ),
            ),
      ),
    );
  }

  Positioned _leftArrow() {
    return Positioned(
      left: 30,
      child: AnimatedBuilder(
        animation: _arrowAnimation,
        builder:
            (_, __) => Transform.rotate(
              angle: 3.14,
              child: Transform.translate(
                offset: Offset(-_arrowAnimation.value, 0),
                child: const Icon(Icons.double_arrow, color: Colors.redAccent),
              ),
            ),
      ),
    );
  }
}
