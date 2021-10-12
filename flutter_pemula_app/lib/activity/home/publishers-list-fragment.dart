import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/home/internet-fragment.dart';
import 'package:flutter_pemula_app/data-class/header/publisher-header.dart';
import 'package:flutter_pemula_app/templates/error-template.dart';
import 'package:flutter_pemula_app/templates/loading-template.dart';
import 'package:flutter_pemula_app/templates/no-data-element.dart';
import 'package:flutter_pemula_app/templates/publisher-template.dart';
import 'package:flutter_pemula_app/utils/data-fetcher.dart';

class PublisherListFragment extends InternetFragment {
  State<PublisherListFragment> state;

  @override
  State<StatefulWidget> createState() {
    this.state = _PublisherListState(index: 1);
    return state;
  }

  @override
  void changeIndexPage(int index) {
    (state as _PublisherListState).refreshPage(index);
  }
}

class _PublisherListState extends State<PublisherListFragment> {
  int index;

  _PublisherListState({this.index});

  void refreshPage(int index) {
    setState(() {
      this.index = index;
    });
  }

  Column successResult(List<PublisherHeader> publishers) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 225),
            scrollDirection: Axis.vertical,
            itemCount: publishers.length,
            itemBuilder: (BuildContext ctx, index) {
              return PublisherTemplate(publishers[index]);
            },
          ),
        )
      ],
    );
  }

  Center loadingResult() {
    return Center(
      child: LoadingTemplate('Loading Publisher Data'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new FutureBuilder(
            future: DataFetcher.getPublishersFromJSON(index),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return loadingResult();
              }
              if (snapshot.hasData) {
                return successResult(snapshot.data);
              }
              if (snapshot.hasError) {
                return ErrorTemplate(
                  errorMessage: snapshot.error.toString(),
                );
              }
              return NoDataElement();
            }),
      ),
    );
  }
}
