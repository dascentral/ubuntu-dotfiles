# NVM

## Introduction

Node Version Manager - Simple bash script to manage multiple active node.js versions. [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)

## Installation

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

The following lines SHOULD be added to `~/.bashrc` automatically:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

You will need to exit your terminal session and re-open in order to use NVM.