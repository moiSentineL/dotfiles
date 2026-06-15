function aria --wraps='aria2c -x 8 -j 16 ' --wraps='aria2c -x 16 -j 16 -s 16 -k 1M ' --description 'alias aria=aria2c -x 16 -j 16 -s 16 -k 1M '
    aria2c -x 16 -j 16 -s 16 -k 1M  $argv
end
