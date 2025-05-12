<h1 align="center">🤖 LEGO EV3 Drivetrain Controller</h1>
<h3 align="center">🧠 Autonomous + Manual control system powered by MATLAB for EV3 robots</h3>

---

### 🔧 About This Project

This is a dual-mode robot control script for a LEGO EV3 robot using MATLAB and the RWTH Mindstorms NXT toolbox. It enables **manual driving** with keyboard inputs or **autonomous navigation** using ultrasonic, touch, and color sensors.

---

### 🚗 Features

- 🔁 **Switch Between Modes**
  - `m` → Manual Mode
  - `x` → Return to Autonomous Mode
  - `q` → Quit Program

- 🎮 **Manual Driving**
  - `s` → Forward
  - `w` → Backward
  - `a` → Turn Left
  - `d` → Turn Right
  - `z` → Lift motor C (hold)
  - `e` → Lower motor C (hold)
  - `o` → Play tone

- 🧭 **Autonomous Logic**
  - Wall-following using **ultrasonic sensor**
  - Reverses on **touch sensor** impact
  - Uses **color sensor** to trigger events:
    - 🔴 Red → Stop and beep  
    - 🔵 Blue → Switch to manual  
    - 🟢 Green → Switch to manual

---

### 🧪 Sensors and Ports

| Sensor           | EV3 Port |
|------------------|----------|
| Ultrasonic       | Port 4   |
| Touch            | Port 1   |
| Color            | Port 2   |
| Drive Motors     | A & B    |
| Lift Motor       | C        |

---

### 🧰 Requirements

- MATLAB with MindStorm ToolBox
- LEGO EV3 Brick  
- EV3 motors and sensors as
