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

for ( var i = 0; i < 2500; i++) {
  var x =  getRandomInt(0, canvas_width);//Math.random() * window.innerWidth;
  var y =  getRandomInt(0, canvas_height);//Math.random() * window.innerHeight;
  c.beginPath();
  c.arc(x, y, 3, 0, Math.PI * 2, false);
  var random_r = getRandomInt(0, 255)
  var random_g = getRandomInt(0, 255)
  var random_b = getRandomInt(0, 255)
  c.strokeStyle = `rgba(${random_r}, ${random_g}, ${random_b}, 0.99)`
  c.stroke();
}