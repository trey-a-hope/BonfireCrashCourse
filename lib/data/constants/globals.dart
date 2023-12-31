class Globals {
  Globals._();

  /// Sounds
  static const String bumpSFX = 'smb_bump.wav';
  static const String jumpSmallSFX = 'smb_jump-small.wav';
  static const String pauseSFX = 'smb_pause.wav';
  static const String powerUpAppearsSFX = 'smb_powerup_appears.wav';
  static const String breakBlockSFX = 'smb_breakblock.wav';

  /// Step Times
  static const double marioSpriteStepTime = 0.075;
  static const double goombaSpriteStepTime = 0.4;
  static const double mysteryBlockStepTime = 0.2;
  static const double brickBlockStepTime = 0.2;

  /// Sizes
  static const double tileSize = 16;
  static const double newTileSize = 32;

  /// Levels
  // static const lv_1_1 = 'world_1_1_map.tmx';
  static const lv_1_1 = 'world_1_1_map.json';

  /// Sprite Sheets
  static const String blocksSpriteSheet = 'blocks_spritesheet.png';
  static const String goombaSpriteSheet = 'goomba_spritesheet.png';
  static const String terrainSpriteSheet = 'terrain_tilesheet.png';

  /// Images
  static const String marioIdle = 'mario_idle.gif';
  static const String marioDead = 'mario_dead.gif';
  static const String marioJump = 'mario_jump.gif';
  static const String magicMushroom = 'magic_mushroom.png';

  static const String superMarioIdle = 'super_mario_idle.gif';
  static const String superMarioJump = 'super_mario_jump.gif';
  static const String superMarioDuck = 'super_mario_duck.gif';
  static const String superMarioSkid = 'super_mario_skid.gif';
}
