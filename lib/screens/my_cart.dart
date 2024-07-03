import 'package:flutter/material.dart';
import 'package:shopping_app/commons/appdata.dart';
import 'package:shopping_app/commons/constants.dart';
import 'package:shopping_app/screens/product_view.dart';
import 'package:shopping_app/screens/shop.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  void _incrementQuantity(Product product) {
    final cartItems = Map<Product, int>.from(cartNotifier.value);
    cartItems[product] = (cartItems[product] ?? 0) + 1;
    cartNotifier.value = cartItems;
  }

  void _decrementQuantity(Product product) {
    final Map<Product, int> cartItems = Map.from(cartNotifier.value);
    final currentQuantity = cartItems[product] ?? 0;
    if (currentQuantity > 1) {
      cartItems[product] = currentQuantity - 1;
    } else {
      cartItems.remove(product);
    }
    cartNotifier.value = cartItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 32.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your cart',
            style: TextStyle(
                fontFamily: 'Graphik',
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.Grey300),
          ),
          titleSpacing: 0.0,
          actions: [
            ValueListenableBuilder(
              valueListenable: cartNotifier,
              builder: (context, cartList, child) {
                return Text(
                  cartNotifier.value.isNotEmpty
                      ? '${cartList.length} ${cartList.length > 1 ? "Items" : "Item"}'
                      : '',
                  style: const TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: 18,
                      color: AppColors.Grey200),
                );
              },
            ),
          ],
        ),
        body: ValueListenableBuilder(
            valueListenable: cartNotifier,
            builder: (context, cartItems, child) {
              if (cartItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/parcel 1.png',
                        height: 90,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Your Bag is empty',
                        style: TextStyle(
                            fontFamily: 'Graphik',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.Grey300),
                      ),
                    ],
                  ),
                );
              }
              return ListView(
                key: ValueKey(cartItems),
                padding: const EdgeInsets.only(top: 24),
                shrinkWrap: true,
                children: cartItems.entries.map((entry) {
                  Product product = entry.key;
                  int quantity = entry.value;

                  return CartItem(
                    key: ValueKey((product, quantity)),
                    product: product,
                    quantity: quantity,
                    onIncrement: () => _incrementQuantity(product),
                    onDecrement: () => _decrementQuantity(product),
                    onDelete: () {
                      cartNotifier.value =
                          (Map.from(cartItems)..remove(product));
                      print(cartNotifier.value);
                    },
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final Product product;
  final int quantity;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItem({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onDelete,
    required this.onDecrement,
    required this.onIncrement,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 31),
          decoration: BoxDecoration(
              color: AppColors.Grey100,
              borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(
                  widget.product.imageFile,
                  width: 60,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.product.productName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: 'Graphik',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.Grey300),
                                  ),
                                ),
                                Text(
                                  '(${widget.quantity})',
                                  style: const TextStyle(
                                      fontFamily: 'Graphik',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.Grey300),
                                ),
                              ],
                            ),
                            const Text(
                              'Customized size and color',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Graphik',
                                  fontSize: 16,
                                  color: AppColors.Grey200),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        '\$${(((widget.quantity * widget.product.currentPrice * 100).truncateToDouble()) / 100)}',
                        style: const TextStyle(
                            fontFamily: 'Graphik',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.Grey300),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: AppColors.PrimaryColor),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: widget.onDecrement,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.remove),
                  iconSize: 20,
                  color: AppColors.PrimaryColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: AppColors.PrimaryColor),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: widget.onIncrement,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.add),
                  iconSize: 20,
                  color: AppColors.PrimaryColor,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
            onTap: widget.onDelete,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.delete_outline_rounded, color: AppColors.Grey200),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Delete this item',
                  style: TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: 18,
                      color: AppColors.Grey200),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
