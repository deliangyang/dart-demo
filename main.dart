import 'package:dartdemo/file_stream.dart';
import 'package:http/http.dart' as http;
import 'dart:mirrors';

import 'package:dartdemo/todo.dart';
import 'package:dartdemo/math.dart';
import 'dart:convert';

Future main() async {
//  var response = await http.get('https://www.baidu.com');
//  print('response statue: ${response.statusCode}');
//  print('response body: ${response.body}');
  //print(await http.read('https://www.baidu.com'));

  var math = Math();
  print(math.add(1, 2));

  ClassMirror classMirror = reflectClass(Math);

  classMirror.declarations.forEach((Symbol key, DeclarationMirror value) {
    if (value is MethodMirror) {
      value.metadata.forEach((metadata) {
        print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
      });
    }

  });

  FileStream fileStream = new FileStream();
  fileStream.stream("main.dart");

}
