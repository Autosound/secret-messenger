import 'package:matrix/matrix.dart';

class MatrixService {
  MatrixService._();
  static final MatrixService _instance = MatrixService._();

  factory MatrixService() => _instance;

  static Client client = Client('SecretMessenger');
}
