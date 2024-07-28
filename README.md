# LunarVim config setup with Kitty and VimTex

This setup is using the [LunarVim IDE layer for Neovim](https://www.lunarvim.org/), parts of [benbrastmckie's nvim config data](https://github.com/benbrastmckie/.config), my [fork](https://github.com/Pariatorn/.config) of his config as well as luasnip ideas from [Ejamastnak's Supercharged latex series](https://ejmastnak.com/tutorials/vim-latex/intro/).

## Features

This configuration includes all the the LunarVim features and extends them with VimTex and some custom luasnippets. Important VimTex commands are included into the WhichKey config.

## Installation (Linux)

### Prerequisites

Installation might be differ on certain distros. Here are the the most important packages:

```
git
make
pip
python
npm
node
cargo
ripgrep
lazygit (optional)
texlive
zathura (optional)
okular (optional)
```

If you do not wish to use Zathura and Okular, you may change the corresponding lines in the [lvim/config.lua](lvim/config.lua). If you plan to use Zathura, consider to have a look into [zathura/zathurarc](zathura/zathurarc) and move it into your `~/.config/zathura/` folder.

Remember you may find out more about problems via `:checkhealth` in lvim.

### LunarVim

Either visit their [website](https://www.lunarvim.org/docs/installation) and check out the official guide or follow these instructions here (may be deprecated!):

- Stable version (release):

```bash
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```

- Nightly (preferred):

```bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

LunarVim is then launchable with `lvim` from terminal. If there is a problem you need to include your `~/.local/bin/` in the `PATH` of your `.bashrc` or `.zshrc`.

It is best to install a Nerd Font for full functionality. Either use the one provided [here](fonts/MesloLGS NF), install from their [official page](https://www.nerdfonts.com/)
 or use the [easy installer](https://github.com/getnf/getnf).

To update lvim use following commands:

- Inside lvim `:LvimUpdate`
- In terminal `lvim +LvimUpdate +q`

Plugin updates are done inside lvim via `:LsyncCorePlugins`

### Optional (Kitty and Fish)

For a smooth experience as an alternative to the stock terminal, [Kitty](https://github.com/kovidgoyal/kitty) as well as [Fish](https://fishshell.com/) may be interesting. The config files deployed in this repo may be a great starting point for the configuration ([fish](fish) and [kitty/kitty.conf](kitty/kitty.conf)). Put both into `~/.config/` in the corresponding sub folders.

Furthermore there is [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) as well as sashimi:

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install sashimi
```

### Zotero (Optional for better bib management)

It is highly recommended to use Zotero for managing larger bibliographies which you might want to use to write some stuff in LaTex. Download and extract the [Zotero tarball](https://www.zotero.org/download/) in `~/Downloads` and use following commands to install:

```bash
sudo mv ~/Downloads/Zotero_linux-x86_64 /opt/zotero
cd /opt/zotero
sudo ./set_launcher_icon
sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

Another great addition for Zothero is [Better-BibTex](https://retorque.re/zotero-better-bibtex/installation/). Download the `.xpi` and go into `Tools -> Add-ons` and click the gear symbol in the upper right hand corner selecting `Install Add-on from File` and navigat to the `.xpi` file. Go to `Edit -> Preferences -> BetterBibTex` and set citation key format to your likings (e.g. `[auth][year]`). You may want an automatic sync as well. This is easily possible with an Zotero account for example.
To make Better-BibTex update your library automatically just define a directory where you like to have it and select `Export Library`. Under the `Format` dropdown menu choose `Better BibTex` and `Keep Updated`.

## Acknowledgements

First and foremost thanks to all maintainers of all the beautiful projects. Without your work this whole stuff would not be possible. Please consider donating to them, if you like to help the developers and maintainers with their work.

Many thanks to [benbrastmckie](https://github.com/benbrastmckie) for his neovim config out of which I learned a lot, [Ejamastnak](https://ejmastnak.com/tutorials/vim-latex/intro/) who gave the instpiration for LaTex luasnippets for and last but not least to the team of [LunarVim](https://github.com/LunarVim)!!
