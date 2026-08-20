Description

This project implements an Automatic Street Light Controller using Verilog HDL.

The controller uses two inputs:

- `night` - represents an LDR/light sensor detecting darkness
- `motion` - represents a motion sensor detecting a vehicle or person

The street light turns ON only when it is night and motion is detected.
 Files

- `automatic_street_light_controller.v` - Main Verilog design
- `automatic_street_light_controller_tb.v` - Testbench
- `README.md` - Project documentation

Inputs

| Signal | Description |
|--------|-------------|
| `clk` | System clock |
| `reset` | Active-high reset |
| `night` | Darkness/night sensor |
| `motion` | Motion detection sensor |

Output

| Signal | Description |
|--------|-------------|
| `street_light` | Street light control |

Working Principle

The street light is turned ON when:

```text
Night = 1
Motion = 1