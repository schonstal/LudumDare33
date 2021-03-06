package;

import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

class MainMenuGroup extends FlxSpriteGroup {
  var buttons:Array<MainMenuButton>;
  var selectedIndex:Int = 1;

  public var startGame:Void->Void;
  public var showOptions:Int->Void;
  public var startHardMode:Void->Void;

  public function new():Void {
    super();

    if (Reg.hardMode) selectedIndex = 2;

    buttons = new Array<MainMenuButton>();
    buttons[0] = new MainMenuButton("options", function() { showOptions(0); });
    buttons[1] = new MainMenuButton("start", function() { startGame(); });
    buttons[2] = new MainMenuButton("extreme", function() { startHardMode(); });

    for (i in (0...3)) {
      buttons[i].x = (i + 1) * 80;
      add(buttons[i]);
    }
  }

  public function initialize(index:Int = 1):Void {
    for (button in buttons) {
      button.initialize();
    }
    selectedIndex = index;
    exists = true;
  }

  public override function update(elapsed:Float):Void {
    buttons[selectedIndex].select();
    for (i in (0...3)) {
      if (Reg.mouseSelect && buttons[i].overlapsMouse()) {
        selectedIndex = i;
        if (FlxG.mouse.justPressed) buttons[i].activate();
      }
      if (i == selectedIndex) {
        buttons[i].select();
        if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE) buttons[i].activate();
      } else {
        buttons[i].deselect();
      }
    }

    if (FlxG.keys.justPressed.LEFT) selectedIndex--;
    if (FlxG.keys.justPressed.RIGHT) selectedIndex++;
    if (selectedIndex < 0) selectedIndex = buttons.length - 1;
    if (selectedIndex >= buttons.length) selectedIndex = 0;

    super.update(elapsed);
  }
}
