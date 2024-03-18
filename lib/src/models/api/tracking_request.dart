import 'package:target2sell_flutter/src/models/core/target2sell_event_type.dart';
import 'package:target2sell_flutter/src/models/core/target2sell_page_type.dart';

class Target2SellTrackingRequest {
  Target2SellTrackingRequest({
    required this.pageType,
    this.setId,
    this.userEmail,
    this.userId,
    this.eventType = Target2SellEventType.view,
    this.spaceId,
    this.basketProduct,
    this.language,
    this.domain,
    this.itemId,
    this.categoryId,
    this.productQuantity,
    this.keywords,
    this.orderId,
    this.priceList,
    this.crmXXX,
    this.mediaRuleId,
    this.mediaCampaignId,
    this.mediaAlgo,
    this.any,
    this.trackingId,
  });

  /// cID - Customer ID
  String? customerId;

  /// pID - Page ID
  final Target2SellPageType pageType;

  /// tID - Session ID
  String? sessionId;

  /// setID - Set ID / Shop ID
  ///
  /// **Mandatory** if the website / app features several shops for the same Customer ID.
  ///
  /// Example: setID = "spain" if the account features products for several countries.
  final String? setId;

  /// uEM - User Email
  ///
  /// This parameter is not mandatory but it is very important to fill when the user's email is known (user logged in). You can also use the user's unique ID instead.
  ///
  /// **Mandatory** on a *"Purchase begin page"* (pageType = Target2SellPageType.purchaseBegin).
  final String? userEmail;

  /// uID - User ID
  ///
  /// **Mandatory** on a *"Purchase begin page"* (pageType = Target2SellPageType.purchaseBegin).

  final String? userId;

  /// eN - Event Type
  final Target2SellEventType eventType;

  /// sp - Space ID
  ///
  /// **Mandatory** on a *"click"* event (eventType = Target2SellEventType.click).
  final String? spaceId;

  /// bP - Basket List
  ///
  /// A formatted list of the identifiers of the products in the cart. Each identifier has to be separated from the next one by "|"
  ///
  /// Example: p456|p76|p890|p56
  final String? basketProduct;

  /// lang - Language
  final String? language;

  /// domain - Domain
  ///
  /// **Mandatory** if the beginning of your website URL changes in function of your pages.
  ///
  /// Example: *mywebsite.com* becomes *product456.mywebsite.com* when visiting the product 456 page
  final String? domain;

  /// iID - Item ID
  ///
  /// List of the products on the page. Each one of them should be separated by "|".
  ///
  /// **Mandatory** on a *"Product page"*, *"Cart page"*, *"Add-to-cart page"*, *"Search result page"* and *"Post-payment page"*.
  ///
  /// Example: p456|p76|p890|p56
  final String? itemId;

  /// aId - Category ID
  ///
  /// ID of the main category of a product list.
  ///
  /// **Mandatory** on a *"Product listing page"*.
  final String? categoryId;

  /// qTE - Product Quantity
  ///
  /// A formatted list of the quantity of each product in the cart. Each identifier has to be separated from the next one by "|".
  ///
  /// **Mandatory** on a *"Cart page"* and *"Post-payment page"*.
  final String? productQuantity;

  /// kW - Keywords
  ///
  /// **Mandatory** on a *"Search result page"*.
  final String? keywords;

  /// oID - Order ID
  ///
  /// Unique identifier of the order placed by the user.
  ///
  /// **Mandatory** on a *"Post-payment page"*.
  final String? orderId;

  /// priceL - Price List
  ///
  /// A formatted list of the amount of each bought product. Each identifier has to be separated from the next one by "|", and equals the price of the product multiplied by its quantity.
  final String? priceList;

  /// userRank - User Rank
  String? userRank;

  /// crm_XXX - CRM
  ///
  /// An additional CRM piece of information only known at runtime. Several values can be given (crm_XXX, crm_YYY, crm_ZZZ). Act as an override of CRM values already known by Target2sell for the user.
  final String? crmXXX;

  /// mediaRuleId - Media Rule ID
  final String? mediaRuleId;

  /// mediaCampaignId - Media Campaign ID
  ///
  /// The media campaing identifier for Media V2.
  ///
  /// **Mandatory** on a *"mediaClick"* event (eventType = Target2SellEventType.mediaClick).
  final String? mediaCampaignId;

  /// mediaAlgo - Media Algorithm
  ///
  /// The algorithm used to recommend the campaign clicked.
  ///
  /// **Mandatory** on a *"mediaClick"* event (eventType = Target2SellEventType.mediaClick).
  final String? mediaAlgo;

  /// any
  final String? any;

  /// trackingId - Tracking ID
  ///
  /// Hash that is provided by the Target2Sell recommendation server in its response.
  ///
  /// If this feature is activated, it can replace all mandatory parameters for a *"click"* event. Only defining the tracking ID and the page ID as parameters will suffice.
  final String? trackingId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cID': customerId,
        'pID': pageType.toString(),
        'tID': sessionId,
        'setID': setId,
        'uEM': userEmail,
        'uID': userId,
        'eN': eventType.name,
        'sp': spaceId,
        'bP': basketProduct,
        'lang': language,
        'domain': domain,
        'iID': itemId,
        'aId': categoryId,
        'qTE': productQuantity,
        'kW': keywords,
        'oID': orderId,
        'priceL': priceList,
        'userRank': userRank,
        'crm_XXX': crmXXX,
        'mediaRuleId': mediaRuleId,
        'mediaCampaignId': mediaCampaignId,
        'mediaAlgo': mediaAlgo,
        'any': any,
        'trackingId': trackingId,
      }..removeWhere((_, value) => value == null || value == '');

  @override
  String toString() => toJson().toString();
}
