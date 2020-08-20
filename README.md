# ezlogs
Tool to beautify, color and ease the usage of the json received by `apps logs`.

- Logs level easily identifiable by color.
- Logs easy to read and to filter.

## Tips
- To filter by app: `ezlogs | grep -i "docker.crm"`
- To filter by log level: `ezlogs | grep -i "\[warning\]"`

## Requirements
- jq
- awk
- gsub

## Getting Started
- Install ezlogs. *(See Installation section)*
- Use ezlogs.

### Installation
__Install__
```
bash ./install.sh
```

__Uninstall__
```
bash ./install.sh -r
```
