function _autovenv_install_requirements -d "Asks to install all requirements found in the current directory; the packages will be installed in the currently active environment"
    if test -f "$AUTOSWITCH_DEFAULT_REQUIREMENTS"
        read -p 'printf "Install default requirements? (%s) [y/N]: " (set_color magenta)"$AUTOSWITCH_DEFAULT_REQUIREMENTS"(set_color normal)' ans

        if test "$ans" = "y" -o "$ans" = "Y"
            pip install -r "$AUTOSWITCH_DEFAULT_REQUIREMENTS"
        end
    end

    if test -f "$PWD/setup.py"
        read -p 'printf "Found a %s file. Install dependencies? [y/N]: " (set_color magenta)setup.py(set_color normal)' ans

        if test "$ans" = "y" -o "$ans" = "Y"
            if test "$AUTOSWITCH_PIPINSTALL" = "FULL"
                pip install .
            else
                pip install -e .
            end
        end
    end

    for requirements in **/*requirements.txt
        read -p 'printf "Found a %s file. Install? [y/N]: " (set_color magenta)"$requirements"(set_color normal)' ans

        if test "$ans" = "y" -o "$ans" = "Y"
            pip install -r "$requirements"
        end
    end
end
