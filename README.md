# iverilog-vscode
VSCode environment for iverilog(tasks for build  and run)



## requirements
- Windows10
- VSCode
- [Icarus Verilog for Windows](http://bleyer.org/icarus/)
  - Operation check in `iverilog-v11-20210204-x64_setup.exe`
## installation
1. install Icalus Verilog
- Install 「[Icarus Verilog for Windows](http://bleyer.org/icarus/)」 from official site
- check `Add executable folder(s) to the user PATH` on setup wizard.
- ![image](https://user-images.githubusercontent.com/52093236/114260188-35564d00-9a0e-11eb-9685-a48f76425268.png)

2. set environment
3. prepare source code
- make directory and place design and test bench files(*.v)
- example code is placed in `src/example` and  `src/example2`
4. Run build Task
- launch VSCode in cloned repogitory
