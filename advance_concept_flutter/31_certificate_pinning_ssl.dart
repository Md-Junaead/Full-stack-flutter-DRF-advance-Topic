// 31_certificate_pinning_ssl.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

void setupCertificatePinning(Dio dio) {
  const String expectedFingerprint = "SHA256_FINGERPRINT_HASH_HERE";

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // Validate SHA-256 fingerprint of the server's certificate
      return cert.sha256.map((e) => e.toRadixString(16).padLeft(2, '0')).join('') == expectedFingerprint;
    };
    return client;
  };
}