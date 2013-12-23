autoload colors && colors
color_maven() {
  mvn $* | gsed --unbuffered \
    -e "s/\[INFO\] \([^,]*\)/${fg_bold[cyan]}\[INFO\]${reset_color} \1/g" \
    -e "s/\[WARN\] \([^,]*\)/${fg_bold[magenta]}\[WARN\]${reset_color} \1/g" \
    -e "s/\[ERROR\] \([^,]*\)/${fg_bold[red]}\[ERROR\]${reset_color} \1/g" \
    -e "s/\(BUILD FAILURE.*\)/${fg_bold[red]}\1${reset_color}/g" \
    -e "s/\(BUILD SUCCESS.*\)/${fg_no_bold[green]}\1${reset_color}/g" \
    -e "s/\(-.*\)/${reset_color}\1/g" \
    -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/Tests run: ${fg_no_bold[green]}\1${reset_color}, Failures: ${fg_bold[red]}\2${reset_color}, Errors: ${fg_bold[magenta]}\3${reset_color}, Skipped: ${fg_bold[blue]}\4${reset_color}/g"
}

alias mvn=color_maven
