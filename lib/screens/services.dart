import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:touchofbeauty_flutter/models/cart_model.dart';
import 'package:touchofbeauty_flutter/screens/cart.dart';
import 'package:touchofbeauty_flutter/services/cart_provider.dart';
import 'package:touchofbeauty_flutter/services/get_services.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
import 'package:touchofbeauty_flutter/utils/helper.dart';

class Service extends StatefulWidget {
  final String id;
  final String name;
  const Service({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

Helper? dbHelper = Helper();

class _ServiceState extends State<Service> {
  @override
  void initState() {
    Provider.of<GetServicesProvider>(context, listen: false)
        .getService(context, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name} Services"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const MyCart(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[700]),
              ),
            ),
            // Text(widget.id),
            Consumer<GetServicesProvider>(
              builder: (context, service, _) {
                if (service.value?.isEmpty == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: service.value?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade100,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(URL.main +
                                              "/" +
                                              "${service.value?[index].simage}"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 180,
                                            child: Text(
                                              (service.value?[index].sname)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.purple[600],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Text(
                                            "\$ Rs.${(service.value?[index].sprice).toString()}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.purple[600]),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "Duration: ${(service.value?[index].sduration).toString()}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.purple[600]),
                                            textAlign: TextAlign.left,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Consumer<CartProvider>(
                                              builder: (context, value, child) {
                                                return ElevatedButton(
                                                    onPressed: () {
                                                      value.add(
                                                          (service.value?[index]
                                                                  .cid)
                                                              .toString(),
                                                          (service.value?[index]
                                                                  .id)
                                                              .toString(),
                                                          (service.value?[index]
                                                                  .simage)
                                                              .toString(),
                                                          (service.value?[index]
                                                                  .sname)
                                                              .toString(),
                                                          (service.value?[index]
                                                                  .sduration)
                                                              .toString(),
                                                          (service.value?[index]
                                                                  .sprice)!
                                                              .toInt());
                                                      // dbHelper
                                                      //     ?.insert(Cart(
                                                      //       id: widget.id
                                                      //           .toString(),
                                                      //       productId: service
                                                      //           .value?[index].id
                                                      //           .toString(),
                                                      //       initialPrice: service
                                                      //           .value?[index]
                                                      //           .sprice,
                                                      //       productPrice: service
                                                      //           .value?[index]
                                                      //           .sprice,
                                                      //       quantity: 1,
                                                      //       unittag: "\$ Rs",
                                                      //       image: service
                                                      //           .value?[index]
                                                      //           .simage,
                                                      //     ))
                                                      //     .then((value) => {
                                                      //           cart.addTotalPrice(
                                                      //               double.parse((service
                                                      //                       .value?[
                                                      //                           index]
                                                      //                       .sprice)
                                                      //                   .toString())),
                                                      //           cart.addCounter(),
                                                      //           MotionToast.success(
                                                      //                   description:
                                                      //                       const Text(
                                                      //                           'Login Successful'))
                                                      //               .show(
                                                      //                   context),
                                                      //         });
                                                      MotionToast.success(
                                                              description:
                                                                  const Text(
                                                                      'Added to cart'))
                                                          .show(context);
                                                    },
                                                    child: const Text(
                                                        "Add to Cart"));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Description: ${(service.value?[index].sdescription).toString()}",
                                    style: TextStyle(
                                      color: Colors.purple[600],
                                      fontSize: 15.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
