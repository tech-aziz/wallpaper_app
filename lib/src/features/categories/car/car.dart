// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:galleryapp/src/constants/colors.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../controller/favorite_controller.dart';
// import '../../../models/data.dart';
// import '../../imageview_screen.dart';
//
// class CarScreen extends StatefulWidget {
//   const CarScreen({super.key});
//
//   @override
//   State<CarScreen> createState() => _CarScreenState();
// }
//
// class _CarScreenState extends State<CarScreen> {
//   final FavoriteController favoriteController = Get.put(FavoriteController());
//
//   // final NavbarController navbarController = Get.put(NavbarController());
//
//   @override
//   Widget build(BuildContext context) {
//     FocusManager.instance.primaryFocus?.unfocus();
//
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Car',
//                     style: GoogleFonts.lato(
//                       textStyle: Theme.of(context).textTheme.displayLarge,
//                       fontSize: 50,
//                       fontWeight: FontWeight.w800,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '36 Wallpaper Available',
//                     style: GoogleFonts.lato(
//                       textStyle: Theme.of(context).textTheme.displayLarge,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w800,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                 child: MasonryGridView.builder(
//                   shrinkWrap: true,
//                   primary: false,
//                   itemCount: ImageDataResource.imageList.length,
//                   gridDelegate:
//                   const SliverSimpleGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2),
//                   itemBuilder: (context, index) {
//                     final data = ImageDataResource.imageList[index];
//                     return InkWell(
//                       onDoubleTap: () {
//                         print('Its clicked double');
//                         favoriteController.favoriteIncrement();
//                       },
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               ImageViewScreen(image: data.image.toString()),
//                         ));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: SizedBox(
//                             child: Image.asset(
//                               data.image.toString(),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
