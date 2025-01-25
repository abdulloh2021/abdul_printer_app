import 'package:abdul_printer_app/widget/custom_button.dart';
import 'package:flutter/material.dart';

// Kelas ini menampilkan detail dari sebuah printer
class PrintersdetailspageView extends StatelessWidget {
  final Map<String, String> printer;

  // Konstruktor untuk menerima data printer sebagai parameter
  PrintersdetailspageView({required this.printer});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    // Menentukan ikon dan warna berdasarkan status printer
    switch (printer['status']) {
      case 'Active':
        icon = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case 'Inactive':
        icon = Icons.cancel;
        iconColor = Colors.red;
        break;
      case 'Service':
        icon = Icons.warning;
        iconColor = Colors.yellow;
        break;
      default:
        icon = Icons.help;
        iconColor = Colors.grey;
    }

    return Scaffold(
      appBar: AppBar(
        // Judul AppBar menggunakan ID hardware printer
        title: Text(printer['idHardware']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar printer
            Image.network(
              'https://fixprint.id/image/cache/catalog/PRINTER%20BUNDLING%20EPSON/L3250COMP-1000x1000.png',
              width: double.infinity,
              height: 200,
            ),
            // Bagian utama berisi nama dan status printer
            Center(
              child: Column(
                children: [
                  // Nama printer
                  Text(
                    ' ${printer['name']} ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Status printer dengan ikon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${printer['status']} ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(icon, color: iconColor, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Kontainer detail printer
            Expanded(
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        // Judul bagian detail printer
                        Text('Detail Printer',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(height: 10),
                        // Bagian Divisi dan logo merk
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Divisi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    )),
                                Text(
                                  "${printer['division']}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // Logo merk printer
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(printer['merkLogo']!),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Informasi printer lainnya
                        Text(
                          '${printer['name']} ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${printer['ipAddress']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Bagian Type Tinta
                        Text('Type Tinta',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                        Text('${printer['tinta']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                        SizedBox(height: 10),
                        // Bagian Type Printer
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Type Printer',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    )),
                                Text('${printer['type']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Bagian Serial Number
                        Text('Serial Number',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                        Text('${printer['serialNumber']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        // Tombol Edit
                        CustomButton(
                            text: "Edit",
                            onPressed: () {
                              _showEditPopup(context);
                            },
                            isPrimary: false)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan popup Edit Printer
  void _showEditPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Printer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Input untuk Divisi
              TextField(
                decoration: InputDecoration(labelText: 'Divisi'),
                controller: TextEditingController(text: printer['division']),
              ),
              // Input untuk IP Address
              TextField(
                decoration: InputDecoration(labelText: 'IP Address'),
                controller: TextEditingController(text: printer['ipAddress']),
              ),
              // Dropdown untuk Status Printer
              DropdownButtonFormField<String>(
                value: printer['status'],
                items: ['Active', 'Inactive', 'Service']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                onChanged: (value) {},
                decoration: InputDecoration(labelText: 'Status Printer'),
              ),
            ],
          ),
          actions: [
            // Tombol Cancel
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            // Tombol Save
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan data
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
