# Do not use the ugly default.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Prefix and suffix.
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{[38;5;36m%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{[0m%}"

# Sets the prompt.
function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
    echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}

# Some aliases...
alias virt-dev='source ~/repos/pip-core/virt/env/develop/bin/activate'
alias virt-blt='source ~/repos/pip-core/virt/env/build/bin/activate'
alias virt-val='source ~/repos/pip-core/virt/env/validate/bin/activate'
