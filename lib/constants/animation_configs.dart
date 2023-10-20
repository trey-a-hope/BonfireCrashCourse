import 'package:bonfire/bonfire.dart';
import 'package:bonfire_crash_course/constants/globals.dart';
import 'package:bonfire_crash_course/constants/sprite_sheets.dart';

class AnimationConfigs {
  AnimationConfigs._();

  static GoombaAnimationConfigs goomba = GoombaAnimationConfigs();
  static MarioAnimationConfigs mario = MarioAnimationConfigs();
  static SuperMarioAnimationConfigs superMario = SuperMarioAnimationConfigs();

  static BlockConfigs block = BlockConfigs();
}

class BlockConfigs {
  SpriteAnimation mysteryBlockIdle() => SpriteAnimation.variableSpriteList(
      List<Sprite>.generate(
          3,
          (index) =>
              SpriteSheets.itemBlocksSpriteSheet.getSprite(8, 5 + index)),
      stepTimes:
          List<double>.generate(3, (index) => Globals.mysteryBlockStepTime));

  SpriteAnimation mysteryBlockHit() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.itemBlocksSpriteSheet.getSprite(7, 8)],
        stepTimes: [Globals.mysteryBlockStepTime],
      );

  SpriteAnimation brickBlockIdle() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.itemBlocksSpriteSheet.getSprite(7, 17)],
        stepTimes: [Globals.mysteryBlockStepTime],
      );

  SpriteAnimation brickBlockHit() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.itemBlocksSpriteSheet.getSprite(7, 19)],
        stepTimes: [double.infinity],
      );
}

class GoombaAnimationConfigs {
  SpriteAnimation walking() => SpriteAnimation.variableSpriteList(
      List<Sprite>.generate(
          2, (index) => SpriteSheets.goombaSpriteSheet.getSprite(0, index)),
      stepTimes:
          List<double>.generate(2, (index) => Globals.goombaSpriteStepTime));

  SpriteAnimation dead() => SpriteAnimation.variableSpriteList(
        [SpriteSheets.goombaSpriteSheet.getSprite(0, 2)],
        stepTimes: [Globals.goombaSpriteStepTime],
      );
}

class MarioAnimationConfigs {
  Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "mario_idle.gif",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: Globals.marioSpriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );

  Future<SpriteAnimation> get runRight {
    Future<Sprite> marioWalk1 =
        Sprite.load("mario_1_walk.gif", srcSize: Vector2(32, 32));
    Future<Sprite> marioWalk2 =
        Sprite.load("mario_2_walk.gif", srcSize: Vector2(32, 32));
    Future<Sprite> marioWalk3 =
        Sprite.load("mario_3_walk.gif", srcSize: Vector2(32, 32));

    return Future.wait([marioWalk1, marioWalk2, marioWalk3]).then(
      (value) => SpriteAnimation.spriteList([value[0], value[1], value[2]],
          stepTime: Globals.marioSpriteStepTime),
    );
  }

  Future<SpriteAnimation> get jumping => SpriteAnimation.load(
        "mario_jump.gif",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: Globals.marioSpriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );
}

class SuperMarioAnimationConfigs {
  Future<SpriteAnimation> idle() async =>
      SpriteAnimation.spriteList([await Sprite.load(Globals.superMarioIdle)],
          stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> walking() async => SpriteAnimation.spriteList(
      await Future.wait([1, 2, 3]
          .map((i) => Sprite.load('super_mario_walk_$i.gif'))
          .toList()),
      stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> climbing() async => SpriteAnimation.spriteList(
      await Future.wait(
          [1, 2].map((i) => Sprite.load('super_mario_climb_$i.gif')).toList()),
      stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> swiming() async => SpriteAnimation.spriteList(
      await Future.wait([1, 2, 3, 4, 5, 6]
          .map((i) => Sprite.load('super_mario_swim_$i.gif'))
          .toList()),
      stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> jumping() async =>
      SpriteAnimation.spriteList([await Sprite.load(Globals.superMarioJump)],
          stepTime: Globals.marioSpriteStepTime);

  Future<SpriteAnimation> ducking() async =>
      SpriteAnimation.spriteList([await Sprite.load(Globals.superMarioDuck)],
          stepTime: Globals.marioSpriteStepTime);
}
