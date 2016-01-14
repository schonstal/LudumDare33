import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.text.FlxText.FlxTextAlign;
import flixel.util.FlxSpriteUtil;

class MenuText extends FlxBitmapText {
  public function new(content:String, X:Float = 0, Y:Float = 0):Void {
    var font = FlxBitmapFont.fromMonospace(
      "assets/images/fonts/alphabetMono.png",
      "abcdefghijklmnopqrstuvwxyz",
      new FlxPoint(8, 9)
    );

    super(font);

    letterSpacing = -1;
    text = content;

    deselect();
  }

  public override function update(elapsed:Float):Void {
    super.update(elapsed);
  }

  public function select():Void {
    color = 0xffffffff;
    scale.x = scale.y = 2;
  }

  public function deselect():Void {
    color = 0xff9777a1;
    scale.x = scale.y = 1;
  }
}
