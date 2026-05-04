#!/usr/bin/env fish

if pgrep -x wlogout > /dev/null
    pkill wlogout
else
    wlogout --protocol layer-shell
end
