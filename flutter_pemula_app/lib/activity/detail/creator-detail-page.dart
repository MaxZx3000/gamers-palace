import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/data-class/detail/creator-detail.dart';
import 'package:flutter_pemula_app/data-class/header/platform-header.dart';
import 'package:flutter_pemula_app/data-class/header/position-header.dart';
import 'package:flutter_pemula_app/data-class/header/timeline-header.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';
import 'package:flutter_pemula_app/templates/app-bar.dart';
import 'package:flutter_pemula_app/templates/error-template.dart';
import 'package:flutter_pemula_app/templates/jumbotron-template.dart';
import 'package:flutter_pemula_app/templates/loading-template.dart';
import 'package:flutter_pemula_app/templates/simple-container-template.dart';
import 'package:flutter_pemula_app/templates/simple-text-desc-template.dart';
import 'package:flutter_pemula_app/templates/stylized-card-template.dart';
import 'package:flutter_pemula_app/templates/webview-template.dart';
import 'package:flutter_pemula_app/utils/data-fetcher.dart';

class CreatorDetailPage extends StatefulWidget {
  final int id;

  CreatorDetailPage({this.id});

  @override
  State<StatefulWidget> createState() => _CreatorDetailPageState(id: id);
}

class _CreatorDetailPageState extends State<CreatorDetailPage> {
  final int id;
  Future<CreatorDetail> futureCreatorDetail;

  _CreatorDetailPageState({this.id});

  Widget loadingTemplate() {
    return LoadingTemplate("Processing Creator Detail Data...");
  }

  Widget successResult(CreatorDetail creatorDetail) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              JumbotronTemplate(creatorDetail.name, creatorDetail.imageURL),
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
                      creatorDetail.rating,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Icon(
                        Icons.gamepad,
                        size: 15,
                        color: Colors.yellow,
                      ),
                    ),
                    Text(
                      creatorDetail.getGamesCountString(),
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
          StylizedCardTemplate(
            height: 200,
            title: "Biography",
            icon: Icon(
              Icons.book,
              color: Colors.white,
            ),
            contentWidget: WebviewTemplate(
              webViewContent: creatorDetail.description,
            ),
          ),
          StylizedCardTemplate(
            height: 110,
            title: "Platforms",
            icon: Icon(Icons.videogame_asset, color: Colors.white),
            contentWidget: ListView(
              padding: EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              children: List.generate(creatorDetail.platforms.length, (index) {
                PlatformHeader platformHeader = creatorDetail.platforms[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SimpleTextDescTemplate(
                    icon: Icon(
                      Icons.gamepad,
                      color: Colors.white,
                    ),
                    title: platformHeader.name,
                    miniDesc: platformHeader.getGamesCountString(),
                  ),
                );
              }),
            ),
          ),
          StylizedCardTemplate(
            title: "Positions",
            icon: Icon(
              Icons.work,
              color: Colors.white,
            ),
            height: 60,
            contentWidget: ListView(
              padding: EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              children: List.generate(creatorDetail.positions.length, (index) {
                PositionHeader positionHeader = creatorDetail.positions[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SimpleContainerTemplate(
                    containerPadding: EdgeInsets.all(10.0),
                    radius: BorderRadius.all(Radius.circular(10.0)),
                    customGradient: CustomGradient.getSecondaryGradient(),
                    bodyWidget: Text(
                      positionHeader.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
          ),
          StylizedCardTemplate(
            icon: Icon(
              Icons.access_time_rounded,
              color: Colors.white,
            ),
            title: "Timeline",
            height: 110,
            contentWidget: ListView(
              padding: EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              children: List.generate(creatorDetail.timeline.length, (index) {
                TimelineHeader timelineHeader = creatorDetail.timeline[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SimpleTextDescTemplate(
                    title: timelineHeader.getYearString(),
                    icon: Icon(
                      Icons.gamepad,
                      color: Colors.white,
                    ),
                    miniDesc: timelineHeader.getCountString()),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureCreatorDetail = DataFetcher.getCreatorDetailById(this.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: FutureBuilder(
        future: futureCreatorDetail,
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
      ),
    );
  }
}
