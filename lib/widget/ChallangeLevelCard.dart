import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:pain/widget/ShimmerLoading.dart';

class ChallangeLevelCard extends StatelessWidget {
  double height;
  double width;
  String level;
  String descLevel;
  String imageUrl;
  int finish;

  ChallangeLevelCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.level,
      required this.descLevel,
      required this.finish,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: height,
              width: width,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "image_not_found",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              },
              progressIndicatorBuilder: (context, url, progress) {
                return ShimmerLoading(isLoading: true,);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Finished ",
                        style: TextStyle(
                          fontFamily: "RubikReguler",
                          fontSize: 17,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                finish == 0 ? "$finish Time" : "$finish Times",
                            style: TextStyle(
                              fontFamily: "RubikMedium",
                              fontSize: 17,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          )
                        ]),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            level,
                            style: TextStyle(
                              fontFamily: "RubikSemiBold",
                              fontSize: 25,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          descLevel,
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'RubikRegular',
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
