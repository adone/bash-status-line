BSL=~/.bsl

source $BSL/colors.sh

source $BSL/bsl_setter.sh

if test $PROMPT_COMMAND
    then
        WRAPPED_PROMPT_COMMAND= $PROMPT_COMMAND
fi

bsl_update_prompt() {
    if test $WRAPPED_PROMPT_COMMAND
        then
            WRAPPED_PROMPT_COMMAND
    fi

    update_status_line
}

PROMPT_COMMAND=bsl_update_prompt