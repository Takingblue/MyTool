function to(){
    if [ ! -e ~/.bookmarks ]; then
        mkdir ~/.bookmarks
    fi
    case $1 in
        -c)
            if [ ! -f ~/.bookmarks/$2 ]; then
                echo "cd `pwd`">~/.bookmarks/$2
            else
                echo "Bookmark $2 already exist"
            fi
            ;;
        -d)
            if [ -f ~/.bookmarks/$2 ]; then
                rm -f ~/.bookmarks/$2
            else
                echo "$2 didn't exist"
            fi
            ;;
        -l)  
            ls -l ~/.bookmarks/
            ;;
        -h)
            echo "Usage: to [-c|-d|-l|-h] [bookmark], go to bookmark if without no option"
            ;;
        *)
            if [ -f ~/.bookmarks/$1 ]; then
                source ~/.bookmarks/$1
            else
                echo "Usage: to [-c|-d|-l|-h] [bookmark], go to bookmark if without no option"
            fi
            ;;
    esac
}
#vim ft=sh
