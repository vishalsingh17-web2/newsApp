import 'package:flutter/material.dart';
import 'package:news/business.dart';
import 'package:news/entertainment.dart';
import 'package:news/general.dart';
import 'package:news/health.dart';
import 'package:news/science.dart';
import 'package:news/sports.dart';
import 'package:news/technology.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _myTabs =  [
    Container(margin: const EdgeInsets.all(10), child: const Text("Top")),
    const Text("Business"),
    const Text("Entertainment"),
    const Text("Sports"),
    const Text("Health"),
    const Text("Technology"),
    const Text("Science"),
  ];
  final List<Widget> _children = const [
    General(),
    Business(),
    Entertainment(),
    Sports(),
    Health(),
    Technology(),
    Science()
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: _myTabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    title: const Text('News'),
                    centerTitle: true,
                    backgroundColor: Colors.black,
                    floating: true,
                    pinned: true,
                    snap: true,
                    primary: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10), // Creates border
                            color: Colors.greenAccent),
                        tabs: _myTabs),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: _children),
        ),
      ),
    );
  }
}
