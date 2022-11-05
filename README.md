# byte_array_input_stream

Binary reader like Java's own `ByteArrayInputStrem` and `DataInputStream`.
Based on Tomonori Takao's work published on [Pub.dev](https://pub.dev/packages/byte_array_input_stream_like_java).

## Add as a dependency
```yaml
   dependencies:
   byte_array_input_stream_like_java: 0.1.0
```

## Usage
Given an instance `l` of `Uint8List`, one can use the main class of this package as follows:
```java
final bais = ByteArrayInputStream(l, Endian.host);
```
with `Endian.host` specifying which endianness the machine Dart is running on is using.  
With `bais` one can call the methods:
- `readInt8()` to read one byte (8-bit integer ranging from -128 to 127)
- `readUInt8()` to read one unsigned byte (8-bit integer ranging from 0 to 255)
- `readInt16()` to read two bytes or a "short integer" (16-bit integer)
- `readUInt16()` to read two unsigned bytes or a "short unsigned integer" (16-bit integer)
- `readInt32()` to read four bytes or an "integer" (32-bit integer)
- `readUInt32()` to read four unsigned bytes or an "unsigned integer" (32-bit integer)
- `readInt64()` to read eight bytes or a "long integer" (64-bit integer)
- `readUInt64()` to read eight unsigned bytes or a "unsigned long integer" (64-bit integer)
- `readFloat()` to read four bytes interpreted as a "single-precision floating point" (32-bit floating point)
- `readDouble()` to read eight bytes interpreted as a "double-precision floating point" (64-bit floating point)
- `readUint8List()` to read the bytes and return them as they are but in the form of a list of integers;
- `readUint16List()` to read the bytes in couples and return them as they are but in the form of a list of integers.