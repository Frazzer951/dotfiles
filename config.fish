if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cmc="cmake .. -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=on"
alias cmb="cmake --build ."
alias cmcf="cmake --build . --target clangformat"
alias cmct="cmake --build . --target clangtidy"
alias ct="run-clang-tidy-16 -fix -p ."
alias cf="find . -regex '.*\.\(cpp\|hpp\|cc\|cxx\|c\|h\)' -exec clang-format-16 -style=file -i {} \;"

set PATH $HOME/.cargo/bin $PATH

starship init fish | source
