#!/usr/bin/env bash

# Which kind of machine this is. Sourced by fresh_install.sh and
# generate_install_lists.sh, both of which need it to decide whether
# lists/Brewfile.personal or lists/Brewfile.professional applies here.
#
# Asked once and remembered in etc/profile.txt, which is gitignored so every
# machine keeps its own answer. A run with no terminal assumes professional,
# the harmless way to be wrong: a work machine that skips the personal list
# just misses a few apps, where the reverse puts games on a work laptop.
machine_profile() {
    local file="$1" reply

    if [ ! -s "$file" ] ; then
        if [ -r /dev/tty ] && [ -t 1 ] ; then
            printf 'Personal or professional machine? [p]ersonal / [W]ork > ' >&2
            read -r reply < /dev/tty
            case "$reply" in [pP]*) echo personal ;; *) echo professional ;; esac > "$file"
        else
            echo professional > "$file"
        fi
        echo "Machine profile set to $(cat "$file"); edit etc/profile.txt to change it." >&2
    fi

    cat "$file"
}
