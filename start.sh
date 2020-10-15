#!/bin/bash

cat > /var/www/html/index.html <<EOF
<html>
<body bgcolor='$COLOR'>
<h2>$TITLE</h2>
soon ...
</body>
</html>
EOF

nginx -g "daemon off;"