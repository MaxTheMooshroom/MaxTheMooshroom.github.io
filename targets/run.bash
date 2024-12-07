
description="Hosts the site locally for testing"

declare -g PORT=3000
add_flag '-' "port" "What port to host the site on" 1 "port" "int"
function flag_name_port {
    PORT=$1
}

function target_run {
    npx serve -l ${PORT}
}
