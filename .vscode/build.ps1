Param(
    $dir_path
)

iverilog -o tmp/build_result.vvp -l $(Join-Path $dir_path "*")