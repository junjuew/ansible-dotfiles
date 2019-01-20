# nvm in fish
# uses nvm and bass
########################################
# Example usages:
# ⋊> ~ nvm install stable
# Set stable version to default
# ⋊> ~ nvm alias default stable

function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end