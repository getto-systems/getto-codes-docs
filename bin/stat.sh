#!/bin/bash

getto_codes_docs_stat_main(){
  local target_dir
  local target
  local limit_files
  local limit_lines
  local limit_hierarchy
  local all_files
  local all_lines
  local min_lines
  local max_lines
  local all_hierarchy
  local min_hierarchy
  local max_hierarchy
  local file
  local count
  local all
  local min
  local max

  target_dir=$1; shift
  target=$1; shift

  limit_files=20
  limit_lines=80
  limit_hierarchy=4

  all_files=$(find docs -type f -not -name index.md)

  all_lines=0
  min_lines=
  max_lines=0

  all_hierarchy=0
  min_hierarchy=
  max_hierarchy=0

  for file in $all_files; do
    count=$(cat $file | wc -l)
    all=$all_lines
    min=$min_lines
    max=$max_lines
    getto_codes_docs_stat_sum
    all_lines=$all
    min_lines=$min
    max_lines=$max

    count=$(echo $file | sed 's|[^/]||g' | wc -c)
    count=$(($count - 2))
    all=$all_hierarchy
    min=$min_hierarchy
    max=$max_hierarchy
    getto_codes_docs_stat_sum
    all_hierarchy=$all
    min_hierarchy=$min
    max_hierarchy=$max
  done

  all_files=$(echo "$all_files" | wc -l)

  getto_codes_docs_stat_dump_badge "files" $limit_files $all_files
  getto_codes_docs_stat_dump_badge "lines" $limit_lines $all_lines $min_lines $max_lines
  getto_codes_docs_stat_dump_badge "hierarchy" $limit_hierarchy $all_hierarchy $min_hierarchy $max_hierarchy
}
getto_codes_docs_stat_sum(){
  if [ -z "$min" ]; then
    min=$count
  else
    if [ $count -lt $min ]; then
      min=$count
    fi
  fi

  if [ $count -gt $max ]; then
    max=$count
  fi

  all=$(($all + $count))
}
getto_codes_docs_stat_dump_badge(){
  local badge
  local limit
  local all_count
  local min_count
  local max_count
  local avg_count
  local message
  local color
  local url

  badge=$1; shift
  limit=$1; shift
  all_count=$1; shift
  min_count=$1; shift
  max_count=$1; shift

  if [ $badge = "files" ]; then
    message=$all_files
    color=success
  else
    avg_count=$(($all_count * 10 / $all_files))
    limit=$(($limit * 10))

    if [ $avg_count -gt $limit ]; then
      color=critical
    else
      color=success
    fi

    min_count=$(($min_count * 10))
    max_count=$(($max_count * 10))

    message=$min_count:$avg_count:$max_count
  fi

  url='https://img.shields.io/static/v1.svg?style=for-the-badge\&label='${badge}'\&message='${message}'\&color='${color}
  sed -i $APP_ROOT/README.md -e 's|^!\['$badge'\].*$|!['$badge']('$url')|'

  echo "${badge}: ${color}"
}

getto_codes_docs_stat_main "$@"
