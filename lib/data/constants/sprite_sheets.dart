import 'package:bonfire/bonfire.dart';
import 'package:bonfire_crash_course/data/constants/globals.dart';

class SpriteSheets {
  static late SpriteSheet itemBlocksSpriteSheet;
  static late SpriteSheet goombaSpriteSheet;
  static late SpriteSheet terrainSpriteSheet;

  static Future<void> load() async {
    // Item Blocks Sprite Sheet
    final itemBlocksSpriteSheetImage = await Flame.images.load(
      Globals.blocksSpriteSheet,
    );
    itemBlocksSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: itemBlocksSpriteSheetImage,
      columns: 28,
      rows: 16,
    );

    // Goomba Sprite Sheet
    final goombaSpriteSheetImage = await Flame.images.load(
      Globals.goombaSpriteSheet,
    );
    goombaSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: goombaSpriteSheetImage,
      columns: 3,
      rows: 1,
    );

    // Terrain Sprite Sheet
    final terrainSpriteSheetImage = await Flame.images.load(
      Globals.terrainSpriteSheet,
    );
    terrainSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: terrainSpriteSheetImage,
      columns: 17,
      rows: 11,
    );
  }
}
