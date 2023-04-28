mkdir -p ~/.fonts

fonts=(
    "FiraCode"
    "Hack"
    "JetBrainsMono"
    "NerdFontsSymbolsOnly"
    "RobotoMono"
    "SourceCodePro"
    "Ubuntu"
)

for font in ${fonts[@]}; do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/$font.zip
    unzip $font.zip -d $HOME/.fonts/$font/
    rm $font.zip
done
fc-cache -vf
