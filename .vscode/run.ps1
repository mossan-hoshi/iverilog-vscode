Param(
    $vvp_file,
    $wave_path
)
$log_file_path =  "log/$((Get-Date).ToString('yyyyMMdd_HHmmss')).log"
$log_file_path
Start-Process -Wait vvp.exe -ArgumentList "$vvp_file " –RedirectStandardOutput $log_file_path
gtkwave $wave_path