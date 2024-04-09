import 'package:betchya/presentation/views/events_screen/widgets/event_details.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTabList extends StatelessWidget {
  const EventTabList({super.key,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ColoredBox(
      color: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 15),
        clipBehavior: Clip.none,
        itemCount: 3, //events.length,
        itemBuilder: (context, index) {
          return eventListItem(screenHeight, context, index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: screenWidth * .032,
          );
        },
      ),
    );
  }

  Widget eventListItem(double screenHeight, BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 0, 17, 17),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<EventDetails>(
              builder: (context) => const EventDetails(),
            ),
          );
        },
        child: SizedBox(
          height: screenHeight * .2,
          child: Card(
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 13, 30, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.MMMd().format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF00B498),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .005,
                        ),
                        const Text(
                          'events[index].name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .005,
                        ),
                        const Text(
                          'events[index].category',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF595959),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  // child: CachedNetworkImage(
                  //   imageUrl: '', // events[index].imageUrl ??
                  //       // 'https://via.placeholder.com/400x300.png?text=No+image',
                  //   progressIndicatorBuilder: (context, url, progress) =>
                  //       Center(
                  //     child: CircularProgressIndicator(
                  //       value: progress.progress,
                  //     ),
                  //   ),
                  //   errorWidget: (context, url, error) =>
                  //       const Icon(Icons.error),
                  //   height: screenHeight * .2,
                  //   fit: BoxFit.cover,
                  // ),
                  child: Card(color: Colors.purple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
