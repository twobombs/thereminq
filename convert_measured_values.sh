cd /var/log/qrack
find . -type f -name '*.log' -exec cat {} +  > measured.file
cat measured.file | grep test > measured.values
