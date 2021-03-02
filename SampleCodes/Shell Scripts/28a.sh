#!/bin/bash
rm payslip.txt
printf "Basic pay   D.A         H.R.A       P.F     Gross salary\n" >>payslip.txt
n=$1

for ((i = 0; i < n; i++)); do
    read -p "salary = " basicpay
    da=$(echo "0.45 * $basicpay" | bc)
    hra=$(echo "0.15 * $basicpay" | bc)
    pf=$(echo "0.10 * $basicpay" | bc)
    gross=$(echo "$da + $hra + $pf" | bc)
    printf "$basicpay\t\t$da\t\t$hra\t\t$pf\t$gross\n" >>payslip.txt
done
