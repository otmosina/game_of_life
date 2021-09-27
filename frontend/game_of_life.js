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
c.fillRect(100, 100, 10, 10);
//c.fillStyle = 'rgba(0, 0, 0, 0.5)'
//c.fillRect(100, 100, 10, 20);
//c.fillStyle = 'rgba(0, 255, 0, 0.5)'
//c.fillRect(100, 100, 10, 30);
//console.log(canvas) 



var universe = [
  [0,0,1,1,0],
  [0,1,1,1,0],
  [0,0,1,1,1],
  [0,0,1,1,0],
  [0,0,1,1,0]
]



function randomUniverseGenerator(universeSize=50){
  let universeHistory = []
  
  for (generation_cnt = 0; generation_cnt < 100; generation_cnt++){
    generation = [];
    
    for (i = 0; i < universeSize; i++){
      line = [];
      for (j = 0; j < universeSize; j++){
        
        line.push(Math.round(Math.random()))
        
      }
      generation.push(line)
    }
    universeHistory.push(generation)
  }
  return universeHistory
}


var universeHistory = []//randomUniverseGenerator()

var universeSize = 0//universeHistory[0].length


async function f2() {
  var y = await 20;
  console.log(y); // 20
}
f2();

// const response = fetch('../storage/2021-08-17-22-08-18___196');
// const json = response.json();
// universeHistory = json

// const json = fetch('https://api.com/values/1')
//                 .then(response => response.json());
// console.log(json);

// try {
//   const response = await fetch('flowers.jpg');
//   if (!response.ok) {
//     throw new Error('Ответ сети был не ok.');
//   }
//   const myBlob = await response.blob();
//   const objectURL = URL.createObjectURL(myBlob);
//   myImage.src = objectURL;
// } catch (error) {
//   console.log('Возникла проблема с вашим fetch запросом: ', error.message);
// }

//}

// while (universeHistory == 0) {
//   console.log('waiting')
// }

//function getNextGeneration





function loop(singlegeneration){
  universeSize = singlegeneration.length
  
  let x = 0
  let y = 0
  var cellSize = canvas_width / universeSize
  //debugger
  for (i = 0; i < universeSize; i++){
    x = 0
    for (j = 0; j < universeSize; j++){
      //c.strokeStyle='red';
      //c.fillStyle = 'black';
      //c.fillRect(x, y, cellSize, cellSize);
      //c.fillStyle = 'border: 1px solid black'
      c.beginPath();
      
      c.rect(x, y, cellSize, cellSize);
      c.strokeStyle = `grey`
      if (singlegeneration[i][j] == 1) {
        
        c.fillStyle = `black`
        random_r = getRandomInt(0, 255);
        random_g = getRandomInt(0, 255);
        random_b = getRandomInt(0, 255);

        c.fillStyle = `rgba(${random_r}, ${random_g}, ${random_b}, 0.5)`
      } else {
        c.fillStyle = `white`
      }
      c.stroke();
      c.fill()
      x += cellSize
    } 
    y += cellSize  
  }
}


function animate() {
  //console.log('anomate')
  //debugger
  if (universeHistory.length > 0) {
    requestAnimationFrame(animate);
    loop(universeHistory.shift())
  } else {
    cancelAnimationFrame(animate);
    getUniverseHistory()
  }
  

  
}

var filename = '2021-09-22-21-09-41___140'//'2021-09-22-21-09-35___314' //2021-08-17-22-08-18___196
async function getUniverseHistory(){
  //await fetch(`../storage/${filename}`)
  await fetch(`http://localhost:8888/get_game_data/#`)
  .then(response => response.json())
  .then(jsonResponse => {
    universeHistory = jsonResponse
    console.log(universeHistory.length)
    jsonResponse
    animate()
  })  
}
getUniverseHistory()


//animate()


   // outputs a javascript object from the parsed json
// 

// fetch('http://example.com/movies.json')
//   .then((response) => {
//     return response.json();
//   })
//   .then((data) => {
//     console.log(data);
//   });

// fetch('canvas.js')
//   .then(response => {
//     r = response.json()
//     //debugger
//   })
//   .then(jsonResponse => console.log(jsonResponse))     
//    // outputs a javascript object from the parsed json
// animate()