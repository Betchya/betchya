// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'event.name',
          style: TextStyle(
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
                // child: CachedNetworkImage(
                //   imageUrl: '',
                //   fit: BoxFit.cover,
                // ),
                child: const Card(),
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
                        // TODO: update date
                        TextSpan(
                          text: DateFormat.yMd().format(DateTime.now()),
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
                        // TODO: update date
                        TextSpan(
                          text: DateFormat.jm().format(DateTime.now()),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                  const Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ticket Price:  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: '\$${0}+'),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 12,
                  ),
                  const Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Age:  ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: '${0} and over'),
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
            const Expanded(child: Text('placeholder')),
          ],
        ),
      ),
    );
  }
}
