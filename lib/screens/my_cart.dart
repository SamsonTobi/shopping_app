import 'package:flutter/material.dart';
import 'package:shopping_app/commons/constants.dart';
import 'package:shopping_app/screens/shop.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
          actions: const [
            Text(
              '15 Items',
              style: TextStyle(
                  fontFamily: 'Graphik',
                  fontSize: 18,
                  color: AppColors.Grey200),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CartItem(),
          ],
        ),
        //     body: Center(
        //         child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       'images/parcel 1.png',
        //       height: 70,
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     const Text(
        //       'Your Bag is Emtpy',
        //   style: TextStyle(
        //       fontFamily: 'Graphik',
        //       fontSize: 24,
        //       fontWeight: FontWeight.w600,
        //       color: AppColors.Grey300),
        // ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //   ],
        // ))
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
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
                  'images/Rectangle 8.png',
                  width: 60,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
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
                                    'Men\'s Harrington Jacket',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'Graphik',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.Grey300),
                                  ),
                                ),
                                Text(
                                  '(2)',
                                  style: TextStyle(
                                      fontFamily: 'Graphik',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.Grey300),
                                ),
                              ],
                            ),
                            Text(
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
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '\$148',
                        style: TextStyle(
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
                  onPressed: () => {},
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
                  onPressed: () => {},
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
            onTap: () => {},
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
