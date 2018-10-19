Particle[] particles;

void setup()
{
	size(600,600);
	noStroke();
	particles = new Particle[1000];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle();
	}
    particles[0] = new JumboParticle();
	particles[1] = new OddballParticle();
}
void draw()
{
	background(0);
	for(int i = 0; i < particles.length; i++){
		particles[i].move();	
		particles[i].show();
	}
}

void mousePressed()
{
	particles = new Particle[1000];
	for(int i = 0; i < particles.length; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new JumboParticle();
	particles[1] = new OddballParticle();
}

class NormalParticle implements Particle
{
	double x, y, speed, angle;
	int myColor;
	NormalParticle(){
		x = 300;
		y = 300;
		angle = Math.random()*2*Math.PI;
		speed = Math.random()*10;
		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	void move(){
		x += (float)(Math.cos(angle) * speed);
		y += (float)(Math.sin(angle) * speed);
	}
	void show(){
		fill(myColor);
		ellipse((float)x,(float)y,2,2);
	}
}
interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particle//uses an interface
{
	double x, y, speed, angle;
	double resetX, resetY;
	int myColor;
	OddballParticle(){
		x = 300;
		y = 300;
		angle = Math.random()*2*Math.PI;
		speed = Math.random()*10;
		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	void move(){
		x += (float)(Math.cos(angle) * speed);
		y += (float)(Math.sin(angle) * speed);
		if (x>605||x<-5||y>605||y<-5){
			angle =Math.PI*(Math.random()*2);
    		speed =(Math.random()*15)+10;
    		resetX =250+100*(Math.cos(angle));
    		resetY =250+100*(Math.sin(angle));
    		x = resetX+speed*Math.cos(angle);
    		y = resetY+speed*Math.sin(angle);
		}
	}
	void show(){
		fill(myColor);
		rect((float)x,(float)y,20,20);
	}
}
class JumboParticle extends NormalParticle //uses inheritance
{
	double x, y, speed, angle;
	int myColor;
	JumboParticle(){
		x = 300;
		y = 300;
		angle = Math.random()*2*Math.PI;
		speed = Math.random()*10;
		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	void move(){
		x += (float)(Math.cos(angle) * speed);
		y += (float)(Math.sin(angle) * speed);
	}
	void show(){
		fill(myColor);
		ellipse((float)x,(float)y,20,20);
	}
}

