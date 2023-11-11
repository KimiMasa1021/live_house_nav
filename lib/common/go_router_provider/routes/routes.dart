class Routes {
  final String liveHouseMap;
  final String addArticles;
  final String profile;
  final String liveHouseDetail;
  final String imagePreview;
  final String searchPage;
  final String articlesList;
  final String searchResult;
  final String searchResultDetail;
  final String searchResultImagePreview;
  final String textSearch;
  final String signUp;
  final String waitScreen;
  final String postArticle;
  final String setArtists;
  final String articleDetail;
  Routes({
    required this.liveHouseMap,
    required this.addArticles,
    required this.profile,
    required this.liveHouseDetail,
    required this.imagePreview,
    required this.searchPage,
    required this.articlesList,
    required this.searchResult,
    required this.searchResultDetail,
    required this.searchResultImagePreview,
    required this.textSearch,
    required this.signUp,
    required this.waitScreen,
    required this.postArticle,
    required this.setArtists,
    required this.articleDetail,
  });

  factory Routes.path() {
    return Routes(
      liveHouseMap: "/live_house_map",
      addArticles: "/add_articles",
      profile: "/profile",
      liveHouseDetail: "live_house_detail",
      imagePreview: "image_preview",
      searchPage: "/search_page",
      articlesList: "/articles_list",
      searchResult: "search_result",
      searchResultDetail: "search_result_detail",
      searchResultImagePreview: "search_result_image_preview",
      textSearch: "text_search",
      signUp: "sign_up",
      waitScreen: "wait_screen",
      postArticle: "post_article",
      setArtists: "set_artists",
      articleDetail: "article_detail",
    );
  }

  factory Routes.name() {
    return Routes(
      liveHouseMap: "liveHouseMap",
      addArticles: "addArticles",
      profile: "profile",
      liveHouseDetail: "liveHouseDetail",
      imagePreview: "imagePreview",
      searchPage: "searchPage",
      articlesList: "articlesList",
      searchResult: "searchResult",
      searchResultDetail: "SearchResultDetail",
      searchResultImagePreview: "searchResultImagePreview",
      textSearch: "textSearch",
      signUp: "signUp",
      waitScreen: "waitScreen",
      postArticle: "postArticle",
      setArtists: "setArtists",
      articleDetail: "articleDetail",
    );
  }
}
