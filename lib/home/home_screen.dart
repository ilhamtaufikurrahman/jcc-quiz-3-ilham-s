// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:jabar_coding_camp/home/model.dart';

class Homescreen extends StatefulWidget {
  final String value;
  const Homescreen({Key key, this.value}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int harga = 0;
  _HomescreenState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                        "https://avatars.githubusercontent.com/u/52710807?v=4",
                        height: 80,
                        width: 80,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(widget.value.toString()),
                  ],
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    //## soal 4
                    //Tulis Coding disini
                    Text("Rp  " + harga.toString()),

                    //sampai disini
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.add_shopping_cart)
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            //#soal 3 silahkan buat coding disini
            //untuk container boleh di pake/dimodifikasi
            Expanded(
              child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              items[index].profileUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Text(items[index].name),
                            Text(items[index].price.toString()),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    harga = harga + items[index].price;
                                  });
                                },
                                child: Text('Beli'))
                          ]),
                    );
                  }),
            ),
            //sampai disini soal 3
          ],
        ),
      ),
    );
  }
}

Widget myWidget(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 300,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Text(items[index].name),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        }),
  );
}
