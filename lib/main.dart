import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};
  final List<Map<String, String>> menuList = [
    {'title': 'menu', 'image': 'menu.jpg'}
  ];

  MainApp({super.key}){
    biodata['name'] = 'caffe Rolet';
    biodata['email'] = 'sastraboy0@gmail.com';
    biodata['phone'] = '+6289525835012';
    biodata['image'] = 'caffe rolet.jpg';
    biodata['hobby'] = 'Billiard,modifikasi,& game';
    biodata['addr'] = 'Jl. Raya Kelet-Klepu, Kelet, Kec. Keling, Kab. Jepara, Jawa Tengah 59454';
    biodata['desc'] =  '''Selamat datang di aplikasi caffe rolet, tempat di mana cita rasa autentik masakan dan minuman bertemu dengan harga yang terjangkau!.''';

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: "Aplikasi Caffe rolet",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Caffe rolet")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              textKotak(Colors.black, biodata['name'] ?? ''), 
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
              btnContact(Icons.mark_as_unread_rounded, Colors.green[900],
              "mailto:${biodata['email'] ?? ''}"), 
              btnContact(Icons.phone, Colors.blueAccent,
              "https://wa.me/${biodata['phone']}"),
              btnContact(Icons.location_on, Colors.red,
              "https://www.bing.com/maps?osid=19a65300-ac82-4d33-8a85-2686e3ce5adb&cp=-6.503841~110.90018&lvl=17&pi=0&imgid=b1eba820-2cf5-4f4a-ae18-26480caac53d&v=2&sV=2&form=S00027")
              ],
            ),
            SizedBox(height: 10),
            textKotak(Colors.black38,'Deskripsi:'), //DESKRIPSI
            SizedBox(height: 10),
            Text(biodata['desc'] ?? '', 
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center),
            SizedBox(height: 10),
                textKotak(Colors.black38, 'List Menu:'), //MENU
                SizedBox(height: 10),
                Column(
                  children: [
                    for (int i = 0; i < menuList.length; i += 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //SUPAYA 2 BARIS
                        children: [
                          menuItemWidget(menuList[i]),
                          if (i + 1 < menuList.length) 
                            menuItemWidget(menuList[i + 1]),
                        ],
                      ),
                  ],
                ),
            SizedBox(height: 10),
            textKotak(Colors.black38,'Alamat:'), //ALAMAT
            SizedBox(height: 10),
            Text(biodata['addr'] ?? '', 
                style: TextStyle(fontSize: 18), 
                textAlign: TextAlign.center),
            SizedBox(height: 10),
              textKotak(Colors.black38, 'Jam Buka:'),  // JAM BUKA
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Agar teks rata kiri
                children: [
                  textAttribute("Senin", "08.00 - 00.00"),
                  textAttribute("Selasa", "08.00 - 00.00"),
                  textAttribute("Rabu", "08.00 - 00.00"),
                  textAttribute("Kamis", "08.00 - 00.00"),
                  textAttribute("Jumat", "08.00 - 00.00"),
                  textAttribute("Sabtu", "08.00 - 00.00"),
                  textAttribute("minggu", "08.00 - 00.00"),
                ],
              ),

           ]), 
        ),
      ),
    );
  }

  Container textKotak(Color bgColor, String teks) {
    return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity, 

              decoration: BoxDecoration(color: bgColor),
              child: Text(
                teks,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                ),
            ),
          );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text("- $judul", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(":", style: TextStyle(fontSize: 18)),
        Text(teks, style: TextStyle(fontSize: 18))
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
              child: ElevatedButton(
                onPressed: () {
                  launch(uri);
                }, 
                child: Icon(icon),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color, 
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            );
  }

    Future launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }

  Widget menuItemWidget(Map<String, String> menuItem) {
    return Column(
      children: [
        Image.asset(
          'assets/${menuItem['image'] ?? ''}', 
          width: 100, // Sesuaikan ukuran lebar
          height: 150 // Sesuaikan ukuran tinggi
        ),
        SizedBox(height: 2), // Jarak antara gambar dan teks
        Text(
          menuItem['title'] ?? '', 
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
  
}
