# Installing Font on Ubuntu

Copy the .ttf file and paste it inside `~/.fonts folder`, ie /home/username/.fonts folder. Create one if you dont already have one.

Now run

```
sudo fc-cache -fv
```

# Nerdfonts patcher

https://hub.docker.com/r/nerdfonts/patcher

Pull the `nerdfonts/patcher` image and run a container with the given input and output directories

```
docker pull nerdfonts/patcher
docker run -v ~/bin/dotfiles/font/Hack-3.003-custom/ttf/:/in -v ~/bin/dotfiles/font/Hack-3.003-custom/nerdfonts/:/out nerdfonts/patcher --windows
```
