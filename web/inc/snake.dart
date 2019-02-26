import 'common.dart';
import '../main.dart';

import 'dart:html';
import 'dart:math';

class Snake {
  static const Point LEFT = const Point(-1, 0);  
  static const Point RIGHT = const Point(1, 0);  
  static const Point UP = const Point(0, -1);  
  static const Point DOWN = const Point(0, 1);

  static const int START_LENGTH = 6; 

  // coordinates of the body segments
  List<Point> _body; 

  // current travel direction
  Point _dir = RIGHT; 

  Point get head => _body.first;  

  Snake() {  
    int i = START_LENGTH - 1;
    _body = new List<Point>.generate(START_LENGTH,
      (int index) => new Point(i--, 0));
  }

  void _checkInput() {  
    if (keyboard.isPressed(KeyCode.LEFT) && _dir != RIGHT) {
      _dir = LEFT;
    }
    else if (keyboard.isPressed(KeyCode.RIGHT) && _dir != LEFT) {
      _dir = RIGHT;
    }
    else if (keyboard.isPressed(KeyCode.UP) && _dir != DOWN) {
      _dir = UP;
    }
    else if (keyboard.isPressed(KeyCode.DOWN) && _dir != UP) {
      _dir = DOWN;
    }
  }

  void grow() {  
    // add new head based on current direction
    _body.insert(0, head + _dir);
  }

  void _move() {  
    // add a new head segment
    grow();

    // remove the tail segment
    _body.removeLast();
  }

  void _draw() {  
    // starting with the head, draw each body segment
    for (Point p in _body) {
      drawCell(p, "green");
    }
  }

  bool checkForBodyCollision() {  
    for (Point p in _body.skip(1)) {
      if (p == head) {
        return true;
      }
    }

    return false;
  }

  void update() {  
    _checkInput();
    _move();
    _draw();
  }
}