// alert('r/place')

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min; //Максимум не включается, минимум включается
}

var canvas = document.querySelector('canvas');
var canvas_width = 500;//window.innerWidth;
var canvas_height = 500;//window.innerHeight;
canvas.width = canvas_width;
canvas.height = canvas_height;

var c = canvas.getContext('2d');
// c.fillRect(100, 100, 10, 10);
// c.fillStyle = 'rgba(255, 0, 0, 0.5)'
// c.fillRect(100, 100, 10, 20);
// c.fillStyle = 'rgba(0, 255, 0, 0.5)'
// c.fillRect(100, 100, 10, 30);
// console.log(canvas) 

// c.beginPath();
// c.moveTo(50, 300);
// c.lineTo(300, 100);
// c.stroke();

// for ( var i = 0; i < 2500; i++) {
//   var x =  getRandomInt(0, canvas_width);//Math.random() * window.innerWidth;
//   var y =  getRandomInt(0, canvas_height);//Math.random() * window.innerHeight;
//   c.beginPath();
//   c.arc(x, y, 3, 0, Math.PI * 2, false);
//   var random_r = getRandomInt(0, 255)
//   var random_g = getRandomInt(0, 255)
//   var random_b = getRandomInt(0, 255)
//   c.strokeStyle = `rgba(${random_r}, ${random_g}, ${random_b}, 0.99)`
//   c.stroke();
// }

function Circle(x, y, radius, dx, dy) {
  this.x = x;
  this.y = y;
  this.radius = radius;
  this.dx = dx;
  this.dy = dy;

  this.random_r = getRandomInt(0, 255);
  this.random_g = getRandomInt(0, 255);
  this.random_b = getRandomInt(0, 255);  



  this.draw = function() {
    c.beginPath();
    c.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    
    
    
    c.strokeStyle = `rgba(${this.random_r}, ${this.random_g}, ${this.random_b}, 0.99)`
    c.stroke();

  }

  this.update = function(){

    if ( this.x - this.radius < 0 ||  this.x + this.radius > canvas_width) {
      this.dx = -this.dx
    }
    if ( this.y - this.radius < 0 ||  this.y + this.radius > canvas_height) {
      this.dy = -this.dy
    }
    this.x += this.dx
    this.y += this.dy
    this.draw()
  }
  
}


var x_direction = 'r'
var speed = 5;
var radius = 5;
var dx = 4;
var dy = 4;
var x = getRandomInt(0+radius, canvas_width-radius);//200;
var y = getRandomInt(0+radius, canvas_height-radius);//200;

var circles = []
for( i = 1; i < 150; i++ ){
  x = getRandomInt(0+radius, canvas_width-radius);
  y = getRandomInt(0+radius, canvas_height-radius);
  dx = getRandomInt(1,8);
  dy = getRandomInt(1,8);
  circles.push(new Circle(x, y, radius, dx, dy))
}

var animationGeneration = 0

var circle = new Circle(x, y, radius, dx, dy)
function animate() {
  requestAnimationFrame(animate);
  c.clearRect(0, 0, canvas_width, canvas_height)
  //circle.update()
  for( i = 1; i < circles.length; i++ ){
    circles[i].update()
  }
  animationGeneration++;
  if (animationGeneration - 10 >= 0) {
    animationGeneration = 0
    for( i = 1; i < circles.length; i++ ){
      circles[i].radius = circles[i].radius + getRandomInt(-1,2)
      circles[i].dx = circles[i].dx + getRandomInt(-1,2)
      circles[i].dy = circles[i].dy + getRandomInt(-1,2)
    }    
     
  }
}

animate()
