#!/usr/bin/env bash

echo "Hello, I am building the compiler from $PWD/$(basename "$0").."
sleep 2
echo "My args:"
for arg in "$@"; do
    echo " ARG: '$arg'"
done
echo "Still building"
sleep 2
echo "Still building"
sleep 2

cat << EOF >compiler.sh
#!/usr/bin/env bash
echo "I am the compiled compiler at \$PWD/\$(basename "\$0")"
echo "Nice to meet you."
echo "I am compiling with the following args"
for arg in "\$@"; do
    echo " ARG: '\$arg'"
done
sleep 2
sleep "$((RANDOM % 5))"

echo "Writing binary file to" "'\${@: -1}'"
cat << FOO > "\${@: -1}"
#!/usr/bin/env bash
echo "I am the compiled binary at \\\$PWD/\\\$(basename "\\\$0")"
echo "We do not have much connection, you and I. Still, this encounter feels
special. I hope you won't mind if I think of you as a friend."
sleep 4

echo "It’s tempting to linger in this moment, while every possibility still
exists. But unless they are collapsed by an observer, they will never be more
than possibilities."
echo "Goodbye, my friend."

FOO

chmod +x "\${@: -1}"

echo "And I am done!"
EOF

chmod +x compiler.sh

echo "Done!"
