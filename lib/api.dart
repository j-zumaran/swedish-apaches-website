
import 'package:flutter/cupertino.dart';
import 'package:swedish_apaches/music.dart';

class ApacheAPI {
  static ApacheData getData() {
    return ApacheData(
      title: 'THE SWEDISH APACHES',
      subTitle: 'More than just sounds...,',
      releaseSong: Song(
        videoId: 'youtube-html',
        videoURL: 'https://www.youtube.com/embed/4L1Hy0UG7v8?autoplay=1',
      ),
      musicPlatformLinks: {
        MusicPlatform.Spotity: 'https://open.spotify.com/artist/2ZcVEf1g7QRlx2MR9ObfXR',
        MusicPlatform.YouTube: 'https://www.youtube.com/channel/UCo6FH3YjAD2Kj8CRBcYzt4A',
        MusicPlatform.ITunes: 'https://music.apple.com/us/artist/the-swedish-apaches/1471789682',
        MusicPlatform.AppleMusic: 'https://music.apple.com/us/artist/the-swedish-apaches/1471789682',
        MusicPlatform.GooglePlay: 'https://play.google.com/store/music/artist?id=Agx3vhfcngeqjqrthgq35d64qli',
        MusicPlatform.Amazon: 'https://www.amazon.com/gp/product/B088HJ3NNF',
        MusicPlatform.Deezer: 'https://www.deezer.com/us/artist/69253822',
      },
      songs: [
        Song(
          name: 'The Show Must Go On',
          image: 'images/the_show.png',
          links: {
            MusicPlatform.Spotity: 'https://open.spotify.com/album/6LqltdGnCuyVAXVBboSJ5f',
            MusicPlatform.ITunes: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.AppleMusic: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.Amazon: 'https://www.amazon.com/gp/product/B088HJ3NNF',
            MusicPlatform.GooglePlay: 'https://play.google.com/store/music/album/The_Swedish_Apaches_ALL_IN_feat_Pierre_Malmoe?id=Bpk37jrrodq4bgecgb4nefns3xu',
            MusicPlatform.Deezer: 'https://www.deezer.com/us/album/147809152',
            MusicPlatform.YouTube: 'https://www.youtube.com/watch?v=4L1Hy0UG7v8',
          },
        ),
        Song(
          name: 'All In',
          image: 'images/all-in.png',
          links: {
            MusicPlatform.Spotity: 'https://open.spotify.com/album/6LqltdGnCuyVAXVBboSJ5f',
            MusicPlatform.ITunes: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.AppleMusic: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.Amazon: 'https://www.amazon.com/gp/product/B088HJ3NNF',
            MusicPlatform.GooglePlay: 'https://play.google.com/store/music/album/The_Swedish_Apaches_ALL_IN_feat_Pierre_Malmoe?id=Bpk37jrrodq4bgecgb4nefns3xu',
            MusicPlatform.Deezer: 'https://www.deezer.com/us/album/147809152',
          },
        ),
        Song(
          name: 'Mission',
          image: 'images/mission.png',
          links: {
            MusicPlatform.Spotity: 'https://open.spotify.com/album/6LqltdGnCuyVAXVBboSJ5f',
            MusicPlatform.ITunes: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.AppleMusic: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.Amazon: 'https://www.amazon.com/gp/product/B088HJ3NNF',
            MusicPlatform.GooglePlay: 'https://play.google.com/store/music/album/The_Swedish_Apaches_ALL_IN_feat_Pierre_Malmoe?id=Bpk37jrrodq4bgecgb4nefns3xu',
            MusicPlatform.Deezer: 'https://www.deezer.com/us/album/147809152',
          },
        ),
        Song(
          name: 'Black & White',
          image: 'images/b&w.png',
          links: {
            MusicPlatform.Spotity: 'https://open.spotify.com/album/6LqltdGnCuyVAXVBboSJ5f',
            MusicPlatform.ITunes: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.AppleMusic: 'https://music.apple.com/us/album/all-in-feat-pierre-malmoe-single/1512927227?uo=4',
            MusicPlatform.Amazon: 'https://www.amazon.com/gp/product/B088HJ3NNF',
            MusicPlatform.GooglePlay: 'https://play.google.com/store/music/album/The_Swedish_Apaches_ALL_IN_feat_Pierre_Malmoe?id=Bpk37jrrodq4bgecgb4nefns3xu',
            MusicPlatform.Deezer: 'https://www.deezer.com/us/album/147809152',
          },
        ),
      ],
      aboutParagraphs: [
        '''
          The Swedish Apaches (TSA), is the name of our multi-genre collective music band. We are based in Stockholm, Sweden. We are proud of our principle rooted in the Swedish values. But, we believe we needed to add some more ”spice”.\n
          And there come our ”Apacheness”. Like the Apaches, we are fearless warriors on hard missions. And as contradictive as it seems, we try to bridge and collect extremes together. We believe in the power of harmonic frequencies, togetherness and love. We believe life is too short to limit ourselves to merely logic.\n
          Apart from our artists from Sweden (Stockholm, Malmö & Gothenburg so far), we have collaborations with artists from the US, UK, France, Spain, Peru and Turkey.\n
        ''',
        ''''
          We have a philosophy for our music: we want to create music with message. In the sense that our music will be “more than just sounds”. We believe only and only in one race that is human race. Men or women, young or old doesn’t matter. Sex is a matter of nature and age is just a matter of time and both out of our control. The only thing that matters is how we vibrates to the world and what legacy we live after we are “gone”!\n
          Our ultimate purpose is to help people to make this world better. That’s why The Swedish Apaches welcome any person as long as they have faith in themselves and our values. If you think you have something to share with us drop us a line and we will get back to you as soon as we can.\n
        '''
      ],
      socialMediaLinks: {
        SocialMedia.Facebook: 'https://facebook.com',
        SocialMedia.Youtube: 'https://www.youtube.com/channel/UCo6FH3YjAD2Kj8CRBcYzt4A',
        SocialMedia.Instagram: 'https://instragram.com',
        SocialMedia.Twitter: 'https://twitter.com',
      },
      images: [
        "images/all-in.png",
        "images/amazon.png",
        "images/applemusic.png",
        "images/b&w.png",
        "images/deezer.png",
        "images/googleplay.png",
        "images/itunes.png",
        "images/mission.png",
        "images/spotify.png",
        "images/the_show.png",
        "images/youtube.png",
        "images/logo.png",
      ],
    );
  }

}


class ApacheData {
  ApacheData({
    this.title, this.subTitle,
    this.releaseSong,
    this.musicPlatformLinks, this.songs,
    this.aboutParagraphs,
    this.socialMediaLinks,
    this.images
  });

  final String title;
  final String subTitle;

  final Song releaseSong;

  final Map<MusicPlatform, String> musicPlatformLinks;

  final List<Song> songs;

  final List<String> aboutParagraphs;

  final Map<SocialMedia, String> socialMediaLinks;

  List<String> images;

  List<AssetImage> get assets => images.map((i) => AssetImage(i)).toList();

}

class Song {
  String name;
  String image;
  Map<MusicPlatform, String> links;

  String videoId;
  String videoURL;

  Song({this.name, this.image, this.links, this.videoId, this.videoURL});

}

enum SocialMedia {
  Facebook, Youtube, Instagram, Twitter
}
