enum Target2SellPageType {
  homepage,
  productPage,
  productListingPage,
  cartPage,
  comparatorPage,
  searchResultPage,
  noResultSearchPage,
  contentPage,
  postPaymentPage,
  loginPage,
  accountCreationStartPage,
  accountCreationEndPage,
  purchaseBeginPage,
  pageNotFoundPage,
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
