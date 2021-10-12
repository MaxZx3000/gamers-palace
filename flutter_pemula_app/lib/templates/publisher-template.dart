import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/activity/detail/publisher-detail-page.dart';
import 'package:flutter_pemula_app/data-class/header/publisher-header.dart';
import 'package:flutter_pemula_app/globals/colors.dart';

class PublisherTemplate extends StatelessWidget {
  final PublisherHeader publisher;

  PublisherTemplate(this.publisher);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(7),
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return PublisherDetailPage(this.publisher.id);
            }));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  publisher.imageBackgroundURL,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2),
                        child: Text(
                          this.publisher.name,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2, left: 10, right: 10),
                            child: Icon(
                              Icons.gamepad_rounded,
                              size: 18,
                              color: Color(CUSTOM_COLORS["darkRed"]),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            publisher.gamesCount.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
