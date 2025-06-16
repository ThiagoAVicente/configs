
purge() {
    folder_path="$1"

    if [ ! -d "$folder_path" ]; then
        echo "[ERROR]not a directory."
        return 1
    fi

   find "$folder_path" \
    \( -type f -executable -o -name "*.o" \) \
    -exec rm {} \;

    echo "[DONE]"
}
cmp++() {
    if [[ ! -f dependencies ]]; then
        echo "Erro: Arquivo 'dependencies' não encontrado."
        return 1
    fi

    if [[ ! -f source.cpp ]]; then
        echo "Erro: Arquivo 'source.cpp' não encontrado."
        return 1
    fi

    mkdir -p out

    deps=$(<dependencies)

    g++ source.cpp -o out/build $deps
}
cmp() {
    if [[ ! -f dependencies ]]; then
        echo "Erro: Arquivo 'dependencies' não encontrado."
        return 1
    fi

    if [[ ! -f $1 ]]; then
        echo "Erro: Arquivo 'source.cpp' não encontrado."
        return 1
    fi

    mkdir -p out

    deps=$(<dependencies)

    gcc $1 -o out/build $deps
}
stts() {
    echo $(date)
    echo $(acpi)
    volume_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    volume_percentage=$(echo "$volume_info" | awk '{print $2 * 100 "%"}')
    muted_status=$(echo "$volume_info" | grep -q "\[MUTED\]" && echo "muted" || echo "unmuted")
    echo "Volume: $volume_percentage ($muted_status)"
}
gnew(){
	git add .
	git commit -m "$1"
	git push
}
