@JS()
library stripe;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:practice_app_class/utils/contants.dart';

void redirectToCheckout(BuildContext _) async {
  final stripe = Stripe(apiKey);
  stripe.redirectToCheckout(CheckoutOptions(
    lineItems: [
      LineItem(price: "price_1OyqjtKVlAPqjgHvTRz7apmM", quantity: 1),
      LineItem(price: "price_1P0gwDKVlAPqjgHvIIgrp2As", quantity: 1),
    ],
    mode: 'payment',
    successUrl: 'https://www.facebook.com/',
    cancelUrl: 'https://www.youtube.com/',
  ));
}

@JS()
class Stripe {
  external Stripe(String key);

  external redirectToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String sessionId,
  });
}

@JS()
@anonymous
class LineItem {
  external String get price;

  external int get quantity;

  external factory LineItem({String price, int quantity});
}
