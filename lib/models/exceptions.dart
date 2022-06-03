class HerbariaException implements Exception {
  String title;
  String? subTitle;
  HerbariaException(this.title, [this.subTitle]);

  @override
  String toString() {
    return "HerbariaException: $title - ${subTitle ?? ""}";
  }

  HerbariaException.unknownError() : title = 'Ocorreu um erro desconhecido.';
}
