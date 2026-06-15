#!/bin/bash

# Path to your shader file
SHADER_PATH="$HOME/.config/picom/shaders/gray.glsl"

# Check if Picom is running with the shader
if pgrep -af picom | grep --quiet "gray.glsl"; then
    echo "🧼 E-Ink shader active → disabling..."
    pkill picom
    sleep 0.2
    picom &
else
    echo "🖋️ Enabling E-Ink shader..."
    pkill picom
    sleep 0.2
    picom --window-shader-fg="$SHADER_PATH" &
fi

