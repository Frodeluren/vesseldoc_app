import 'dart:io';

///Based on: https://flutter.dev/docs/cookbook/persistence/reading-writing-files
class StoreAddressService {
  Future<String> get _localPath async {
    final directory = await Directory.systemTemp.createTemp();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/address.txt');
  }

  Future<File> writeAddress(String address) async {
    final file = await _localFile;
    return file.writeAsString('$address');
  }

  Future<String> readAddress() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return '';
    }
  }
}
