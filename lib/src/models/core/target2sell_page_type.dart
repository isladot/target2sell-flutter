enum Target2SellPageType {
  /// pID: 1000
  homepage,

  /// pID: 1200
  productPage,

  /// pID: 1400
  productListingPage,

  /// pID: 1600
  cartPage,

  /// pID: 1800
  comparatorPage,

  /// pID: 2000
  searchResultPage,

  /// pID: 2200
  noResultSearchPage,

  /// pID: 2400
  contentPage,

  /// pID: 2600
  postPaymentPage,

  /// pID: 2800
  loginPage,

  /// pID: 3000
  accountCreationStartPage,

  /// pID: 3200
  accountCreationEndPage,

  /// pID: 3400
  purchaseBeginPage,

  /// pID: 3600
  pageNotFoundPage,

  /// pID: 4000
  addProductToCartPopup;

  int get id {
    switch (this) {
      case Target2SellPageType.homepage:
        return 1000;
      case Target2SellPageType.productPage:
        return 1200;
      case Target2SellPageType.productListingPage:
        return 1400;
      case Target2SellPageType.cartPage:
        return 1600;
      case Target2SellPageType.comparatorPage:
        return 1800;
      case Target2SellPageType.searchResultPage:
        return 2000;
      case Target2SellPageType.contentPage:
        return 2200;
      case Target2SellPageType.postPaymentPage:
        return 2400;
      case Target2SellPageType.loginPage:
        return 2600;
      case Target2SellPageType.accountCreationStartPage:
        return 2800;
      case Target2SellPageType.accountCreationEndPage:
        return 3000;
      case Target2SellPageType.purchaseBeginPage:
        return 3200;
      case Target2SellPageType.noResultSearchPage:
        return 3400;
      case Target2SellPageType.pageNotFoundPage:
        return 3600;
      case Target2SellPageType.addProductToCartPopup:
        return 4000;
    }
  }

  @override
  String toString() => id.toString();
}
