Param(
    $vvp_file,
    $wave_path
)
'hello'
Start-Process -Wait vvp.exe $vvp_file
gtkwave $wave_path