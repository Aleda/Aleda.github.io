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
# newly MAKEFILE in the clod
CLOUD_MAKEFILE="http://aleda.cn/makefile"

# use jumbo's bashrc [in baidu];
[[ -s "$HOME/.jumbo/etc/bashrc" ]] && source "$HOME/.jumbo/etc/bashrc"

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
export PATH="$PATH:$HOME/.jumbo/bin/:$HOME/.jumbo/lib/go/site/bin/"
# PS1 commander setting; [useful]
export PS1="[\[\e[36;1m\]\u@\H\[\e[32;1m\]:\w\[\e[0m\]]\n\[\e[32;1m\]\$\[\e[0m\]"
# python encoding; [useful]
export PYTHONIOENCODING=utf-8
# terminal term; [default]
export TERM="xterm"
# LANG
export LANG="en_US.utf-8"
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
function remove()
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
##! @test  :
function reload()
{
    wget -q -T 60 "${CLOUD_BASHRC}" -O ${WORK_ROOT}/.bashrc
    source ${WORK_ROOT}/.bashrc
    log_notice "reload successful!"
    return ${RET_RUNNING_OK}
}

##! @brief : load newly vimrc
##! @params: NULL
##! @return: see return code list
##! @test  : pass
function load_vimrc()
{
    ##! @NOTICE: test the version of vim
    local version_vim=`vim --version | head -n 1 | awk '{print $5}' | awk -F '.' '{print $1}'`
    if [ ${version_vim} -le 6 ]; then
        log_warning "vim version smaller than 6"
    fi
    wget -q -T 60 ${CLOUD_VIMRC} -O ${WORK_ROOT}/.vimrc
    local ret_msg=`type git`
    if [ ${ret_msg} ~= "not" ]; then
        log_notice "git not exists!"
        return ${RET_RUNNING_FAIL}
    fi
    # Modified by Aleda at 2015-7-6 16:56 
    # Because Vundle need run in the ~/.vim
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    return ${RET_RUNNING_OK}
}

##! @brief : generate the makefiel
##! @params: NULL
##! @return: see return code list
##! @test  : 
function gen_mk()
{
    cp ./Makefile ./Makefile.orig
    wget -q -T 60 ${CLOUD_MAKEFILE} -O ./Makefile
    return ${RET_RUNNING_OK}
}

##! @brief : kill all the sessions of screen
##! @params: NULL
##! @return: see return code list
function screen_kill_all()
{
    screen -ls | grep "Detached" | cut -d "." -f 1 | sed "s/^[ \t]*//g" | xargs kill -9
    ##! remove all the sessions
    screen -wipe
    return ${RET_RUNNING_OK}
}

##! @brief : show all eths config
##! @params: NULL
##! @return: see return code list
function ip_config()
{
    cat /etc/sysconfig/network-scripts/ifcfg-eth*
    return ${RET_RUNNING_OK}
}

##! @brief : utc time to formatted time
##! @params: $1 => utc seconds
##! @return: see return code list
function utc2date()
{
    local utc=${1}
    local date=`date -d "1970-01-01 UTC ${utc} seconds" +"%Y-%m-%d_%H:%M:%S"`
    echo "${date}"
    return ${RET_RUNNING_OK}
}

##! @brief : extract, add up and sort.
##! @params: NULL
##! @return: see return code list
function ext_site()
{
    awk '
    function ext_site(url) {
        n = split(url, url_arr, "/")
        if (n <= 0) {
            return url
        }
        if(url ~ /^http[s]?:/) {
            return url_arr[3]
        } else {
            return url_arr[1]
        }
        return url
    }
    {
        d[ext_site($1)]++
    }
    END {
        for (site in d) {
            print site"\t"d[site]
        }
    }
    '
    return ${RET_RUNNING_OK}
}

##! @brief : merge the `two` file through the key in first col.
##!        : Want to go deep in use, please see `join`
##!        : NOTICE: seperator => '\t'
##! @params: NULL
##! @return: see return code list
function merge_key()
{
    local file1=$1
    local file2=$2
    if [[ ! -e ${file1} ]] || [[ ! -e ${file2} ]]; then
        log_fatal "${file1} not exists or ${file2} not exists"
        return ${RET_PARAMS_ERROR}
    fi
    awk '
    BEGIN{
        FS  = "\t"
        OFS = "\t"
        split_num = -1
    }{
        if (ARGIND == 1) {
            dct[$1] = $0
        }
        else if (ARGIND == 2) {
            split_num = split($0, a, FS)
            if ($1 in dct) {
                printf("%s%s", dct[$1], OFS)
                for(i = 2; i < NF; i++) {
                    printf("%s%s", $i, OFS)
                }
                printf("%s\n", $NF)
                dct[$1] = -1
            }
            else {
                printf("%s%sNULL%s", $1, OFS, OFS)
                for (i = 2; i < NF; i++) {
                    printf("%s\t", $i)
                }
                printf("%s\n", $NF)
            }
        }
    }END{
        for (key in dct) {
            if (dct[key] != -1) {
                printf("%s%s", dct[key], OFS)
                split_num = split(dct[key], a, FS)
                if (split_num == -1)
                    printf("\n")
                else {
                    for (i = 2; i <= split_num; i++) {
                        printf("NULL%s", OFS)
                    }
                    printf("\n")
                }
            }
        }
    }' ${file1} ${file2} 
    return ${RET_RUNNING_OK}
}

# ====================== global functions ======================== #
