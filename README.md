# iverilog-vscode
Simple VSCode environment for iverilog(just build, run and show wave).

## Requirements
- Windows10
- Visual Studio Code
- [Icarus Verilog for Windows](http://bleyer.org/icarus/)
  - Operation check in `iverilog-v11-20210204-x64_setup.exe`
## Installation
1. Install Icalus Verilog
- Install 「[Icarus Verilog for Windows](http://bleyer.org/icarus/)」 from official site
- Check `Add executable folder(s) to the user PATH` on setup wizard.
- ![image](https://user-images.githubusercontent.com/52093236/114260188-35564d00-9a0e-11eb-9685-a48f76425268.png)
## How to Use
### 1. Launch VSCode
- Launch VSCode in cloned repogitory directory

### 2. [*If you just execute example code, skip this step.*] Prepare source code
- Make directory and place design and test bench files(*.v)

### 3. Build and run
- Example code is placed in `src/example` and  `src/example2`
- Open a file in the directory which you want to build and launch debug(`F5` key).
