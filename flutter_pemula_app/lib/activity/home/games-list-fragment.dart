import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/home/internet-fragment.dart';
import 'package:flutter_pemula_app/data-class/header/game-header.dart';
import 'package:flutter_pemula_app/templates/error-template.dart';
import 'package:flutter_pemula_app/templates/game-template.dart';
import 'package:flutter_pemula_app/templates/loading-template.dart';
import 'package:flutter_pemula_app/templates/no-data-element.dart';
import 'package:flutter_pemula_app/utils/data-fetcher.dart';

class GamesListFragment extends InternetFragment {
  State<GamesListFragment> state;

  @override
  State<StatefulWidget> createState() {
    state = _GamesListState(index: 1);
    return state;
  }

  @override
  void changeIndexPage(int index) {
    (state as _GamesListState).refreshPage(index);
  }
}

class _GamesListState extends State<GamesListFragment> {
  Future<List<GameHeader>> futureGameHeaders;
  int index;

  _GamesListState({this.index});

  void refreshPage(int index) {
    setState(() {
      this.index = index;
    });
  }

  Column successResult(List<GameHeader> gameHeaders) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400, childAspectRatio: 1.4),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: gameHeaders.length,
            itemBuilder: (BuildContext ctx, index) {
              return GameTemplate(gameHeaders[index], "row");
            }
          ),
        ),
      ]
    );
  }

  Center loadingResult() {
    return Center(
      child: LoadingTemplate('Loading Game Data'),
    );
  }

  @override
  Widget build(BuildContext context) {
    futureGameHeaders = DataFetcher.getGamesFromJSON(index);
    return new FutureBuilder(
      future: futureGameHeaders,
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
      }
    );
  }
}
