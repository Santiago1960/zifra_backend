import 'dart:io';

import 'package:puppeteer/puppeteer.dart';

void main() async {
  var b = await puppeteer.launch();
  var p = await b.newPage();
  await p.goto('https://srienlinea.sri.gob.ec/comprobantes-electronicos-internet/pages/consultas/recibidos/comprobantesRecibidos.jsf', wait: Until.networkIdle);
  var html = await p.content;
  var lines = html!.split('\n');
  for (var l in lines) {
    if (l.contains('grecaptcha') || l.contains('action')) print(l.trim());
  }
  await b.close();
  exit(0);
}
