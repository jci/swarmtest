import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.tweens.motion.LinearMotion;

class MainScene extends Scene
{
	public override function begin()
	{
		init();


	}

	public function init()
	{
		var i : Int;
		for (i in 1...100)
		{
			var particle = new Bird();
			this.add(particle);
		}
	}

	public override function update()
	{
		super.update();

	}

}

class Bird extends Entity
{

	var image : Image;
	var update_elapsed : Float;
	public static inline var elaps = 0.03;
	var velX : Float;
	var velY : Float;
	var tween : LinearMotion;
	var obeyX : Float;
	var obeyY : Float;
	var range : Int = 10;
	var redrawme :Float = elaps;

	public override function new()
	{
		super(x,y);
		init();
	}

	public function init()
	{
		image = new Image("graphics/awesome-1.png");
		image.scale = 0.4;
		graphic = image;
		x=Math.random()*HXP.width;
		y=Math.random()*HXP.height;

		velX = 0;
		velY = 0;


	}



	public override function update()
	{




			x += velX;
			y += velY;

			var rposx = Math.abs(x - Input.mouseX);
			var rposy = Math.abs(y - Input.mouseY);

			var distance = Math.sqrt( rposx * rposx + rposy * rposy);

			var accel :Float = 0;

			if (distance > 100)
			{
				accel = 0.1;

			}
			else
			{
				accel = 0.4 ;
			}

			// the farthest, the fastest


			if (x < Input.mouseX)
			{
				velX += accel;
				if (velX < 0)
					velX +=1;
			}

			if (x > Input.mouseX)
			{
				velX -= accel;

				if (velX >0) 
					velX -=1;
			}

			if (y < Input.mouseY)
			{
				velY += accel;
				if (velY<0)
					velY +=1;
			}

			if (y > Input.mouseY)
			{
				velY -= accel;
				if (velY>0)
					velY-=1;
			}

			if (Math.round(x/2) == Math.round(Input.mouseX/2) || Math.round(y/2)==Math.round(Input.mouseY/2))
			{
				velX += Math.random()*range-range/2;
				velY += Math.random()*range-range/2;
			}

		super.update();
	}

}
