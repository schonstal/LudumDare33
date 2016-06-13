package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.math.FlxPoint;

class GameOverGroup extends FlxSpriteGroup {
  var scoreText:FlxBitmapText;
  var highScoreText:FlxBitmapText;

  var scoreLabel:FlxSprite;
  var highScoreLabel:FlxSprite;
  var gameOverSprite:FlxSprite;

  var restartButtons:RestartButtonGroup;

  public function new():Void {
    super();

    var font = FlxBitmapFont.fromMonospace(
      "assets/images/fonts/numbers2x.png",
      "0123456789",
      new FlxPoint(16, 16)
    );

    gameOverSprite = new FlxSprite();
    gameOverSprite.loadGraphic("assets/images/gameOver.png");
    add(gameOverSprite);

    restartButtons = new RestartButtonGroup();
    restartButtons.exists = true;
    add(restartButtons);

    scoreLabel = new FlxSprite(4, 94);
    scoreLabel.loadGraphic("assets/images/scoreFinal.png");
    add(scoreLabel);

    scoreText = new FlxBitmapText(font);
    scoreText.letterSpacing = -2;
    scoreText.text = "0";
    scoreText.x = 4;
    scoreText.y = scoreLabel.y + 6;
    add(scoreText);

    highScoreLabel = new FlxSprite(0, scoreText.y + 20);
    highScoreLabel.loadGraphic("assets/images/best.png");
    highScoreLabel.x = FlxG.width/2 - highScoreLabel.width/2;
    add(highScoreLabel);

    highScoreText = new FlxBitmapText(font);
    highScoreText.letterSpacing = -2;
    highScoreText.text = "0";
    highScoreText.x = FlxG.width/2 - 8;
    highScoreText.y = highScoreLabel.y + 6;
    add(highScoreText);
  }

  public override function update(elapsed:Float):Void {
    scoreText.text = "" + Reg.score;

    if (Reg.hardMode) {
      highScoreText.text = "" + FlxG.save.data.hardHighScore;
    } else {
      highScoreText.text = "" + FlxG.save.data.highScore;
    }

    var X:Float = scoreText.width > highScoreText.width ? scoreText.width : highScoreText.width;
    scoreText.x = FlxG.width/2 - X/2;
    highScoreText.x = FlxG.width/2 - X/2;

    highScoreLabel.x = highScoreText.x;
    scoreLabel.x = scoreText.x;

    super.update(elapsed);
  }
}
