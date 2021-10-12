import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/data-class/detail/game-detail.dart';
import 'package:flutter_pemula_app/data-class/header/developer-header.dart';
import 'package:flutter_pemula_app/data-class/header/publisher-header.dart';
import 'package:flutter_pemula_app/globals/colors.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';
import 'package:flutter_pemula_app/icons/trophy.dart';
import 'package:flutter_pemula_app/templates/app-bar.dart';
import 'package:flutter_pemula_app/templates/error-template.dart';
import 'package:flutter_pemula_app/templates/jumbotron-template.dart';
import 'package:flutter_pemula_app/templates/loading-template.dart';
import 'package:flutter_pemula_app/templates/publisher-template.dart';
import 'package:flutter_pemula_app/templates/simple-text-desc-template.dart';
import 'package:flutter_pemula_app/templates/stylized-card-template.dart';
import 'package:flutter_pemula_app/templates/webview-template.dart';
import 'package:flutter_pemula_app/utils/data-fetcher.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;

  GameDetailPage(this.gameId);

  @override
  State<StatefulWidget> createState() => _GameDetailPageState(this.gameId);
}

class _GameDetailPageState extends State<GameDetailPage> {
  final int gameId;
  Future<GameDetail> futureGameDetail;

  _GameDetailPageState(this.gameId);

  Widget loadingTemplate() {
    return LoadingTemplate("Loading Game Detail...");
  }

  Widget getElementInformationWidget(Icon icon, String caption) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: CustomGradient.getSecondaryGradient(),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: icon,
            ),
          ),
        ),
        Text(caption, style: TextStyle(color: Colors.white))
      ],
    );
  }

  Widget getMainInformationWidget(GameDetail gameDetail) {
    final List<Widget> gridViewWidgets = [
      getElementInformationWidget(
          Icon(
            Icons.star,
            color: Colors.white,
            size: 25,
          ),
          gameDetail.getRatingString()),
      getElementInformationWidget(
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 25,
          ),
          gameDetail.getReleasedDateString()),
      getElementInformationWidget(
          Icon(
            Icons.timelapse,
            color: Colors.white,
            size: 25,
          ),
          gameDetail.getPlaytimeDurationString()),
      getElementInformationWidget(
          Icon(
            Icons.thumb_up,
            color: Colors.white,
            size: 25,
          ),
          gameDetail.getAchievementsCountString()),
      getElementInformationWidget(
          Icon(
            Icons.movie_filter_rounded,
            color: Colors.white,
            size: 25,
          ),
          gameDetail.getNumberOfMovies()),
      getElementInformationWidget(
          Icon(
            Icons.child_care,
            color: Colors.white,
            size: 25,
          ),
          gameDetail.getESRBRating())
    ];
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
      child: Card(
        borderOnForeground: true,
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            gradient: CustomGradient.getCoolBlackGradient(),
            border:
                Border.all(color: Color(CUSTOM_COLORS["darkRed"]), width: 4)),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 130,
              childAspectRatio: 0.85
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: gridViewWidgets.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, index) {
              return gridViewWidgets[index];
            }
          ),
        ),
      ),
    );
  }

  Widget successResult(GameDetail gameDetail) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              JumbotronTemplate(gameDetail.name, gameDetail.imageBackgroundURL),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: CustomGradient.getCommonGradient()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                    ),
                    Text(
                      gameDetail.getRatingString(),
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          getMainInformationWidget(gameDetail),
          StylizedCardTemplate(
            height: 250,
            title: "Description",
            icon: Icon(Icons.gamepad, color: Colors.white),
            contentWidget: WebviewTemplate(
              webViewContent: gameDetail.description,
            ),
          ),
          StylizedCardTemplate(
            height: 100,
            title: "Developers",
            icon: Icon(Icons.people, color: Colors.white),
            contentWidget: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(gameDetail.developers.length, (index) {
                  DeveloperHeader developerHeader =
                      gameDetail.developers[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SimpleTextDescTemplate(
                          title: developerHeader.name,
                          icon: Icon(
                            Icons.videogame_asset_outlined,
                            color: Colors.white,
                          ),
                          miniDesc: developerHeader.getGamesCountString()));
                })),
          ),
          StylizedCardTemplate(
              height: 180,
              icon: Icon(
                Icons.business,
                color: Colors.white,
              ),
              title: "Publishers",
              contentWidget: ListView(
                padding: EdgeInsets.all(10.0),
                scrollDirection: Axis.horizontal,
                children: List.generate(gameDetail.publishers.length, (index) {
                  PublisherHeader publisher = gameDetail.publishers[index];
                  return SizedBox(
                    height: 200,
                    width: 200,
                    child: PublisherTemplate(publisher),
                  );
                }),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureGameDetail = DataFetcher.getGameDetailById(this.gameId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: FutureBuilder(
          future: futureGameDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return successResult(snapshot.data);
            }
            if (snapshot.hasError) {
              return ErrorTemplate(
                errorMessage: snapshot.error.toString(),
              );
            }
            return loadingTemplate();
          },
        ));
  }
}
