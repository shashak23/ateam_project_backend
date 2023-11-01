<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을 수 없습니다.</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
  html, body {
    margin: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    background: linear-gradient(to bottom, #222b33, #12171b) ;
  }
  .swing_container {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  .error_txt_wrap {
    cursor: default;
    animation: swing 5s ease-in-out infinite;
  }

  .error_txt_wrap div {
    color: aliceblue;
    text-align: center;
    opacity: .7;
  }

  .error_txt_wrap .error {
    font-size: 100pt;
    font-weight: bold;
    letter-spacing: 10pt;
  }

  .error_txt_wrap .message {
    font-size: 25pt;
  }

  .home_link {
    text-decoration: none;
    color: aliceblue;
    text-align: center;
    opacity: .7;
  }

  @keyframes swing {
    0% {
      transform: rotateZ(5deg);
    }
    50% {
      transform: rotateZ(-5deg);
    }
    100% {
      transform: rotateZ(5deg);
    }
  }
</style>
</head>
<body>
    <div class="swing_container">
        <div class="error_txt_wrap">
          <div class="error">ERROR</div>
          <div class="message">잘못된 접근입니다.</div>
          <a href="/devground/home" class="home_link">홈메인으로 가기</a>
        </div>
      </div>
      <canvas></canvas>
</body>
<script>
    const canvas = document.querySelector('canvas')
const ctx = canvas.getContext('2d')

const randomBetween = (min, max) => {
  return Math.random() * (max - min + 1) + min
}

const THUNDER_RATE = 0.007
let total
let rains = []
let drops = []
let thunder
let mouse = { x: 0, y: 0, isActive: false}

// 빗줄기 클래스
class Rain {
  constructor(x, y, velocity) {
    this.x = x
    this.y = y
    this.velocity = velocity
  }

  draw() {
    const {x, y, velocity} = this
    ctx.beginPath()
    ctx.moveTo(x, y)
    ctx.lineTo(x + velocity.x * 2, y + velocity.y * 2)
    ctx.strokeStyle = '#8899a6'
    ctx.lineWidth = 1.5
    ctx.stroke()
  }

  splash() {
    for (let i = 0; i < 3; i++) {
      const velocity = {
        x: -this.velocity.x + randomBetween(-2, 2),
        y: -this.velocity.y + randomBetween(5, 10)
      }
      drops.push(new Drop(this.x, innerHeight, velocity))
    }
  }

  animate() {
    if (this.y > innerHeight) {
      this.splash()
      this.x = randomBetween(-innerWidth * 0.7, innerWidth * 1.4)
      this.y = -20
    }
    this.velocity.x = mouse.isActive
     ? randomBetween(-1, 1) + (-innerWidth / 2 + mouse.x) / 100 : randomBetween(-1, 1)
    this.x += this.velocity.x
    this.y += this.velocity.y
    this.draw()
  }
}

// Drop 클래스
class Drop {
  constructor(x, y, velocity) {
    this.x = x
    this.y = y
    this.velocity = velocity
    this.gravity = .9
  }

  draw() {
    ctx.beginPath()
    ctx.arc(this.x, this.y, 1.5, 0, Math.PI * 2)
    ctx.fillStyle = '#8899a6'
    ctx.fill()
  }

  animate() {
    this.velocity.y += this.gravity
    this.x += this.velocity.x
    this.y += this.velocity.y

    this.draw()
  }
}

// Thunder 클래스
class Thunder {
  constructor() {
    this.opacity = 0
  }

  draw() {
    const gradient = ctx.createLinearGradient(0, 0, 0, innerHeight)
    gradient.addColorStop(0, `rgba(66, 84, 99, ${this.opacity})`)
    gradient.addColorStop(1, `rgba(18, 23, 27, ${this.opacity})`)
    ctx.fillStyle = gradient
    ctx.fillRect(0, 0, innerWidth, innerHeight)
  }

  animate() {
    if (this.opacity < 0) return
    this.opacity -= 0.005
    this.draw()
  }
}

// 초기화 작업
function init() {
  canvas.width = innerWidth
  canvas.height = innerHeight

  total = 100
  rains = []
  drops = []
  thunder = new Thunder()

  for (let i = 0; i < total; i++) {
    const x = randomBetween(0, innerWidth)
    const y = randomBetween(0, innerHeight)
    const velocity = {
      // x: randomBetween(-1, 1),
      y: randomBetween(13, 18)
    }
    rains.push(new Rain(x, y, velocity))
  }
}

// 렌더 함수
function render() {
  ctx.clearRect(0, 0, canvas.width, canvas.height)
  if (Math.random() < THUNDER_RATE) thunder.opacity = 1
  thunder.animate()
  rains.forEach(particle => particle.animate())
  drops.forEach((drop, index) => {
    drop.animate()
    if (drop.y > innerHeight) drops.splice(index, 1)
  })

  window.requestAnimationFrame(render)
  console.log('ㅎㅎ')
}

window.addEventListener('resize', () => init())
canvas.addEventListener('mouseenter', () => mouse.isActive = true)
canvas.addEventListener('mouseleave', () => mouse.isActive = false)
canvas.addEventListener('mousemove', e => {
  mouse.x = e.clientX
  mouse.y = e.clientY
})


function getWeatherData() {
  const lat = 36.648521
  const lon = 127.430123
  const appKey = '08b29d7c5c19a6c5ceaf4903ebcb20d2'
  const data = axios.get(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${appKey}`)
  return data
}

getWeatherData().then(res => {
  const currentWeather = res.data.weather[0].main
  console.log(currentWeather)
  const rainingStatus = ['Rain', 'Thunderstorm', 'Drizzle', 'Clear', 'Clouds']
  if (rainingStatus.includes(currentWeather)) {
    init()
    render()
  }
})
  </script>
</html>