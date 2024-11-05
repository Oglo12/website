keep_files=(
    "$(basename "$0")"
    "CNAME"
    ".gitignore"
)

keep_dirs=(
    ".git"
)

die () {
    echo -e "ERROR: $1" >&2

    exit 1
}

[[ "$0" == "./prepare.sh" ]] || die "Please run in website directory root!"

tmp_path="/tmp/${RANDOM}_OGLO_PUBLISH"

mkdir "$tmp_path" || die "Failed to create temporary directory!"

for i in ${keep_files[@]}; do
    [[ -f "$i" ]] || continue
    mv "$i" "$tmp_path" || die "Failed to back up file!"
done

for i in ${keep_dirs[@]}; do
    [[ -d "$i" ]] || continue
    mv "$i" "$tmp_path" || die "Failed to back up directory!"
done

rm -rf ./.* || die "Failed to delete hidden items!"
rm -rf ./* || die "Failed to delete items!"

mv $tmp_path/.* ./ || die "Failed to restore hidden items!"
mv $tmp_path/* ./ || die "Failed to restore items!"

rmdir "$tmp_path" || die "Failed to delete temporary directory!"
