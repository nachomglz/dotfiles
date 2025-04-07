<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">Dot Files</h3>

  <p align="center">
    Nacho's personal configuration files.

  </p>
</div>

## 🚀 Getting Started

To use this, clone the repo and move the files to your `~/.config` directory using the following script:

```sh
git clone https://github.com/nachomglz/dotfiles.git temp-dotfiles
mv temp-dotfiles/* ~/.config
rm -rf temp-dotfiles
```

### ✅ Prerequisites

- Homebrew

  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- kitty

  ```sh
  brew install --cask kitty
  ```

- tmux

  ```sh
  brew install tmux
  ```

- neovim (x86_64)

  ```sh
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz
  tar xzf nvim-macos-x86_64.tar.gz
  ./nvim-macos-x86_64/bin/nvim
  ```

- neovim (arm64)
  ```sh
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
  tar xzf nvim-macos-arm64.tar.gz
  ./nvim-macos-arm64/bin/nvim
  ```

## 📖 Usage

- Tmux is configured to use **vi** keybindings in scroll mode.
- Every vi/vim/neovim **yank** functionality is configured to copy yanked text to the clipboard.

### Copilot

- To use Github Copilot, you need to install the Copilot extension in Neovim using Lazy.

```
:Lazy
```

- Then press the (I) key to install all the new dependencies.

- After that, you can configure Copilot using the following command:

```
:Copilot setup
```

- This will take you to login in Github and generate a token for Copilot.

## ✨ Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->

## Contact

Ignacio(Nacho) Martin - [@ignaciomglz](https://linkedin.com/in/ignaciomglz) - nachomartindev@gmail.com

Project Link: [https://github.com/nachomglz/dotfiles](https://github.com/nachomglz/dotfiles)
