#!/bin/bash
#add fix to exercise6-fix here
# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Error: At least two arguments are required."
    exit 1
fi

# Determine the other server. This assumes the servers are named "server1" and "server2".
# You might need to adjust this logic if the server names are different.
HOSTNAME=$(hostname)
if [ "$HOSTNAME" == "server1" ]; then
    OTHER_SERVER="server2"
elif [ "$HOSTNAME" == "server2" ]; then
    OTHER_SERVER="server1"
else
    echo "Error: Unknown server."
    exit 1
fi

# Extract the destination directory (last argument)
DEST_DIR="${!#}"

# Initialize a variable to keep track of total bytes copied
TOTAL_BYTES=0

# Loop through all files (all arguments except the last one)
for (( i=1; i<$#; i++ )); do
    FILE="${!i}"  # Get the ith argument
    # Use scp to copy the file to the other server
    scp "$FILE" "$OTHER_SERVER:$DEST_DIR"
    # Add the size of the file to the total bytes
    TOTAL_BYTES=$(( TOTAL_BYTES + $(stat -c %s "$FILE") ))
done

# Print the total bytes copied
echo "$TOTAL_BYTES"

exit 0
