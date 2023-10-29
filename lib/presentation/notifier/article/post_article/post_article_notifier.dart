import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_house_nav/domain/spotify/values/artist/artist.dart';
import 'package:live_house_nav/presentation/notifier/spotify/search_artists/state/artists.dart';

import 'state/post_article.dart';

final postArticleNotifierProvider =
    NotifierProvider<PostArticleNotifier, PostArticle>(
        () => PostArticleNotifier());

class PostArticleNotifier extends Notifier<PostArticle> {
  @override
  PostArticle build() {
    return PostArticle(artists: Artists());
  }

  final picker = ImagePicker();

  Future pickImage(
    ImageSource imageSource,
    Function() pop,
  ) async {
    final stop = Stopwatch();
    final image = await picker.pickImage(
      source: imageSource,
      imageQuality: 80,
    );
    stop.start();
    if (image == null) return;
    final file = File(image.path);

    state = state.copyWith(
      pickedImages: [...state.pickedImages, file],
    );
    stop.stop();
    pop();
  }

  void removePickerImage(int index) {
    final List<File> newList = List.from(state.pickedImages);

    newList.removeAt(index);

    state = state.copyWith(
      pickedImages: newList,
    );
  }

  void addArtist(Artist artist) {
    state = state.copyWith(
      artists: Artists(items: [...state.artists.items, artist]),
    );
  }

  void removeArtist(Artist artist) {
    state = state.copyWith(
      artists: Artists(items: [...state.artists.items, artist]),
    );
  }
}
