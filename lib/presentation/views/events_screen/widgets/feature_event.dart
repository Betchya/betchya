// import 'package:betchya/presentation/views/events_screen/widgets/event_details.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class FeatureEvent extends StatelessWidget {
//   const FeatureEvent({super.key, required this.event});
//   final Event event;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       padding: const EdgeInsets.only(top: 10, bottom: 10),
//       height: screenHeight * .375,
//       color: const Color(0xff2C1D57),
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
//               child: const Text(
//                 'Featured Event',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 height: screenHeight * .25,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(7),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: CachedNetworkImage(
//                       width: screenWidth,
//                       imageUrl: event.imageUrl ?? '',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 25,
//                 bottom: 20,
//                 child: Container(
//                   width: screenWidth * .2,
//                   height: screenHeight * .04,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF00B498),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextButton(
//                     child: const Text(
//                       'Details',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () => Navigator.push(
//                       context,
//                       MaterialPageRoute<EventDetails>(
//                         builder: (context) => EventDetails(event: event),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
