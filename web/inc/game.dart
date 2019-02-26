import 'common.dart';
import 'snake.dart';
import '../main.dart';

import 'dart:html';
import 'dart:math';
import 'dart:async'; 

class Game {
  // smaller numbers make the game run faster
  static const num GAME_SPEED = 60;  

  num _lastTimeStamp = 0;  

  // a few convenience variables to simplify calculations
  int _rightEdgeX;  
  int _bottomEdgeY;

  Snake _snake;  
  Point _food;  

  Game() {  
    _rightEdgeX = canvas.width ~/ CELL_SIZE;
    _bottomEdgeY = canvas.height ~/ CELL_SIZE;

    init();
  }

  void init() {  
    _snake = new Snake();
    _food = _randomPoint();
  }

  Point _randomPoint() {  
    Random random = new Random();
    return new Point(
      random.nextInt(_rightEdgeX),
      random.nextInt(_bottomEdgeY)
    );
  }

  void _checkForCollisions() {  
    // check for collision with food
    if (_snake.head == _food) {
      _snake.grow();
      _food = _randomPoint();
    }

    // check death conditions
    if (_snake.head.x <= -1 ||
      _snake.head.x >= _rightEdgeX ||
      _snake.head.y <= -1 ||
      _snake.head.y >= _bottomEdgeY ||
      _snake.checkForBodyCollision()) {
      init();
    }
  }

  Future run() async {  
    update(await window.animationFrame);
  }

  void update(num delta) {  
    final num diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      clear();
      drawCell(_food, "blue");
      _snake.update();
      _checkForCollisions();
    }

    // keep looping
    run();
  }
}