import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/infrastructure/article/article_repository.dart';

import '../article_lilst/emoji/emoji_state.dart';

final emojiStreamProvider = StreamProviderFamily<List<EmojiState>, String>(
  (ref, arg) => ref
      .watch(articleRepositoryProvider)
      .subscribeArticleEmoji(articleId: arg),
);
