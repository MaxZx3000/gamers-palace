import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pemula_app/data-class/detail/publisher-detail.dart';
import 'package:flutter_pemula_app/data-class/header/game-header.dart';
import 'package:flutter_pemula_app/templates/app-bar.dart';
import 'package:flutter_pemula_app/templates/error-template.dart';
import 'package:flutter_pemula_app/templates/game-template.dart';
import 'package:flutter_pemula_app/templates/jumbotron-template.dart';
import 'package:flutter_pemula_app/templates/loading-template.dart';
import 'package:flutter_pemula_app/templates/stylized-card-template.dart';
import 'package:flutter_pemula_app/templates/webview-template.dart';
import 'package:flutter_pemula_app/utils/data-fetcher.dart';

class PublisherDetailPage extends StatefulWidget {
  final int publisherId;

  PublisherDetailPage(this.publisherId);

  @override
  State<StatefulWidget> createState() => _PublisherDetailPageState(publisherId);
}

class _PublisherDetailPageState extends State<PublisherDetailPage> {
  Future<PublisherDetail> futurePublisherDetail;
  int publisherId;

  _PublisherDetailPageState(this.publisherId);

  @override
  void initState() {
    super.initState();
    futurePublisherDetail =
        DataFetcher.getPublisherDetailById(this.publisherId);
  }

  Center loadingResult() {
    return Center(
      child: LoadingTemplate('Loading Publisher Detail Data'),
    );
  }

  Widget successResult(PublisherDetail publisherDetail) {
    return SingleChildScrollView(
      child: Column(
        children: [
          JumbotronTemplate(
            publisherDetail.name, publisherDetail.imageBackgroundURL),
          StylizedCardTemplate(
            height: 300,
            title: 'Description',
            icon: Icon(
              Icons.description,
              color: Colors.white,
            ),
            contentWidget: WebviewTemplate(
              webViewContent: publisherDetail.description,
            )
          ),
          StylizedCardTemplate(
            height: 230,
            title: 'Owned Games',
            icon: Icon(
              Icons.games_sharp,
              color: Colors.white,
            ),
            contentWidget: GameListView(
              publisherId: publisherDetail.id,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: FutureBuilder(
        future: futurePublisherDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return successResult(snapshot.data);
          }
          if (snapshot.hasError) {
            return ErrorTemplate(
              errorMessage: snapshot.error.toString(),
            );
          }
          return loadingResult();
        }
      )
    );
  }
}

class GameListView extends StatefulWidget {
  final int publisherId;

  GameListView({this.publisherId});

  @override
  State<StatefulWidget> createState() =>
      _GameListViewState(publisherId: this.publisherId);
}

class _GameListViewState extends State<GameListView> {
  final int publisherId;
  Future<List<GameHeader>> futureGameHeaders;

  _GameListViewState({this.publisherId});

  Widget loadingTemplate() {
    return LoadingTemplate("Processing Games List...");
  }

  Widget listData(List<GameHeader> gameHeaders) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: List.generate(gameHeaders.length, (index) {
          return Container(
              width: 300,
              height: 30,
              child: GameTemplate(gameHeaders[index], "row")
          );
        }
      )
    );
  }

  Widget successTemplate(List<GameHeader> gameHeaders) {
    return listData(gameHeaders);
  }

  @override
  void initState() {
    super.initState();
    futureGameHeaders = DataFetcher.getGamesByPublisherId(this.publisherId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureGameHeaders,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return successTemplate(snapshot.data);
        }
        if (snapshot.hasError) {
          return ErrorTemplate(
            errorMessage: snapshot.error.toString(),
          );
        }
        return loadingTemplate();
      },
    );
  }
}
