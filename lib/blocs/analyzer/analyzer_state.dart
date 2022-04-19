part of 'analyzer_cubit.dart';

abstract class AnalyzerState {}

class AnalyzerInitial extends AnalyzerState {}

class AnalyzerLoaded extends AnalyzerState {
  String plantName;
  AnalyzerLoaded(this.plantName);
}
