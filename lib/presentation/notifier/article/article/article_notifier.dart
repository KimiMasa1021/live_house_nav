// import 'package:live_house_nav/domain/article/article_searvice.dart';
// import 'package:live_house_nav/infrastructure/article/article_repository.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../../../domain/article/values/article.dart';

// final articleNotifierProvider =
//     AsyncNotifierProvider<ArticleNotifier, List<Article>>(
//   () => ArticleNotifier(
//     ArticleSearvice(
//       ArticleRepository(),
//     ),
//   ),
// );

// class ArticleNotifier extends AsyncNotifier<List<Article>> {
//   ArticleNotifier(this.searvice);
//   final ArticleSearvice searvice;
//   @override
//   build() async {
//     return await featchArticles();
//   }

//   // Future<List<Article>> featchArticles() async {
//   //   return await searvice.featchArticles();
//   // }
// }
