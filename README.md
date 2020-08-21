# ezlogs
Tool to beautify, color and ease the usage of the json received by `apps logs`.

- Logs level easily identifiable by color.
- Logs easy to read and to filter.

![Logs before & after](https://i.gyazo.com/045c249b3895d7b7b3c950848c778baf.png)

## Requirements
- `apps logs` Equisoft/Connect stack
- jq
- awk
- gsub

## Getting Started
- Install ezlogs. *(See Installation section)*
- Use `ezlogs` in your terminal.

## Tips
- To filter by app: `ezlogs | grep -i "docker.crm"`
- To filter by log level: `ezlogs | grep -i "\[warning\]"`

### Installation
__Install__
```
bash ./install.sh
```

__Uninstall__
```
bash ./install.sh -r
```
