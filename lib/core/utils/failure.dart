import 'dart:async';
import '../../config/constants.dart';

class Failure {
  const Failure({
    this.title = '',
    required this.message
  });

  final String title;
  final String message;

  factory Failure.fromException(Object e){
    return Failure(message: _getErrorMessage(e));
  }

  static String _getErrorMessage(Object e){
    switch(e){
      case FormatException:{
        return 'FormatException';
      }

      case TimeoutException:{
        return 'TimeoutException';
      }

      case String:{
        return e as String;
      }

      default: {
        //TODO: agregar libreria
        return 'error';//Constants.labels.unexpectedError;
      }
    }
  }
}