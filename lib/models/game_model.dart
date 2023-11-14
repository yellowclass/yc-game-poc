import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  String background;
  Parallax parallax;
  Player player;
  List<Obstacle> obstacles;

  GameModel({
    required this.background,
    required this.parallax,
    required this.player,
    required this.obstacles,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    background: json["background"],
    parallax: Parallax.fromJson(json["parallax"]),
    player: Player.fromJson(json["player"]),
    obstacles: List<Obstacle>.from(json["obstacles"].map((x) => Obstacle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "background": background,
    "parallax": parallax.toJson(),
    "player": player.toJson(),
    "obstacles": List<dynamic>.from(obstacles.map((x) => x.toJson())),
  };
}

class Obstacle {
  Sprites sprites;
  List<double> position;
  List<double> size;
  List<double> hitboxRelation;
  List<double> hitboxSizeDivider;
  String collisionMessage;

  Obstacle({
    required this.sprites,
    required this.position,
    required this.size,
    required this.hitboxRelation,
    required this.hitboxSizeDivider,
    required this.collisionMessage,
  });

  factory Obstacle.fromJson(Map<String, dynamic> json) => Obstacle(
    sprites: Sprites.fromJson(json["sprites"]),
    position: List<double>.from(json["position"].map((x) => x)),
    size: List<double>.from(json["size"].map((x) => x)),
    hitboxRelation: List<double>.from(json["hitboxRelation"].map((x) => x?.toDouble())),
    hitboxSizeDivider: List<double>.from(json["hitboxSizeDivider"].map((x) => x?.toDouble())),
    collisionMessage: json["collisionMessage"],
  );

  Map<String, dynamic> toJson() => {
    "sprites": sprites.toJson(),
    "position": List<dynamic>.from(position.map((x) => x)),
    "size": List<dynamic>.from(size.map((x) => x)),
    "hitboxRelation": List<dynamic>.from(hitboxRelation.map((x) => x)),
    "hitboxSizeDivider": List<dynamic>.from(hitboxSizeDivider.map((x) => x)),
    "collisionMessage": collisionMessage,
  };
}

class Sprites {
  SpriteModel run;
  SpriteModel idle;
  SpriteModel walk;

  Sprites({
    required this.run,
    required this.idle,
    required this.walk,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    run: SpriteModel.fromJson(json["run"]),
    idle: SpriteModel.fromJson(json["idle"]),
    walk: SpriteModel.fromJson(json["walk"]),
  );

  Map<String, dynamic> toJson() => {
    "run": run.toJson(),
    "idle": idle.toJson(),
    "walk": walk.toJson(),
  };
}

class SpriteModel {
  String url;
  List<double> spriteSectionSize;
  int row;
  double stepTime;

  SpriteModel({
    required this.url,
    required this.spriteSectionSize,
    required this.row,
    required this.stepTime,
  });

  factory SpriteModel.fromJson(Map<String, dynamic> json) => SpriteModel(
    url: json["url"],
    spriteSectionSize: List<double>.from(json["spriteSectionSize"].map((x) => x)),
    row: json["row"],
    stepTime: json["stepTime"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "spriteSectionSize": List<dynamic>.from(spriteSectionSize.map((x) => x)),
    "row": row,
    "stepTime": stepTime,
  };
}

class Parallax {
  List<String> layers;
  List<double> baseVelocity;
  List<double> velocityMultiplier;

  Parallax({
    required this.layers,
    required this.baseVelocity,
    required this.velocityMultiplier,
  });

  factory Parallax.fromJson(Map<String, dynamic> json) => Parallax(
    layers: List<String>.from(json["layers"].map((x) => x)),
    baseVelocity: List<double>.from(json["baseVelocity"].map((x) => x)),
    velocityMultiplier: List<double>.from(json["velocityMultiplier"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "layers": List<dynamic>.from(layers.map((x) => x)),
    "baseVelocity": List<dynamic>.from(baseVelocity.map((x) => x)),
    "velocityMultiplier": List<dynamic>.from(velocityMultiplier.map((x) => x)),
  };
}

class Player {
  Sprites sprites;
  List<double> position;
  List<double> size;
  List<double> hitboxRelation;
  List<double> hitboxSizeDivider;
  double runSpeedMultiplier;
  double idlePenaltyMultiplier;
  double leftBoundaryLimit;

  Player({
    required this.sprites,
    required this.position,
    required this.size,
    required this.hitboxRelation,
    required this.hitboxSizeDivider,
    required this.runSpeedMultiplier,
    required this.idlePenaltyMultiplier,
    required this.leftBoundaryLimit,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    sprites: Sprites.fromJson(json["sprites"]),
    position: List<double>.from(json["position"].map((x) => x)),
    size: List<double>.from(json["size"].map((x) => x)),
    hitboxRelation: List<double>.from(json["hitboxRelation"].map((x) => x?.toDouble())),
    hitboxSizeDivider: List<double>.from(json["hitboxSizeDivider"].map((x) => x?.toDouble())),
    runSpeedMultiplier: json["runSpeedMultiplier"],
    idlePenaltyMultiplier: json["idlePenaltyMultiplier"],
    leftBoundaryLimit: json["leftBoundaryLimit"],
  );

  Map<String, dynamic> toJson() => {
    "sprites": sprites.toJson(),
    "position": List<dynamic>.from(position.map((x) => x)),
    "size": List<dynamic>.from(size.map((x) => x)),
    "hitboxRelation": List<dynamic>.from(hitboxRelation.map((x) => x)),
    "hitboxSizeDivider": List<dynamic>.from(hitboxSizeDivider.map((x) => x)),
    "runSpeedMultiplier": runSpeedMultiplier,
    "idlePenaltyMultiplier": idlePenaltyMultiplier,
    "leftBoundaryLimit": leftBoundaryLimit,
  };
}
