import 'dart:io';
import 'dart:convert';
import 'dart:async';

class FileStream
{
  stream(String filename) async {
    var config = new File(filename);
    Stream<List<int>> inputStream = config.openRead();

    var lines = inputStream
        .transform(Utf8Decoder())
        .transform(new LineSplitter());
    try {
      await for (var line in lines) {
        print(line);
      }
    } catch(e) {
      print(e);
    }
  }
}
