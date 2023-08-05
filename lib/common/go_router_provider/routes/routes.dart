class Routes {
  final String liveHouseMap;
  final String addArticles;
  final String setting;
  final String liveHouseDetail;
  final String imagePreview;
  final String searchPage;
  final String articlesList;

  Routes({
    required this.liveHouseMap,
    required this.addArticles,
    required this.setting,
    required this.liveHouseDetail,
    required this.imagePreview,
    required this.searchPage,
    required this.articlesList,
  });

  factory Routes.path() {
    return Routes(
      liveHouseMap: "/live_house_map",
      addArticles: "/add_articles",
      setting: "/setting",
      liveHouseDetail: "live_house_detail",
      imagePreview: "image_preview",
      searchPage: "/search_page",
      articlesList: "/articles_list",
    );
  }

  factory Routes.name() {
    return Routes(
      liveHouseMap: "liveHouseMap",
      addArticles: "addArticles",
      setting: "setting",
      liveHouseDetail: "liveHouseDetail",
      imagePreview: "imagePreview",
      searchPage: "searchPage",
      articlesList: "articlesList",
    );
  }
}
