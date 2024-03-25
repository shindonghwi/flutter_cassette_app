import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScrollSheetContainer extends HookConsumerWidget {
  final PreferredSizeWidget appbar;
  final Widget fixedWidget;

  const ScrollSheetContainer({
    super.key,
    required this.appbar,
    required this.fixedWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minSheetHeight = useState(0.6);
    final maxSheetHeight = useState(1.0);

    return Scaffold(
      appBar: appbar,
      resizeToAvoidBottomInset: false,
      backgroundColor: getColorScheme(context).bg,
      body: NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          if (notification.extent == maxSheetHeight.value) {
            minSheetHeight.value = 0.6;
            maxSheetHeight.value = 1.0;
          } else if (notification.extent >= 0.6) {
            minSheetHeight.value = 0.6;
            maxSheetHeight.value = 1.0;
          } else if (notification.extent >= minSheetHeight.value) {
            minSheetHeight.value = notification.extent;
            maxSheetHeight.value = 1.0;
          }
          return true;
        },
        child: Stack(
          children: [
            fixedWidget,
            DraggableScrollableSheet(
              initialChildSize: minSheetHeight.value,
              minChildSize: minSheetHeight.value,
              maxChildSize: maxSheetHeight.value,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: CustomPaint(
                    painter: CustomViewPainter(),
                    size: Size(double.infinity, 100.0), // Adjust the height as needed
                  ),
                  // child: Container(
                  //   color: Colors.blue,
                  //   child: Text("Asdasd"),
                  // ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomViewPainter extends CustomPainter {
  final startY = 34.0;

  @override
  void paint(Canvas canvas, Size size) {
    drawTopLine(canvas, size);
    drawTopCircle(canvas, size);
  }

  void drawTopLine(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = const Color(0xFFE6DECF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    List<Offset> topLinePoints = [
      Offset(0, startY),
      Offset(size.width * 0.1, 0),
      Offset(size.width * 0.9, 0),
      Offset(size.width, startY),
    ];

    Path path = Path()..moveTo(topLinePoints[0].dx, topLinePoints[0].dy);
    for (int i = 1; i < topLinePoints.length; i++) {
      path.lineTo(topLinePoints[i].dx, topLinePoints[i].dy);
    }
    canvas.drawPath(path, linePaint);
  }

  void drawTopCircle(Canvas canvas, Size size) {
    const bigCircle = 50;
    const smallCircle = 26;

    final center = Offset(size.width / 2, bigCircle / 2);

    Paint paintBigBorder = Paint()
      ..color = const Color(0xFFE0E0E0).withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, bigCircle / 2, paintBigBorder);

    Paint paintBigInner = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);
    canvas.drawCircle(center, bigCircle / 2, paintBigInner);

    Paint paintSmallBorder = Paint()
      ..color = const Color(0xFFC9C1B5).withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, smallCircle / 2, paintSmallBorder);

    Paint paintSmallInner = Paint()
      ..color = const Color(0xFFE6DECF)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, smallCircle / 2, paintSmallInner);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
