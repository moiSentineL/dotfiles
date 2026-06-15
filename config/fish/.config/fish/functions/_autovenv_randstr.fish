function _autovenv_randstr -d "Generates a random string of 4 lower case characters"
    for i in (seq 4)
        printf (random choice (string split " " "a b c d e f g h i j k l m n o p q r s t v w x y z"))
    end
end
