import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:swedish_apaches/widgets.dart';

import 'package:universal_html/html.dart';
import 'dart:ui' as ui;

import 'about.dart';
import 'api.dart';
import 'contact.dart';
import 'footer.dart';
import 'join.dart';
import 'landing.dart';
import 'music.dart';

void main() {
  final appData = ApacheAPI.getData();
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      appData.releaseSong.videoId, (int viewId) => IFrameElement()
        ..src = appData.releaseSong.videoURL
        ..style.border = 'none');
  runApp(ApacheWebsite(appData));
}

class ApacheWebsite extends StatelessWidget {
  ApacheWebsite(this._appData);
  final ApacheData _appData;

  @override
  Widget build(BuildContext context) {
    _appData.assets.forEach((asset) {
      precacheImage(asset, context);
    });
    return MaterialApp(
      title: 'The Swedish Apaches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.syncopateTextTheme()
      ),
      home: IndexPage(_appData),
    );
  }
}

//=============================================================================

enum Section {
  LANDING, MUSIC, ABOUT, JOIN, CONTACT, FOOTER,
}

class IndexPage extends StatefulWidget {
  IndexPage(this._appData);

  final ApacheData _appData;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _scrollController = ItemScrollController();

  void scrollToSection(Section section) {
    _scrollController.scrollTo(
        index: section.index,
        duration: const Duration(milliseconds: 120)
    );
  }

  HomeButton _homeButton;
  List<Widget> _topBarButtons;
  List<Widget> _drawerButtons;

  @override
  void initState() {
    _homeButton = HomeButton(
      child: const HomeImage(),
      onPressed: () => scrollToSection(Section.LANDING),
    );

    final buttonSections = List.of(Section.values)
      ..remove(Section.LANDING)
      ..remove(Section.FOOTER);

    _drawerButtons = buttonSections.map((section) => HomeButton(
        label: section.toString().split('.')[1],
        onPressed: () => scrollToSection(section),
      )).toList();

    _topBarButtons = List.from(_drawerButtons)..insert(2, _homeButton);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        backgroundColor: Colors.black,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: width < 900? [_homeButton] :_topBarButtons,
            ),
          ),
        ),
      ),
      body: Center(
        child: ScrollablePositionedList.builder(
          itemScrollController: _scrollController,
          itemCount: Section.values.length,
          itemBuilder: (context, index) {
            switch(Section.values[index]) {
              case Section.LANDING:
                return LandingSection(widget._appData);
              case Section.MUSIC:
                return MusicSection(widget._appData.songs.map((s) => SongTile(s)).toList());
              case Section.ABOUT:
                return AboutSection(
                  paragraphs: widget._appData.aboutParagraphs,
                );
              case Section.JOIN:
                return JoinSection(
                  onSubscribePressed: (email) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Welcome to the apache family!'),)
                    );
                  },
                );
              case Section.CONTACT:
                return const ContactSection();
              default:
                return FooterSection(
                  widget._appData.socialMediaLinks.keys.map((sm) => SocialMediaButton(
                    sm, widget._appData.socialMediaLinks[sm])
                  ).toList()
                );
            }
          },
        ),
      ),
      drawer: width < 900? Drawer(
        child: Container(
          color: Colors.black,
          child: Column(children: _drawerButtons),
        ),
      ) : null,
    );
  }

}

//============================================================================

class HomeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;

  const HomeButton({this.label, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      hoverColor: Colors.brown.withOpacity(.5),
      highlightColor: Colors.amber,
      child: child ?? Text(label,
        style: GoogleFonts.syncopate(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }

}


