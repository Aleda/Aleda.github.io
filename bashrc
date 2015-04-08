# .bashrc
# =============================================================== #
#
# PERSONAL $HOME/.bashrc FILE for bash-3.0 (or later)
# By Aleda [aledalee@foxmail.com] | aleda.cn
#
# Last modified: Wed Apr  1 15:39:41 CST 2015
#
# NOTICE:
#  This bashrc file is a bit overcrowded.
#  Remember, it is just an example for you.
#  Tailor it to your needs.
#
# =============================================================== #

# ====================== global definitions ===================== #
# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# WORK ROOT
WORK_ROOT="$HOME/lishuo"
# TRASH_DIR
TRASH_DIR="${WORK_ROOT}/trash"
# newly BASHRC in the cloud
CLOUD_BASHRC="http://aleda.cn/bashrc"
# newly VIMRC in the cloud
CLOUD_VIMRC="http://aleda.cn/vimrc"

# use jumbo's bashrc [in baidu];
[[ -s "/home/users/lishuo02/.jumbo/etc/bashrc" ]] && source "/home/users/lishuo02/.jumbo/etc/bashrc"

# astyle path (c/c++ formmater) [in baidu];
ARTISTIC_STYLE_OPTIONS=~/.astylerc

# commonly useful colors
##! Normal colors
BLACK='\e[0;30m'        # Black
RED='\e[0;31m'          # Red
GREEN='\e[0;32m'        # Green
YELLOW='\e[0;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[0;35m'       # Purple
CYAN='\e[0;36m'         # Cyan
WHITE='\e[0;37m'        # White

# Bold colors
BBLACK='\e[1;30m'       # Black
BRED='\e[1;31m'         # Red
BGREEN='\e[1;32m'       # Green
BYELLOW='\e[1;33m'      # Yellow
BBLUE='\e[1;34m'        # Blue
BPURPLE='\e[1;35m'      # Purple
BCYAN='\e[1;36m'        # Cyan
BWHITE='\e[1;37m'       # White

# Background colors
ON_BLACK='\e[40m'       # Black
ON_RED='\e[41m'         # Red
ON_GREEN='\e[42m'       # Green
ON_YELLOW='\e[43m'      # Yellow
ON_BLUE='\e[44m'        # Blue
ON_PURPLE='\e[45m'      # Purple
ON_CYAN='\e[46m'        # Cyan
ON_WHITE='\e[47m'       # White

# Reset Color
COLOR_NC='\e[m'
# Color Configuration
FATAL_COLOR="${BWHITE}${ON_RED}"
WARNING_COLOR="${BWHITE}${ON_YELLOW}"
NOTICE_COLOR="${BWHITE}${ON_GREEN}"

# return code list
RET_RUNNING_OK=0
RET_RUNNING_FAIL=1
RET_PARAMS_ERROR=2


# ====================== global definitions ===================== #

# ======================= global exports ======================== #
# PATH
export PATH="$PATH:$HOME/.jumbo/bin/"
# PS1 commander setting; [useful]
export PS1="[\[\e[36;1m\]\u@\H\[\e[32;1m\]:\w\[\e[0m\]]\n\[\e[32;1m\]\$\[\e[0m\]"
# python encoding; [useful]
export PYTHONIOENCODING=utf-8
# terminal term; [default]
export TERM="xterm"
# ======================= global exports ======================== #

# ======================== global alias ========================== #
# astyle (c/c++ formatter) [in baidu];
alias astyle="astyle --style=attach --convert-tabs --indent=spaces=4 --add-brackets \
--pad-header --unpad-paren --pad-oper --max-code-length=100 --formatted --align-pointer=type \
--align-reference=type --break-blocks -Y"
alias lt="ls --color=auto -ltr"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias cp="cp -r"
# for keyboard-dependent
alias moer="more"
alias gerp="grep"
alias remove="rm"
# vi
alias vi="vim -u ${WORK_ROOT}/.vimrc"
# ======================== global alias ========================== #

# ====================== global functions ======================== #

##! @brief : print the fatal log
##! @params: $@ => msg
##! @return: see return code list
function log_fatal()
{
    echo -e "${FATAL_COLOR}$@${COLOR_NC}"
    return ${RET_RUNNING_OK}
}

##! @brief : print the warning log
##! @params: $@ => msg
##! @return: see return code list
function log_warning()
{
    echo -e "${WARNING_COLOR}$@${COLOR_NC}"
    return ${RET_RUNNING_OK}
}

##! @brief : print the notice log
##! @params: $@ => msg
##! @return: see return code list
function log_notice()
{
    echo -e "${NOTICE_COLOR}$@${COLOR_NC}"
    return ${RET_RUNNING_OK}
}

##! @brief : swap two file
##! @params: $1 => 1st file; $2 => 2nd file;
##! @return: see return code list
function swap()
{
    if [ $# -ne 2 ]; then
        log_fatal "please input two files to swap!"
        return ${RET_PARAMS_ERROR}
    fi
    local first_file=$1
    local second_file=$2
    if [[ ! -e ${first_file} ]] || [[ ! -e ${second_file} ]]; then
        log_fatal "file(1 or 2) not exits!"
        return ${RET_RUNNING_FAIL}
    fi
    local tmp_file=__sys.tmp.$$
    mv ${first_file} ${tmp_file}
    mv ${second_file} ${first_file}
    mv ${tmp_file} ${second_file}
    return ${RET_RUNNING_OK}
}

##! @brief : show the file's ftp address
##! @params: $1 => file
##! @return: see return code list
function gen_ftp()
{
    if [ $# -ne 1 ]; then
        log_fatal "please input only one file!"
        return ${RET_PARAMS_ERROR}
    fi
    local input_file=$1
    if [ ! -e ${input_file} ]; then
        log_fatal "file not exists!"
        return ${RET_RUNNING_FAIL}
    fi
    echo "ftp://$HOSTNAME`readlink -f ${input_file}`"
    return ${RET_RUNNING_OK}
}

##! @brief : parse json data
##! @params: [$1] => param1,param2
##! @return: see the return code list
##! @stdin : json_data and every line has a json_data
##! @stdout: json_ans_data
function parse_json_py()
{
    local parse_param=""
    if [ $# -eq 1 ]; then
        parse_param=$1
    else
        log_fatal "Must input params that you want to parse!"
        return ${RET_PARAMS_ERROR}
    fi
    python -c 'import sys; import json; \
    j = json.loads(sys.stdin.read()); \
    print j["'${parse_param}'"]'
    return ${RET_RUNNING_OK}
}

##! @brief : rm the file to trash
##! @params: $@ => files
##! @return: see return code list
function rm()
{
    if [ $# -eq 0 ]; then
        log_warning "must input files to rm"
        return ${RET_PARAMS_ERROR}
    fi
    for _file in $@; do
        if [ ! -e ${_file} ]; then
            log_notice "${_file}: not exists!"
            continue
        fi
        mv ${_file} ${TRASH_DIR}
    done
}

##! @brief : reload bashrc
##! @params: NULL
##! @return: see return code list
function reload()
{
    curl "${CLOUD_BASHRC}" > ${WORK_ROOT}/.bashrc
    source ${WORK_ROOT}/.bashrc
    log_notice "reload successful!"
    return ${RET_RUNNING_OK}
}

##! @brief : load newly vimrc
##! @params: NULL
##! @return: see return code list
function load_vimrc()
{
    log_notice "Stay tuned"
    return ${RET_RUNNING_OK}
}

# ====================== global functions ======================== #

