// import 'package:flutter/material.dart';
//
// class Tester extends StatefulWidget {
//   Tester({super.key});
//
//   @override
//   State<Tester> createState() => _TesterState();
// }
//
// class _TesterState extends State<Tester> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => getTextWidgetWidth());
//   }
//
//   final textWidgetKey = GlobalKey();
//
//   Size? size = Size(0, 0);
//
//   getTextWidgetWidth() {
//     final RenderBox renderBox =
//         textWidgetKey.currentContext!.findRenderObject() as RenderBox;
//     size = renderBox.size;
//     print(size);
//     setState(() {});
//   }
//
//   var controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: controller,
//               onChanged: (v){
//
//                 setState(() {
//                 });
//               },
//             ),
//             Container(
//                 color: Colors.black54,
//                 child: Text(key: textWidgetKey, "TEST: "+controller.text)),
//             SizedBox(height: 10,),
//             Container(
//               width: (widthh == null) ? size!.width : widthh,
//               height: 22,
//               color: Colors.red,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
