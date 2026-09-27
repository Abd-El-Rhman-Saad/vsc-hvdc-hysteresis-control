# Grid-Connected Two-Level VSC for HVDC Systems

![VSC System Architecture](Docs/LaTeX_Source/Full_Sys.jpg)

## 🚀 Overview
This repository contains the mathematical formulation, control design, and MATLAB/Simulink simulation of a grid-connected **Two-Level Voltage Source Converter (VSC)**. VSCs represent the modern building blocks of High Voltage Direct Current (HVDC) transmission networks, offering the distinct advantage of decoupled and independent regulation of both active ($P$) and reactive ($Q$) power.

This project validates the capability of the VSC to inject into or absorb power from a stiff $90\text{ kV}$ (peak), $50\text{ Hz}$ AC grid through an inductive $R-L$ filter, ensuring high-quality, sinusoidal grid currents.

## 🧠 Control Strategy
The control architecture avoids complex $dq0$ coordinate transformations and inner PI loop tuning by employing a robust, non-linear **Hysteresis Current Controller** operating directly in the $abc$ reference frame.

1. **Analytical Reference Generation:** A custom MATLAB function continuously generates instantaneous synchronized 3-phase reference currents ($I_{abc}^*$) based on the targeted active/reactive power and the calculated power factor angle ($\phi = \tan^{-1}(Q/P)$).
2. **Hysteresis Switching Logic:** The actual grid currents are bounded within a predefined tolerance band ($\pm \Delta i$) using Relay blocks. The logic generates complementary PWM gate signals for the upper and lower IGBTs to force the current to track the sinusoidal reference with excellent dynamic response.

## ⚙️ Operational Cases & Performance Analysis
The system was subjected to five distinct operational scenarios to thoroughly evaluate its steady-state precision and transient resilience:

*   **Case 1: Pure Active Power Injection ($+405\text{ MW}, 0\text{ MVAR}$)**
    *   Operating at unity power factor. Grid currents perfectly in-phase with grid voltages.
*   **Case 2: Symmetrical Power Injection ($+200\text{ MW}, +200\text{ MVAR}$)**
    *   Demonstrates the VSC's dual capability as a power source and reactive compensator (power factor angle $= 45^\circ$).
*   **Case 3: STATCOM Mode ($0\text{ MW}, +405\text{ MVAR}$)**
    *   Zero active power transfer with maximum reactive power injection for dynamic voltage regulation. Currents shifted exactly $90^\circ$.
*   **Case 4: Rectification Mode ($-405\text{ MW}, 0\text{ MVAR}$)**
    *   Validates bidirectional power flow. The converter draws active power from the AC grid, evidenced by a $180^\circ$ phase shift in the grid currents.
*   **Case 5: Severe Dynamic Step Change ($+405\text{ MW} \rightarrow -405\text{ MW}$)**
    *   A severe transient applied at $t = 0.05\text{ s}$ commands an instantaneous reversal of active power. The hysteresis controller achieves sub-cycle recovery with negligible overshoot in the reactive power profile, proving decoupled $P-Q$ regulation.

### 📊 Dynamic Response Highlight (Case 5)
| Active & Reactive Power Reversal | Grid Current $180^\circ$ Phase Shift |
| :---: | :---: |
| ![P and Q](Docs/LaTeX_Source/Grid%20active%20and%20reactive%20powers_5.png) | ![Currents](Docs/LaTeX_Source/Grid%20Currents_5.png) |

## 📂 Repository Structure
*   `Simulation/`: Contains the MATLAB/Simulink models (`.slx`) detailing the complete Two-Level VSC wiring, the split-capacitor DC link, and the Hysteresis Controller subsystem.
*   `Docs/`: Contains the final project report detailing the theoretical background, mathematical equations, and comprehensive waveform analyses.
*   `Docs/LaTeX_Source/`: Contains the LaTeX source code and all high-resolution waveform plots used to compile the technical report.

## 👨‍💻 Author
**Abd El-Rahman Muhammad Saad Muhammad**
*   **University:** Alexandria University
*   **Department:** Electrical Engineering

---
*Note: This project was completed as part of the HVDC Transmission Systems coursework.*
