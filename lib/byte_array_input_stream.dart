library byte_array_input_stream;

import 'dart:typed_data';

class ByteArrayInputStream {
  final Uint8List _bytes;
  final Endian _endian;
  int _offset;

  ByteArrayInputStream.from(Uint8List bytes, Endian endian)
      : _bytes = bytes,
        _endian = endian,
        _offset = 0;

  int get available => _bytes.length - _offset;

  T read<T>(int size, T parser(Uint8List l, Endian e)) {
    assert(available >= size);
    T ret = parser(_bytes.sublist(_offset, _offset + size), _endian);

    _offset += size;

    return ret;
  }

  void skip(int size) {
    assert(available >= size);
    _offset += size;
  }

  int readInt8() => read(1, (l, e) => new ByteData.view(l.buffer).getInt8(0));
  int readUint8() => read(1, (l, e) => new ByteData.view(l.buffer).getUint8(0));

  int readInt16() => read(2, (l, e) => new ByteData.view(l.buffer).getInt16(0, e));
  int readUint16() => read(2, (l, e) => new ByteData.view(l.buffer).getUint16(0, e));

  int readInt32() => read(4, (l, e) => new ByteData.view(l.buffer).getInt32(0, e));
  int readUint32() => read(4, (l, e) => new ByteData.view(l.buffer).getUint32(0, e));

  int readInt64() => read(4, (l, e) => new ByteData.view(l.buffer).getInt64(0, e));
  int readUint64() => read(4, (l, e) => new ByteData.view(l.buffer).getUint64(0, e));

  double readFloat() => read(4, (l, e) => new ByteData.view(l.buffer).getFloat32(0, e));

  double readDouble() => read(8, (l, e) => new ByteData.view(l.buffer).getFloat64(0, e));

  List<int> readUint8List(int size) => read(size, (l, e) => l);

  List<int> readUint16List(int size) => read(size, (l, e) {
        final byteData = new ByteData.view(l.buffer);
        final ret = <int>[];
        for (int i = 0; i < l.length; i = i + 2) {
          ret.add(byteData.getUint16(i, e));
        }
        return ret;
      });
}
