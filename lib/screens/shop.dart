import 'package:flutter/material.dart';
import 'package:shopping_app/commons/constants.dart';
import 'package:shopping_app/commons/appdata.dart';
import 'package:shopping_app/screens/product_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 24,
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/profile_pic.png'),
                  radius: 20,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.Grey100,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Search for any outfit',
                    hintStyle: TextStyle(
                        color: AppColors.Grey200,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0),
                    prefixIcon: Icon(Icons.search_rounded),
                    prefixIconColor: AppColors.Grey200,
                    border: InputBorder.none),
              ),
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.Grey300),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 16,
                              color: AppColors.Grey300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(categories.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  categories[index].categoryImage,
                                  height: 60,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  categories[index].categoryName,
                                  style: const TextStyle(
                                      fontFamily: 'Graphik', fontSize: 16),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Top Selling',
                          style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.Grey300),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 16,
                              color: AppColors.Grey300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            List.generate(productDetails.length, (index) {
                          return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            width: 150,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => ProductView(
                                  productName: productDetails[index].productName,
                                  price: productDetails[index].currentPrice
                                ))
                                )
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    productDetails[index].imageFile,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    productDetails[index].productName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: 'Graphik', fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.1),
                                  ),
                                  Text(
                                    '\$ ${productDetails[index].currentPrice}',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: 'Graphik', fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: -0.1),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            ])
          ],
                ),
              ),
        ));
  }
}
