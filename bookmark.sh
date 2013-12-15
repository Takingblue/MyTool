function to(){
    if [ ! -e ~/.toolset ]; then
        mkdir ~/.toolset
    fi
    case $1 in
        -c)
            if [ ! -f ~/.toolset/bookmarks ] ;then
                echo "$2:cd `pwd`">~/.toolset/bookmarks
            else
                Tmp=$2
                Path=`awk -F: '{FS=":"}$1=="'"$Tmp"'"{print $2}' ~/.toolset/bookmarks`
                if [ ! -z "$Path" ]; then
                    echo "Bookmark $2 already exist"
                else
                    echo "$2:cd `pwd`" >> ~/.toolset/bookmarks
                fi
            fi
            ;;
        -d)
            if [ ! -f ~/.toolset/bookmarks ] ; then
                echo "There is no bookmarks!"
            else
                sed '/^'"$2"'/d' ~/.toolset/bookmarks > ~/.toolset/bookmarks_tmp
                mv ~/.toolset/bookmarks_tmp ~/.toolset/bookmarks
            fi
            ;;
        -l)  
            cat ~/.toolset/bookmarks
            ;;
        -h)
            echo "Usage: to [-c|-d|-l|-h] [bookmark], go to bookmark if without no option"
            ;;
        *)
            if [ -z $1 ] ; then
                echo "Usage: to [-c|-d|-l|-h] [bookmark], go to bookmark if without no option"
            elif [ ! -f ~/.toolset/bookmarks ] ;then
                echo "There is no bookmarks!"
                echo "Please use 'to -c' to create one. "
            else
                Tmp=$1
                Path=`awk -F: '{FS=":"}$1=="'"$Tmp"'"{print $2}' ~/.toolset/bookmarks`
                eval "$Path"
            fi
            ;;
    esac
}
#vim ft=sh
