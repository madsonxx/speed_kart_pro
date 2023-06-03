part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const ADDETAPA = _Paths.ADDETAPA;
  static const ADDMASTER = _Paths.ADDMASTER;
  static const CARDEPETA = _Paths.CARDETAPA;
  static const ADDGRADUADOS = _Paths.ADDGRADUADOS;
}

abstract class _Paths {
  static const HOME = '/home';
  static const ADDETAPA = '/addEtapa';
  static const ADDMASTER = '/addPilotos';
  static const CARDETAPA = '/cardEtapa';
  static const ADDGRADUADOS = '/addGraduados';
}
