# example-ansible-monorepo

    2020 Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/example-ansible-monorepo

## Setup

### Clone & Open Monorepo

```
git clone git@github.com:ondrejsika/example-ansible-monorepo.git
cd example-ansible-monorepo
```

### Clone Configuratuions

```
git clone git@github.com:ondrejsika/example-ansible-monorepo-dev.git env/dev
git clone git@github.com:ondrejsika/example-ansible-monorepo-prod.git env/prod
```

### Apply Dev

```
./apply-dev.sh
```

### Apply Prod

```
./apply-prod.sh
```


