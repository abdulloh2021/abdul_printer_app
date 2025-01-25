import 'package:abdul_printer_app/controller/auth_controller.dart';
import 'package:abdul_printer_app/controller/printer_controller.dart';
import 'package:abdul_printer_app/model/printers_model.dart';
import 'package:abdul_printer_app/view/loginpage_view.dart';
import 'package:abdul_printer_app/view/printerdetailspage_view.dart';
import 'package:abdul_printer_app/view/profilepage_view.dart';
import 'package:abdul_printer_app/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_plus/flutter_barcode_scanner_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterspageView extends StatefulWidget {
  const PrinterspageView({super.key});

  @override
  State<PrinterspageView> createState() => _PrinterspageViewState();
}

class _PrinterspageViewState extends State<PrinterspageView> {
  // Controller untuk autentikasi
  final AuthController _authController = AuthController();
  // Controller untuk mengelola data printer
  final PrinterController _controller = PrinterController();
  String searchQuery = ''; // Query pencarian
  String _scanBarcode = ''; // Hasil scan barcode/QR

  String? _username; // Nama pengguna dari shared preferences
  String? _image; // Gambar pengguna dari shared preferences

  // Memuat data pengguna yang disimpan di SharedPreferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
      _image = prefs.getString('image');
    });
  }

  // Fungsi untuk memindai QR code
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      // Mengambil data printer berdasarkan hasil scan
      PrintersModel hasilScan = _controller.getPrinterById(barcodeScanRes);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PrintersdetailspageView(printer: {
            'idHardware': hasilScan.idHardware,
            'name': hasilScan.name,
            'type': hasilScan.type,
            'division': hasilScan.division,
            'merk': hasilScan.merk,
            'merkLogo': hasilScan.merkLogo,
            'status': hasilScan.status,
            'tinta': hasilScan.tinta,
            'vendor': hasilScan.vendor,
            'ipAddress': hasilScan.ipAddress,
            'serialNumber': hasilScan.serialNumber,
          }),
        ),
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Fungsi logout pengguna
  Future<void> _logout() async {
    await _authController.logout(); // Logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginpageView()), // Arahkan ke login
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Memuat data pengguna saat widget pertama kali dibuat
  }

  @override
  Widget build(BuildContext context) {
    final List<PrintersModel> filteredPrinters = _controller
        .searchPrinters(searchQuery); // Filter printer berdasarkan query

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Printers", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigasi ke halaman profil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilepageView()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout, // Fungsi logout
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: scanQR, // Pindai QR code saat tombol ditekan
        label: Text("Scan", style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          // Bagian atas halaman dengan latar biru
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // Menampilkan nama pengguna
                  Text(
                    "Welcome, $_username",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Manage your printer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Input pencarian
                  CustomSearchField(
                    labelText: 'Search',
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Daftar printer
          Padding(
              padding: const EdgeInsets.only(top: 170),
              child: ListView.builder(
                itemCount: filteredPrinters.length,
                itemBuilder: (context, index) {
                  final PrintersModel printer = filteredPrinters[index];

                  // Menentukan ikon berdasarkan status printer
                  IconData icon;
                  Color iconColor;
                  switch (printer.status) {
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

                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail printer saat item diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PrintersdetailspageView(printer: {
                            'idHardware': printer.idHardware,
                            'name': printer.name,
                            'type': printer.type,
                            'division': printer.division,
                            'merk': printer.merk,
                            'merkLogo': printer.merkLogo,
                            'status': printer.status,
                            'tinta': printer.tinta,
                            'vendor': printer.vendor,
                            'ipAddress': printer.ipAddress,
                            'serialNumber': printer.serialNumber,
                          }),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 227, 225, 225)
                                .withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Menampilkan informasi printer
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  printer.idHardware,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  printer.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  printer.ipAddress + ' - ' + printer.tinta,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Icon(icon, color: iconColor, size: 30),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
