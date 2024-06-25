
description="transpile sass files (.scss) to css files"

WATCH=0

add_flag "-" "watch" "will continuously watch the sass files for changes and automatically transpile them" 1
function flag_name_watch () {
    WATCH=1
}


function target_sass () {
    local extra_args
    [[ ${WATCH} -eq 1 ]] && extra_args="--watch"

    sass ${extra_args} static/scss:static/css
}

