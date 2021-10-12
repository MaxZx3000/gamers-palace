import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/home/internet-fragment.dart';
import 'package:flutter_pemula_app/data-class/header/creator-header.dart';
import 'package:flutter_pemula_app/templates/creator-template.dart';
import 'package:flutter_pemula_app/templates/error-template.dart';
import 'package:flutter_pemula_app/templates/loading-template.dart';
import 'package:flutter_pemula_app/templates/no-data-element.dart';
import 'package:flutter_pemula_app/utils/data-fetcher.dart';

class CreatorListFragment extends InternetFragment {
  State<CreatorListFragment> state;

  @override
  State<StatefulWidget> createState() {
    state = _CreatorListFragment(index: 1);
    return state;
  }

  @override
  void changeIndexPage(int index) {
    (state as _CreatorListFragment).refreshPage(index);
  }
}

class _CreatorListFragment extends State<CreatorListFragment> {
  Future<List<CreatorHeader>> futureCreators;
  int index;

  _CreatorListFragment({this.index});

  void refreshPage(int index) {
    setState(() {
      this.index = index;
    });
  }

  Column successResult(List<CreatorHeader> creators) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
              ),
              scrollDirection: Axis.vertical,
              itemCount: creators.length,
              itemBuilder: (BuildContext ctx, index) {
                return CreatorTemplate(creators[index]);
              })),
      ],
    );
  }

  Center loadingResult() {
    return Center(
      child: LoadingTemplate('Loading Creators Data'),
    );
  }

  @override
  Widget build(BuildContext context) {
    futureCreators = DataFetcher.getCreatorsFromJSON(index);
    return Scaffold(
      body: Center(
        child: new FutureBuilder(
            future: futureCreators,
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
