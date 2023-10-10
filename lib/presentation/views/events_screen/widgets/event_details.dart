import 'package:betchya/other_models/event.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          event.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(
              Icons.close,
              color: Color(0xFFA0A0A0),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: screenHeight * .25,
                width: screenWidth,
                child: CachedNetworkImage(
                  imageUrl: event.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Date:  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: DateFormat.yMd().format(event.date),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Time:  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: DateFormat.jm().format(event.date),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Ticket Price:  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: '\$${event.price}+'),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Age:  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: '${event.minAge} and over'),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * .05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00B498),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => {},
                child: const Text(
                  'Purchase Tickets',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            Expanded(child: Text(event.description)),
          ],
        ),
      ),
    );
  }
}
