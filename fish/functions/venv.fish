function venv
    if test -e .venv/bin/activate.fish
        source .venv/bin/activate.fish
    else
        echo "No virtual environment found at .venv/bin/activate.fish"
    end
end
