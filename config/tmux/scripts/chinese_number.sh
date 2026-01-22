#!/bin/bash
# Convert Arabic numerals to Chinese numerals

num=$1

# Define Chinese numerals
chinese=(零 一 二 三 四 五 六 七 八 九)

# Handle single digit
if [ $num -lt 10 ]; then
    echo "${chinese[$num]}"
    exit 0
fi

# Handle two digits
if [ $num -lt 20 ]; then
    if [ $num -eq 10 ]; then
        echo "十"
    else
        ones=$((num % 10))
        echo "十${chinese[$ones]}"
    fi
    exit 0
fi

# Handle 20-99
if [ $num -lt 100 ]; then
    tens=$((num / 10))
    ones=$((num % 10))
    if [ $ones -eq 0 ]; then
        echo "${chinese[$tens]}十"
    else
        echo "${chinese[$tens]}十${chinese[$ones]}"
    fi
    exit 0
fi

# For numbers >= 100, just output as-is (fallback)
echo "$num"
