import 'package:cassette/navigation/PageMoveUtil.dart';
import 'package:cassette/navigation/Route.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.push(
            context,
            nextFadeInOutScreen(RoutingScreen.Intro.route),
          );
        });
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: getColorScheme(context).bg,
      body: Stack(
        children: [
          Image.asset("assets/imgs/image_splash.png", fit: BoxFit.cover),
          Center(
            child: Image.asset(
              "assets/imgs/image_logo_text.png",
              width: 144,
              height: 36,
            ),
          )
        ],
      ),
    );
  }
}
//
//
// class SplashScreen extends HookConsumerWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ScrollableSheetExample();
//   }
// }
//
// class ScrollableSheetExample extends HookWidget{
//   double _minSheetHeight = 0.6;
//   double _maxSheetHeight = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final _minSheetHeight = useState(0.6);
//     final _maxSheetHeight = useState(1.0);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scrollable Sheet Example'),
//       ),
//       body: NotificationListener<DraggableScrollableNotification>(
//         onNotification: (notification) {
//           if (notification.extent == _maxSheetHeight.value) {
//             _minSheetHeight.value = 0.6;
//             _maxSheetHeight.value = 1.0;
//           } else if (notification.extent >= 0.6) {
//             _minSheetHeight.value = 0.6;
//             _maxSheetHeight.value = 1.0;
//           } else if (notification.extent >= _minSheetHeight.value) {
//             _minSheetHeight.value = notification.extent;
//             _maxSheetHeight.value = 1.0;
//           }
//           return true;
//         },
//         child: Stack(
//           children: [
//             // Main content
//             Center(
//               child:
//                   Container(width: 300, height: 300, color: Colors.red, child: Text('Your main content goes here')),
//             ),
//             // Scrollable sheet
//             DraggableScrollableSheet(
//               initialChildSize: _minSheetHeight.value,
//               minChildSize: _minSheetHeight.value,
//               maxChildSize: _maxSheetHeight.value,
//               builder: (context, controller) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: ListView.builder(
//                     controller: controller,
//                     itemCount: 50, // Replace with your actual item count
//                     itemBuilder: (context, index) {
//                       return Container(
//                         color: Colors.blue,
//                         child: ListTile(
//                           title: Text('Item $index'),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:cassette/navigation/PageMoveUtil.dart';
// import 'package:cassette/navigation/Route.dart';
// import 'package:cassette/presentation/ui/colors.dart';
// import 'package:cassette/presentation/utils/Common.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
