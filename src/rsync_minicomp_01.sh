#!/bin/bash

trap 'exit 1 ' SIGINT SIGTERM

for i in wapp_django_local_tasks capp_scan_sql wapp_main_menu wapp_php_console telegrambotadmin dss svc_dev telegram-bot svc_prod front_fast_01 isphere avtoplatforma_docker capp_ae_cli wapp_front_php_analyzer wapp_issues_monitoring wapp_log_viewer wapp_main_menu wapp_php_yaml_schemes wapp_ssh_tunnels_manager wapp_notes; do
  rsync \
    --delete\
    --ignore-errors \
    -a --no-perms --no-o --no-g \
    /home/hightemp/__SpecFolders__/WorkProjects/$i/ minicomp-01:/home/hightemp/__SpecFolders__/WorkProjects/$i
done

for i in wapp_password_manager wapp_excel_tables wapp_main_links wapp_links_manager wapp_data_tables wapp_home_database wapp_main_links wapp_drawio_diagram_manager wapp_dynamic_tables ext_bookmarks; do
  rsync \
    --delete\
    --ignore-errors \
    -a --no-perms --no-o --no-g \
    /home/hightemp/__SpecFolders__/Projects/$i/ minicomp-01:/home/hightemp/__SpecFolders__/Projects/$i
done

