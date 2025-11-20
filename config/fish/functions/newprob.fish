# newprob python file boilerplate for kattis. to be used for judgement via kattis-cli.

function newprob
    if test (count $argv) -lt 1
        echo "Usage: newprob <kattis-slug>"
        return 1
    end
    set kattisdir "/home/nibir/docs/coding/kattis/"
    set slug $argv[1]
    set filename "$kattisdir/problems/$slug.py"

    if test -e $filename
        echo "$filename already exists."
        return 1
    end

    echo '"""
Problem: '$slug'
Source: https://open.kattis.com/problems/'$slug'
"""' > $filename

    echo "import sys" >> $filename
    echo "" >> $filename
    echo "def main(data):" >> $filename
    echo "    pass  # implement logic here" >> $filename
    echo "" >> $filename
    echo 'if __name__ == "__main__":' >> $filename
    echo '    for data in sys.stdin:' >> $filename
    echo "        main(data)" >> $filename

    echo "* [$slug](problems/$slug.py)" >> "$kattisdir/README.md"

    echo "Created $filename"
    
    nvim $filename
end

