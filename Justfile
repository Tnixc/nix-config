host := `hostname -s`

deploy:
    nh darwin switch . -H {{host}}

build:
    nh darwin build . -H {{host}}

fmt:
    nix fmt .
    stylua . --sort-requires --indent-type spaces --indent-width 4
