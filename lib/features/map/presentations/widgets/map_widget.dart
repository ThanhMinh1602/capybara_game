import 'package:capybara_game/common/components/hearder/map_header.dart';
import 'package:capybara_game/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MapHeader(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.map.path,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final sprite = await loadSprite('my_sprite.png');
    final spriteComponent = SpriteComponent()
      ..sprite = sprite
      ..size = Vector2(100, 100)
      ..position = Vector2(200, 200);
    add(spriteComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update logic here
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Custom rendering here
  }
}