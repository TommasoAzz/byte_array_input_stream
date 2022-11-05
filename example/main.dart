import 'dart:typed_data';

import 'package:byte_array_input_stream/byte_array_input_stream.dart';

void parseBytes(Uint8List bytes, Endian endian) {
  final bais = ByteArrayInputStream.from(bytes, endian);

  print(bais.readUint8());

  print(bais.readInt8());

  print(bais.readDouble());

  bais.skip(10);

  print(bais.readUint32());
}
