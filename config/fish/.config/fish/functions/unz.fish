function unz --wraps='unzip -j *.zip && rm *.zip' --description 'alias unz=unzip -j *.zip && rm *.zip'
    unzip -j *.zip && rm *.zip $argv
end
