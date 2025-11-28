DOTFILES_DIR := $(HOME)/.dotfiles
ZDOTDIR := $(HOME)

.PHONY: bootstrap link brew gpu-check

bootstrap:
	bash $(DOTFILES_DIR)/bootstrap.sh

link:
	ln -sf $(DOTFILES_DIR)/zsh/zshrc $(ZDOTDIR)/.zshrc
	ln -sf $(DOTFILES_DIR)/zsh/zpreztorc $(ZDOTDIR)/.zpreztorc
	ln -sf $(DOTFILES_DIR)/git/gitconfig $(ZDOTDIR)/.gitconfig
	ln -sf $(DOTFILES_DIR)/git/gitignore_global $(ZDOTDIR)/.gitignore_global

brew:
	brew bundle --file=$(DOTFILES_DIR)/Brewfile

gpu-check:
	bash $(DOTFILES_DIR)/scripts/verify_gpu.sh
