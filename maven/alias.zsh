autoload colors && colors

color_maven() {
  mvn $* | sed \
    -e "s/\[INFO\] \([^,]*\)/${fg_bold[cyan]}\[INFO\]${reset_color} \1/g" \
    -e "s/\[WARNING\] \([^,]*\)/${fg_bold[yellow]}\[WARNING\]${reset_color} \1/g" \
    -e "s/\[ERROR\] \([^,]*\)/${fg_bold[red]}\[ERROR\]${reset_color} \1/g" \
    -e "s/\(BUILD FAILURE.*\)/${fg_bold[red]}\1${reset_color}/g" \
    -e "s/\(BUILD SUCCESS.*\)/${fg_no_bold[green]}\1${reset_color}/g" \
    -e "s/\(-.*\)/${reset_color}\1/g" \
    -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/Tests run: ${fg_no_bold[green]}\1${reset_color}, Failures: ${fg_bold[red]}\2${reset_color}, Errors: ${fg_bold[magenta]}\3${reset_color}, Skipped: ${fg_bold[blue]}\4${reset_color}/g"
}

color_old() {
  mvn $* | sed -e 's/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/[1;32mTests run: \1${reset_color}, Failures: [1;31m\2${reset_color}, Errors: [1;33m\3${reset_color}, Skipped: [1;34m\4${reset_color}/g' \
    -e 's/\(\[WARN\].*\)/[1;33m\1${reset_color}/g' \
    -e 's/\(WARN.*\)/[0;33m\1${reset_color}/g' \
    -e 's/\(\[INFO\].*\)/[1;32m\1${reset_color}/g' \
    -e 's/\(\[ERROR\].*\)/[1;31m\1${reset_color}/g' \
    -e "s/\(BUILD FAILURE.*\)/${fg_bold[red]}\1${reset_color}/g" \
    -e 's/\(FAILURE!.*\)/[1;31m\1${reset_color}/g' \
    -e 's/\(BUILD SUCCESS.*\)/[1;37m\1${reset_color}/g' \
    -e 's/\(SUCCESS.*\)/[1;37m\1${reset_color}/g' 
}

alias mvn=color_maven
