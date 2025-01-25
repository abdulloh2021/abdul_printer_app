import 'package:abdul_printer_app/model/printers_model.dart';

class PrinterController {
  final List<PrintersModel> printers = [
    PrintersModel(
      idHardware: 'DET001401',
      name: 'HP LaserJet Pro MFP 225dw',
      merk: 'HP',
      merkLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/768px-HP_logo_2012.svg.png',
      type: 'Black and White',
      division: 'IT',
      status: 'Service',
      tinta: 'Toner 17A',
      vendor: 'Mitra Integrasi Informatika',
      ipAddress: '172.16.4.200',
      serialNumber: 'IDN123456',
    ),
    PrintersModel(
      idHardware: 'DET001402',
      name: 'HP LaserJet Pro MFP M130a',
      merk: 'HP',
      merkLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/768px-HP_logo_2012.svg.png',
      type: 'Black and White',
      division: 'PGA',
      status: 'Inactive',
      tinta: 'Toner 17A',
      vendor: 'Mitra Integrasi Informatika',
      ipAddress: '172.16.4.201',
      serialNumber: 'IDN123457',
    ),
    PrintersModel(
      idHardware: 'DET001403',
      name: 'Epson LQ-2190',
      merk: 'Epson',
      merkLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/768px-HP_logo_2012.svg.png',
      type: 'Black and white',
      division: 'IMPORT',
      status: 'Active',
      tinta: 'Cartridge',
      vendor: '-',
      ipAddress: '-',
      serialNumber: 'IDN123458',
    ),

    PrintersModel(
      idHardware: 'DET001404',
      name: 'Epson L3110',
      merk: 'Epson',
      merkLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/768px-HP_logo_2012.svg.png',
      type: 'Color',
      division: 'FINANCE',
      status: 'Service',
      tinta: 'Tinta 003',
      vendor: '-',
      ipAddress: '-',
      serialNumber: 'IDN123459',
    ),
    PrintersModel(
      idHardware: 'DET001405',
      name: 'HP LaserJet Pro 426fdn',
      merk: 'HP',
      merkLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/768px-HP_logo_2012.svg.png',
      type: 'Black and White',
      division: 'EXPORT',
      status: 'Active',
      tinta: 'Toner 26A',
      vendor: 'Mitra Teknologi Informatika',
      ipAddress: '172.16.21.100',
      serialNumber: 'IDN123460',
    ),

    // Tambahkan data printer lainnya
  ];

  List<PrintersModel> searchPrinters(String query) {
    return printers
        .where((printer) =>
            printer.idHardware.toLowerCase().contains(query.toLowerCase()) ||
            printer.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  PrintersModel getPrinterById(String id) {
    return printers.firstWhere((printer) => printer.idHardware == id);
  }
}
