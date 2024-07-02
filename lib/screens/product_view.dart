// import 'dart:html';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_app/commons/appdata.dart';
import 'package:shopping_app/commons/constants.dart';

class ProductView extends StatefulWidget {
  final Product product;

  const ProductView({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: const Icon(Icons.arrow_back_rounded),
                    padding: const EdgeInsets.all(12.0),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.Grey100)),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.favorite_border_rounded),
                    padding: const EdgeInsets.all(12.0),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.Grey100)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 18.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Image.asset(
                    'images/Rectangle 9.png',
                    height: 235,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'images/Rectangle 10.png',
                    height: 235,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'images/Rectangle 11.png',
                    height: 235,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ]),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: const TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.Grey300),
                  ),
                  Text(
                    '\$${widget.price}',
                    style: const TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.PrimaryColor),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection.',
                    style: TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 16,
                        color: AppColors.Grey200),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.Grey100),
                    child: Row(
                      children: [
                        const Text(
                          'Choose Quantity',
                          style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 18,
                              color: AppColors.Grey300),
                        ),
                        const Spacer(),
                        ValueListenableBuilder<Map<Product, int>>(
                            valueListenable: cartNotifier,
                            builder: (context, cart, child) {
                              final quantity = cart[product] ?? 0;
                              return Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: AppColors.PrimaryColor),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: IconButton(
                                      onPressed: () {
                                        final newQuantity = quantity > 0
                                            ? quantity - 1
                                            : quantity;
                                        totalPrice = widget.price * quantity;

                                        if (cartNotifier.value
                                            .containsKey(product)) {
                                          if (quantity == 0) {
                                            cartNotifier.value =
                                                (Map.from(cartNotifier.value)
                                                  ..remove(product));
                                          } else {
                                            cartNotifier.value =
                                                (Map.from(cartNotifier.value)
                                                  ..[product] = quantity);
                                          }
                                        }
                                      },
                                      padding: const EdgeInsets.all(0),
                                      icon: const Icon(Icons.remove),
                                      iconSize: 20,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                        fontFamily: 'Graphik',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.Grey300),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: AppColors.PrimaryColor),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: IconButton(
                                      onPressed: () {
                                        quantity++;
                                        totalPrice = widget.price * quantity;

                                        cartNotifier.value =
                                            (Map.from(cartNotifier.value)
                                              ..[product] = quantity);
                                      },
                                      padding: const EdgeInsets.all(0),
                                      icon: const Icon(Icons.add),
                                      iconSize: 20,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            DefaultButton(
                price: widget.price,
                totalPrice: ((totalPrice * 100).truncateToDouble()) / 100),
            // const ItemInCartButton()
          ],
        ),
      ),
    ));
  }
}

class DefaultButton extends StatefulWidget {
  final double price;
  final double totalPrice;

  const DefaultButton({Key? key, required this.price, required this.totalPrice})
      : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.PrimaryColor)),
          onPressed: () {
            debugPrint('Button pressed');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Text(
                  '\$${widget.totalPrice == 0 ? widget.price : widget.totalPrice}',
                  style: const TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  'Add to Bag',
                  style: TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          )),
    );
  }
}

class ItemInCartButton extends StatelessWidget {
  const ItemInCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.Grey300, borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Item already added to cart',
              style: TextStyle(
                  fontFamily: 'Graphik',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
