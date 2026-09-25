# Flutter Painters & Animations Playground 🎨✨

Welcome to the **Flutter Painters & Animations Playground**! 👋

This project is a hands-on learning lab created to explore and experiment with **custom drawing** and **smooth animations** in Flutter. Whether you're a developer curious about visual effects or someone who wants to see interactive UI in action, this project demonstrates what's possible when bringing Flutter apps to life!

---

## 💡 What is this project about?

In mobile apps, animations and custom graphics make user experiences feel engaging, playful, and alive.

This repository contains small, interactive experiments that showcase:

1. **Drawing Custom Shapes from Scratch**: Painting circles, stars, custom curves, and grids onto a blank digital canvas.
2. **Effortless UI Transitions**: Smoothly resizing boxes, changing colors, and fading elements in and out on button clicks.
3. **Bouncy Physics & Motion**: Simulating real-world physical reactions like springs and elastic bounces.
4. **Interactive Surprises**: Cards and elements that slide and pop open interactively ("Peek-a-boo!").

---

## 🎯 What You Can Explore Inside

### 1. 🖌️ Custom Canvas Drawing (`CustomPainter`)

> _Think of this like having a digital paintbrush and canvas where you can draw anything using code._

- **Geometric Shapes**: Clean circles, ovals, and rounded cards with custom-shaped corners.
- **Pattern Lines & Grids**: Artistic overlapping lines and intersecting grids.
- **Polygons & Stars**:
  - A clean geometric triangle.
  - A 5-pointed spinning star rotating smoothly on screen.

📂 _Code location: [`lib/custom_painter/`](file:///Users/bigbrain/Projects/customPainter_and_animations-main/lib/custom_painter)_

---

### 2. ⚡ Simple & Smooth Animations (Implicit Animations)

> _Animations that automatically animate between changes (like color, size, and position) without complex setups._

- **Magic Shape-Shifting Box**: Tap a button to see a box dynamically morph its size, corners, and color to random values.
- **Gradual Fade-In**: An object smoothly appears on screen over time.
- **Peek-a-boo Surprise**: A button reveals a hidden secret message that smoothly slides out and expands with an emoji surprise 🎉.

📂 _Code location: [`lib/implicit_animations/`](file:///Users/bigbrain/Projects/customPainter_and_animations-main/lib/implicit_animations)_

---

### 3. 🌀 Bouncy Spring Motion (Physics-based Animations)

> _Animations inspired by real-world physics, making UI elements feel responsive and satisfying._

- **Elastic Drop & Bounce**: Tap the button to watch it drop down from above and bounce smoothly into place just like a physical spring.

📂 _Code location: [`lib/spring_like_animation/`](file:///Users/bigbrain/Projects/customPainter_and_animations-main/lib/spring_like_animation)_

---

### 4. 🌊 Wave Motion & Custom Curves

> _Custom mathematical motion paths that make animations sway or pulse naturally._

- **Sine Wave Easing**: Creates gentle wave-like rhythmic back-and-forth movement.

📂 _Code location: [`lib/randoms/`](file:///Users/bigbrain/Projects/customPainter_and_animations-main/lib/randoms)_

---

## 📂 Project Organization

Here's how the project folders are organized:

```text
lib/
├── custom_painter/        # All canvas drawing screens (shapes, stars, lines)
├── implicit_animations/   # Smooth transitions (resizing boxes, fade effects, peek-a-boo)
├── spring_like_animation/ # Bouncy spring physics effect
├── randoms/               # Custom animation curves (sine wave movement)
├── home.dart              # Home screen connecting the demos
└── main.dart              # Main starting point of the app
```

---

## 🚀 How to Run the App

Want to test these animations on your own computer or phone?

### 1. Requirements

Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.

### 2. Setup

Clone this repository and open the project:

```bash
git clone https://github.com/grgpratik-dev/custom_painters_and_animations.git
cd custom_painters_and_animations
```

Install the project packages:

```bash
flutter pub get
```

### 3. Launch

Run the app on your connected device, simulator, or browser:

```bash
flutter run
```

---

## 🛠️ Built With

- **[Flutter](https://flutter.dev/)**: Google's UI toolkit for crafting beautiful cross-platform applications.
- **[Riverpod](https://riverpod.dev/)**: State management to easily handle user interactions and dynamic changes.

---

## 📝 Purpose & Learning Journey

This repository serves as a personal learning notebook and creative playground for mastering animations and graphic rendering in Flutter. Feel free to explore, clone, and experiment with the code!
