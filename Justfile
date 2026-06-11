host := `hostname -s`

deploy:
    nh darwin switch . -H {{host}} --diff always

build:
    nh darwin build . -H {{host}} --diff always

update:
    nh darwin build . -H {{host}} -u --diff always

clean:
    nh clean all --keep-since 7d --keep 3

fmt:
    nix fmt .
    stylua . --sort-requires --indent-type spaces --indent-width 4
