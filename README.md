# .prestashop-18247

## Requirements

- [Docker desktop](https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe)

## Show error happens

```shell script
docker compose up
```

## Workaround

Uncomment **line 10** in *scripts/docker-run.sh*

### From

```shell script
 9. # Uncomment line below to ignore case-sensitive
10. #git config --global core.ignorecase true
```
### To

```shell script
git config --global core.ignorecase true
```
