url=$(git remote get-url origin 2>/dev/null)
if [[ -z "$url" ]]; then
    echo "Not a git repository or no origin remote found"
    exit 1
fi

if [[ $url == *github.com* ]]; then
    if [[ $url == git@* ]]; then
        url="${url#git@}"
        url="${url/:/\/}"
        url="https://$url"
    fi
    # open the URL
    if command -v xdg-open >/dev/null; then
        xdg-open "$url"
    elif command -v open >/dev/null; then
        open "$url"
    else
        echo "Cannot open URL, no suitable command found"
    fi
else
    echo "This repository is not hosted on GitHub"
fi

