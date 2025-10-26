# #!/usr/bin/env bash
#
# WALLPAPER_DIR="$HOME/.config/.wallpapers"
# CURRENT_WALL=$(hyprctl hyprpaper listloaded)
#
# # Get a random wallpaper that is not the current one
# WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
#
# # Apply the selected wallpaper
#
#!/usr/bin/env bash
# Cycles wallpapers in strict alphabetical (by filename), case-insensitive, natural order (…1,2,10…).
# Remembers position across runs. Applies to all monitors.

set -euo pipefail

WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/.config/.wallpapers}"
STATE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/hyprpaper_index"
mkdir -p "$(dirname "$STATE_FILE")"

# 1) Collect files
mapfile -t FILES < <(
  find "$WALLPAPER_DIR" -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \)
)

(( ${#FILES[@]} > 0 )) || { echo "No images in $WALLPAPER_DIR" >&2; exit 1; }

# 2) Sort by BASENAME alphabetically (case-insensitive), with natural/“version” order for numbers
#    We sort pairs "basename<US>fullpath" using LC_ALL=C for deterministic ASCII collation.
pairs=()
for f in "${FILES[@]}"; do
  pairs+=( "$(basename "$f")"$'\x1f'"$f" )
done

IFS=$'\n' read -r -d '' -a SORTED_PAIRS < <(
  printf '%s\n' "${pairs[@]}" \
  | LC_ALL=C sort -f -V && printf '\0'
)

WALLS=()
for rec in "${SORTED_PAIRS[@]}"; do
  WALLS+=( "${rec#*$'\x1f'}" )
done

COUNT=${#WALLS[@]}

# 3) Read last index (default -1), compute next (wrap to first after last)
IDX=-1
[[ -f "$STATE_FILE" ]] && read -r IDX < "$STATE_FILE" || true
[[ "$IDX" =~ ^[0-9]+$ ]] || IDX=-1
NEXT=$(( (IDX + 1) % COUNT ))
printf '%s\n' "$NEXT" > "$STATE_FILE"

NEXT_WALL="${WALLS[$NEXT]}"

# 4) Apply to all monitors
hyprctl hyprpaper preload "$NEXT_WALL" >/dev/null 2>&1 || true
mapfile -t MONITORS < <(hyprctl monitors | sed -n 's/^Monitor \([^ ]*\).*/\1/p')
for m in "${MONITORS[@]:-}"; do
  hyprctl hyprpaper wallpaper "$m,$NEXT_WALL"
done
#
