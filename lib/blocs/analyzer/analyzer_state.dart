part of 'analyzer_cubit.dart';

abstract class AnalyzerState {}

class AnalyzerInitial extends AnalyzerState {}

class AnalyzerLoaded extends AnalyzerState {
  HistoryItem item;
  AnalyzerLoaded(this.item);
}

class AnalyzerError extends AnalyzerState {
  HerbariaException exception;
  AnalyzerError(this.exception);
}
