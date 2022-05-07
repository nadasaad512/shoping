import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/test/add_product.dart';

import '../router_helper.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
          floatingActionButton: Visibility(
            visible:true,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                RouterHelper.routerHelper.routingToSpecificWidget(AddNewProduct());
              },
            ),
          ),
          appBar: AppBar(
            title: Text('All Products'),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.logOut();
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: provider.allProducts == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.allProducts.isEmpty
                    ? Center(
                        child: Text('No Products Found'),
                      )
                    : ListView.builder(
                        itemCount: provider.allProducts.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Container(
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            key: ObjectKey(provider.allProducts[index]),
                            onDismissed: (DismissDirection direction) {
                              provider.deleteProduct(
                                  provider.allProducts[index].id);
                            },
                            child: ListTile(
                              // leading: CircleAvatar(
                              //   radius: 50,
                              //   backgroundImage: NetworkImage(
                              //       provider.allProducts[index].imageUrl),
                              // ),
                              title: Text(provider.allProducts[index].name),
                              subtitle: Row(
                                children: [
                                  Text(provider.allProducts[index].description),
                                  Spacer(),
                                  Text(provider.allProducts[index].price
                                          .toString() +
                                      ' \$')
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {


                                    provider.goToEditProduct(provider.allProducts[index]);
                                  },
                                  // provider.goToEditCart(,
                                  //     provider.allProducts[index]
                                  //
                                  //
                                  // );
                                  icon: Icon(Icons.edit)),
                            ),
                          );
                        }),
          ));
    });
  }
}
