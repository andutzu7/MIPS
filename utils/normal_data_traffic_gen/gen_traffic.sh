#!/bin/sh
links_file_path='modules/resources/web_page_links'

download_path='utils/normal_data_traffic_gen/page_output_tmp'

sleep_duration=2

while IFS= read -r link; do
	rm -rf $download_path
	mkdir $download_path
	selected_link=$(shuf -n 1 $links_file_path)
	wget -q -p -P $download_path --inet6-only -e robots=off $link

	sleep $sleep_duration
done < $links_file_path
