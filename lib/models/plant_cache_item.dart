abstract class PlantCacheItem {
  String plantCode;
  String plantTitle;
  String description;
  List<String> imagesAssetLocations;
  PlantCacheItem(
    this.plantCode,
    this.plantTitle,
    this.description,
    this.imagesAssetLocations,
  );
}
