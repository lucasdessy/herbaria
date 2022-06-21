class AiResponse {
  String plantCode;
  String accuracy;
  AiResponse(this.plantCode, this.accuracy);

  factory AiResponse.fromJson(Map<String, dynamic> json) {
    return AiResponse(json["plant"].toString(), json["accuracy"].toString());
  }
  @override
  String toString() {
    return "AiResponse: $plantCode - $accuracy";
  }
}
