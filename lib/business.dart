import 'package:flutter/material.dart';

import 'API/api_manager.dart';
import 'API/bloc.dart';


class Business extends StatefulWidget {
  const Business({ Key? key }) : super(key: key);

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> with AutomaticKeepAliveClientMixin<Business> {
  final news = NewsBloc();

  @override
  void initState() {
    news.eventSink.add(NewsAction.Business);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: StreamBuilder<List<Articles>>(
        stream: news.newsStream,
        builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return Container(
                  margin: const EdgeInsets.only(top: 18),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      "${data.title}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: NetworkImage("${data.urlToImage}"),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: Text(data.description.toString()),
                        )
                      ],
                    ),
                    onTap: () {
                      print("DDD");
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}