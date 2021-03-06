import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:muze/routes/router.gr.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/sizes.dart';
import 'package:muze/utils/text_style.dart';
import 'package:muze/widgets/shimmerEffect.dart';

class MusicItem extends StatefulWidget {
  final int currentIndex;
  final String imageUrl;
  final String musicName;
  final String artist;
  final int id;

  MusicItem(
      {this.currentIndex, this.imageUrl, this.musicName, this.artist, this.id});

  @override
  _MusicItemState createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Router.navigator.pushNamed(Router.playerScreen,
            arguments: PlayerScreenArguments(
                id: widget.id,
                artist: widget.artist,
                imageUrl: widget.imageUrl,
                musicName: widget.musicName));
      },
      borderRadius: BorderRadius.circular(12.5),
      child: Padding(
        padding: EdgeInsets.only(
            right: UISize.width(7.5),
            top: UISize.width(7.5),
            left: widget.currentIndex == 0
                ? UISize.width(15)
                : UISize.width(7.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: UIColors.white,
                  borderRadius: BorderRadius.circular(12.5)),
              child: Hero(
                tag: widget.id.toString(),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  placeholder: (context, url) => Center(
                      child: ShimmerEffect(
                    height: UISize.width(100),
                    width: UISize.width(100),
                  )),
                  errorWidget: (context, url, error) => Center(
                      child: ShimmerEffect(
                    height: UISize.width(100),
                    width: UISize.width(100),
                  )),
                  imageBuilder: (context, imageProvider) => Container(
                    height: UISize.width(100),
                    width: UISize.width(100),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(UISize.width(12.5))),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: UISize.width(10)),
              child: Text(
                widget.musicName,
                style: StyleText.semiBoldMontserrat.copyWith(
                    fontSize: UISize.fontSize(10), color: UIColors.textDark),
              ),
            )
          ],
        ),
      ),
    );
  }
}
