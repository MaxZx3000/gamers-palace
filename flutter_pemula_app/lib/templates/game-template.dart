import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/detail/game-detail-page.dart';
import 'package:flutter_pemula_app/data-class/header/game-header.dart';
import 'package:flutter_pemula_app/globals/colors.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class GameTemplate extends StatelessWidget {
  final GameHeader gameHeader;
  final String widgetWrapperType;

  GameTemplate(this.gameHeader, this.widgetWrapperType);

  Widget _getTemplate(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return GameDetailPage(gameHeader.id);
        }));
      },
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Stack(alignment: AlignmentDirectional.topEnd, children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    gameHeader.imageBackgroundURL,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(15.0)),
                  child: Container(
                    color: Color(CUSTOM_COLORS["darkViolet"]),
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      width: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20.0,
                            ),
                          ),
                          Text(
                            gameHeader.getRatingString(),
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ])),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                decoration:
                    BoxDecoration(gradient: CustomGradient.getCommonGradient()),
                child: Text(
                  gameHeader.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(7),
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: _getTemplate(context));
  }
}
