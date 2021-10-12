import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/detail/creator-detail-page.dart';
import 'package:flutter_pemula_app/data-class/header/creator-header.dart';

class CreatorTemplate extends StatelessWidget {
  final CreatorHeader developerHeader;

  CreatorTemplate(this.developerHeader);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return CreatorDetailPage(id: developerHeader.id);
          }));
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      developerHeader.backgroundImageURL,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipOval(
                    child: Image.network(
                      developerHeader.imageURL,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          developerHeader.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 3),
                            child: Icon(
                              Icons.games,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            developerHeader.getGamesCountString(),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ]
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
