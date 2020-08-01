import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swedish_apaches/api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swedish_apaches/widgets.dart';

import 'music.dart';


class LandingSection extends StatelessWidget {
  const LandingSection(this.apacheInfo);
  final ApacheData apacheInfo;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.center,
          child: Column(
            children: [
              const LogoImage(),
              Container(height: 250),
              SizedBox(
                width: screenWidth,
                child: Text(apacheInfo.subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.homemadeApple(fontSize: 35),
                ),
              ),
            ],
          ),
        ),
        const AnimatedPageChange(),
        AnimatedTitle(apacheInfo.title),
        ReleaseVideo(apacheInfo.releaseSong.videoId),
        const LatestReleaseText(),
        const SplashScreen(),
        MusicButtons(apacheInfo.musicPlatformLinks.keys
          .map((platform) => SongTileButton(
            MUSIC_ICONS[platform], apacheInfo.musicPlatformLinks[platform])
          ).toList()
        ),
        //const LogoAnimation(),
      ],
    );
  }

}

//=============================================================================

const ANIMATION_DURATION = Duration(milliseconds: 250);

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  static const DELAY = Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(DELAY),
      builder: (context, snapshot) {
        double opacity;
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            opacity = 0;
            break;
          default:
            opacity = 1;
        }
        return AnimatedOpacity(
          duration: ANIMATION_DURATION,
          opacity: opacity,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: SpinKitSpinningCircle(
              itemBuilder: (context, index) => const LogoImage(),
            ),
          ),
        );
      },
    );
  }
}

//========================================================================0

class AnimatedPageChange extends StatelessWidget {
  const AnimatedPageChange();

  static final delay = Duration(milliseconds: SplashScreen.DELAY.inMilliseconds + 1500);
  static const DURATION = Duration(milliseconds: 500);

  static final elementDelay = Duration(
      milliseconds: delay.inMilliseconds + DURATION.inMilliseconds
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        double width;
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            width = MediaQuery.of(context).size.width;
            break;
          default:
            width = 0;
        }
        return Positioned(
          top: 0,
          left: 0,
          child: AnimatedContainer(
            color: Colors.black,
            width: width,
            height: MediaQuery.of(context).size.height + 50,
            duration: DURATION,
            curve: Curves.easeInOutExpo,
          ),
        );
      },
    );
  }

}

//==========================================================================

class AnimatedTitle extends StatelessWidget {
  const AnimatedTitle(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(AnimatedPageChange.elementDelay),
      builder: (context, snapshot) {
        double topPadding;
        double width = MediaQuery.of(context).size.width;
        Color textColor;
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            topPadding = 0;
            textColor = Colors.white;
            break;
          default:
            topPadding = 180;
            width = width - 100;
            textColor = Colors.black;
        }
        return AnimatedPositioned(
          top: topPadding,
          duration: ANIMATION_DURATION,
          child: AnimatedContainer(
            duration: ANIMATION_DURATION,
            width: width,
            child: AnimatedDefaultTextStyle(
              duration: ANIMATION_DURATION,
              child: Text(title,
                textAlign: TextAlign.center,
              ),
              style: TextStyle(
                color: textColor,
                fontSize: calculateFontSize(width),
                letterSpacing: 8,
                fontFamily: 'NightMachine',
                shadows: [
                  const Shadow(
                      color: Colors.brown,
                      blurRadius: 3,
                      offset: const Offset(8, 4)
                  )
                ]
              ),
            ),
          ),
        );
      },
    );
  }

  double calculateFontSize(double width) {
      if(width < 600)  return 48;
      else if(width < 950)  return 58;
      else if(width < 1200)  return 68;
      else return 100;
  }
}

//===============================================================================0

class ReleaseVideo extends StatelessWidget {
  const ReleaseVideo(this.videoId);
  final String videoId;
  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: Future.delayed(AnimatedPageChange.elementDelay),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            return Container(
              margin: EdgeInsets.only(top: 146),
              width: MediaQuery.of(context).size.width *.7,
              height: MediaQuery.of(context).size.height *.55,
              child: HtmlElementView(viewType: videoId),
            );
            break;
          default:
            return Container();
        }
      },
    );
  }
}

//==============================================================================

class MusicButtons extends StatelessWidget {
  const MusicButtons(this.buttons);
  final List<SongTileButton> buttons;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(SplashScreen.DELAY),
      builder: (context, snapshot) {
        double opacity;
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            opacity = 1;
            break;
          default:
            opacity = 0;
        }
        return Padding(
          padding: const EdgeInsets.only(top: 530),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: ANIMATION_DURATION,
                  opacity: opacity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: buttons
                  ),
                ),
              ]
          ),
        );
      },
    );
  }

}

//=========================================================================

class LatestReleaseText extends StatelessWidget {
  const LatestReleaseText();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(AnimatedPageChange.elementDelay),
      builder: (context, snapshot) {
        double opacity;
        Color textColor;
        switch(snapshot.connectionState) {
          case ConnectionState.done:
            opacity = 1;
            textColor = Colors.white;
            break;
          default:
            opacity = 0;
            textColor =  Colors.black;
        }
        return Column(
          children: [
            AnimatedOpacity(
              duration: ANIMATION_DURATION,
              opacity: opacity,
              child: Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Text('our latest release',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.homemadeApple(
                      color: Colors.redAccent,
                      fontSize: 48
                  ),
                ),
              ),
            ),
            Container(height: 320),
            AnimatedDefaultTextStyle(
              duration: ANIMATION_DURATION,
              child: Text('Listen to us on'),
              style: GoogleFonts.strait(
                fontSize: 28,
                color: textColor,
              ),
            ),
          ],
        );
      },
    );
  }

}
