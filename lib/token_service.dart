import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TokenService {
  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory(); //Directory.systemTemp.createTemp();
        return directory.path;
      }
    
      Future<File> get _localFile async {
        final path = await _localPath;
        return File('$path/token.json');
      }
    
      writeToken(String token) async {
        final file = await _localFile;
        return file.writeAsStringSync(token);
      }
    
      Future<String> readToken() async {
        try {
          final file = await _localFile;
          return await file.readAsString();
        } catch (e) {
          return '';
        }
      }

}
