// import 'package:flutter/material.dart';




// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Dummy Products',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: ProductPage(),
// //     );
// //   }
// // }

// class ProductPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dummy Products'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           ProductItem(
//             image: 'assets/product1.png',
//             name: 'Product 1',
//             price: '29.99',
//             rating: 4.5,
//           ),
//           SizedBox(height: 16.0),
//           ProductItem(
//             image: 'assets/product2.png',
//             name: 'Product 2',
//             price: '19.99',
//             rating: 3.8,
//           ),
//           SizedBox(height: 16.0),
//           ProductItem(
//             image: 'assets/product3.png',
//             name: 'Product 3',
//             price: '39.99',
//             rating: 4.2,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductItem extends StatelessWidget {
//   final String image;
//   final String name;
//   final String price;
//   final double rating;

//   const ProductItem({
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               image,
//               width: 100.0,
//               height: 100.0,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               '\$$price',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   color: Colors.yellow,
//                   size: 16.0,
//                 ),
//                 SizedBox(width: 4.0),
//                 Text(
//                   rating.toString(),
//                   style: TextStyle(
//                     fontSize: 14.0,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class DummyProducts extends StatelessWidget {
  const DummyProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Expanded(
                child: ProductItem(
                  image: 'images/dummy.webp',
                  name: 'Product 1',
                  price: '29.99',
                  rating: 4.5,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ProductItem(
                  image: 'images/dummy.webp',
                  name: 'Product 2',
                  price: '19.99',
                  rating: 3.8,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: ProductItem(
                  image: 'images/dummy.webp',
                  name: 'Product 3',
                  price: '39.99',
                  rating: 4.2,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ProductItem(
                  image: 'images/dummy.webp',
                  name: 'Product 4',
                  price: '14.99',
                  rating: 4.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          // Add more rows with product items as needed
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final double rating;

  const ProductItem({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\SAR $price',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 16.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  rating.toString(),
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}