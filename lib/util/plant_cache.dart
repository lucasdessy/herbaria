import 'package:herbaria/models/exceptions.dart';

import '../models/plant_cache_item.dart';

class PlantCache {
  PlantCacheItem operator [](String key) {
    switch (key) {
      case 'caesalpinia_pulcherrima':
        return _CaesalpiniaPulcherrima();
      case 'crotalaria_retusa':
        return _CrotalariaRetusa();
      case 'chamaecrista_desvauxii':
        return _ChamaecristaDesvauxii();
      case 'hymenaea_velutina':
        return _HymeneaeVelutina();
      case 'leucaena_leucocephala':
        return _LeucaenaLeucocephala();
    }
    throw HerbariaException('Planta não encontrada no catálogo.',
        'A planta $key não foi encontrada no catálogo local do app.');
  }
}

class _CaesalpiniaPulcherrima extends PlantCacheItem {
  _CaesalpiniaPulcherrima()
      : super(
          'caesalpinia_pulcherrima',
          'Caesalpinia pulcherrima',
          ''' 
Os espinhos estão presentes no caule
As folhas são bipinadas, pois são dividias em duas pinas
A folha possui ápice obtuso, curtamente mucronado
Base da folha assimétrica, com margem inteira
O fruto possui ápice acuminado
  ''',
          ['assets/flor_teste.png'],
        );
}

class _CrotalariaRetusa extends PlantCacheItem {
  _CrotalariaRetusa()
      : super(
          'crotalaria_retusa',
          'Crotalaria retusa',
          ''' 
O pecíolo não é tão desenvolvido nesta espécie
O ápice das folhas são mais arredondados
  ''',
          ['assets/flor_teste.png'],
        );
}

class _ChamaecristaDesvauxii extends PlantCacheItem {
  _ChamaecristaDesvauxii()
      : super(
          'chamaecrista_desvauxii',
          'Chamaecrista desvauxii',
          ''' 
O formato do ápice nessa espécie varia muito, entre: agudo, arredondado ou truncado
Possui dois pares de folíolos
Folha possui base assimétrica
No fruto, há presença de muitos tricomas, estruturas parecidas com pelos
  ''',
          ['assets/flor_teste.png'],
        );
}

class _HymeneaeVelutina extends PlantCacheItem {
  _HymeneaeVelutina()
      : super(
          'hymenaea_velutina',
          'Hymeneae velutina',
          ''' 
Caule em escama
A folha possui dois folíolos
  ''',
          ['assets/flor_teste.png'],
        );
}

class _LeucaenaLeucocephala extends PlantCacheItem {
  _LeucaenaLeucocephala()
      : super(
          'leucaena_leucocephala',
          'Leucaena leucocephala',
          ''' 
Nectário presente no pecíolo
Fruto possui ápice agudo
As folhas são bipinadas
  ''',
          ['assets/flor_teste.png'],
        );
}
