import 'package:betchya/logic/events/events_bloc.dart';
import 'package:betchya/other_models/event.dart';
import 'package:betchya/presentation/views/events_screen/widgets/event_tab_list.dart';
import 'package:betchya/presentation/views/events_screen/widgets/feature_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsBody extends StatelessWidget {
  const EventsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsBloc, EventsState>(
      listener: (context, state) {
        if (state is EventsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is EventsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is EventsError) {
          return const Text('Error');
        } else if (state is EventsLoaded) {
          return _buildSliver(events: state.events);
        } else {
          return Text(state.toString());
        }
      },
    );
  }

  List<Widget> _buildScreens({required List<Event> events}) {
    final comedies =
        events.where((i) => i.category.contains('Comedy')).toList();
    final concerts = events.where((i) => i.category.contains('Music')).toList();
    final eventSet = Set.from(events);
    final exclusionSet = Set.from(comedies + concerts);
    final List<Event> others = List.from(eventSet.difference(exclusionSet));

    return [
      EventTabList(events: events),
      EventTabList(events: comedies),
      EventTabList(events: concerts),
      EventTabList(events: others),
    ];
  }

  Widget _buildSliver({required List<Event> events}) {
    final screens = _buildScreens(events: events);
    final featureEvent = events.firstWhere((i) => i.featured);

    return DefaultTabController(
        length: screens.length,
        initialIndex: 0,
        child: Scaffold(
            body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      forceElevated: innerBoxIsScrolled,
                      backgroundColor: const Color(0xff2C1D57),
                      toolbarHeight: MediaQuery.of(context).size.height * .375,
                      title: FeatureEvent(
                        event: featureEvent,
                      ),
                      automaticallyImplyLeading: false,
                      floating: true,
                      pinned: true,
                      snap: false,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(51),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(children: <Widget>[
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xffA0A0A0),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: _tabBar(eventTotal: events.length)),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: 5,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(children: screens))));
  }

  TabBar _tabBar({required int eventTotal}) {
    return TabBar(
      isScrollable: false,
      labelPadding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
      unselectedLabelStyle:
          const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      unselectedLabelColor: const Color(0xffA0A0A0),
      labelColor: const Color(0xff00B498),
      indicatorColor: const Color(0xff00B498),
      tabs: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 17, 0, 7),
          child: Text(
            'All ($eventTotal)',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 17, 0, 7),
          child: Text(
            'Comedy',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 17, 0, 7),
          child: Text('Concerts',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 17, 0, 7),
          child: Text('Other',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
