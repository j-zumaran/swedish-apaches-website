import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'api.dart';

enum MusicPlatform {
  Spotity, ITunes, AppleMusic, Amazon, GooglePlay, Deezer, YouTube
}

const MUSIC_ICONS = {
  MusicPlatform.Spotity: 'images/spotify.png',
  MusicPlatform.ITunes: 'images/itunes.png',
  MusicPlatform.AppleMusic: 'images/applemusic.png',
  MusicPlatform.Amazon: 'images/amazon.png',
  MusicPlatform.GooglePlay: 'images/googleplay.png',
  MusicPlatform.Deezer: 'images/deezer.png',
  MusicPlatform.YouTube: 'images/youtube.png',
};

//==================================================================================0

class MusicSection extends StatelessWidget {
  final List<SongTile> songTiles;

  const MusicSection(this.songTiles);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = screenWidth < 900? 280 :335;
    double fraction = screenWidth < 900? .6 :.3;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
        child: CarouselSlider(
          carouselController: CarouselController(),
          options: CarouselOptions(
              autoPlay: true,
              height: height,
              viewportFraction: fraction,
              enlargeCenterPage: true
          ),
          items: songTiles,
        ),
      ),
    );
  }

}

class SongTile extends StatefulWidget {
  final Song song;
  const SongTile(this.song);

  @override
  _SongTileState createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  OverlayEntry _overlayButtons;
  bool _isOverlayVisible = false;

  @override
  void initState() {
    _overlayButtons = OverlayEntry(
        builder: (context) => MouseRegion(
          child: SongButtonOverlay(
            widget.song.links.keys.map((platform) => SongTileButton(
              MUSIC_ICONS[platform], widget.song.links[platform])
            ).toList()
          ),
          onExit: (event) {
            if (_isOverlayVisible) {
              _overlayButtons.remove();
              _isOverlayVisible = false;
            }
          },
        )
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.square(300),
      child: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => MouseRegion(
              onEnter: (event) {
                if (!_isOverlayVisible) {
                  Overlay.of(context).insert(_overlayButtons);
                  _isOverlayVisible = true;
                }
              },
              child: Card(
                child: Container(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.song.image),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class SongButtonOverlay extends StatelessWidget {
  final List<Widget> buttons;

  const SongButtonOverlay(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Center(
          child: Wrap(
            children: buttons,
          ),
        )
    );
  }

}

class SongTileButton extends StatelessWidget {
  final String image;
  final String url;

  const SongTileButton(this.image, this.url);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.square(75),
      child: FlatButton(
        hoverColor: Colors.deepPurpleAccent[200].withOpacity(.3),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        onPressed: _launchURL,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0)
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
