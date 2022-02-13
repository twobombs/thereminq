# scrape /var/log/qrack logs into resultsfile per number of qubits with 'collapsed wave function' 0 and binary conveniant value filter
#
# sycamore results:
#
cat /var/log/qrack/measured_supreme_* | grep ',12,' | grep -v 'TestName' | grep -v ',12,0' | grep -v ',12,-1' > supreme_12q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',14,' | grep -v 'TestName' | grep -v ',14,0' | grep -v ',12,-1' > supreme_14q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',16,' | grep -v 'TestName' | grep -v ',16,0' | grep -v ',12,-1' > supreme_16q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',18,' | grep -v 'TestName' | grep -v ',18,0' | grep -v ',12,-1' > supreme_18q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',20,' | grep -v 'TestName' | grep -v ',20,0' | grep -v ',12,-1' > supreme_20q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',22,' | grep -v 'TestName' | grep -v ',22,0' | grep -v ',12,-1' > supreme_22q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',24,' | grep -v 'TestName' | grep -v ',24,0' | grep -v ',12,-1' > supreme_24q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',26,' | grep -v 'TestName' | grep -v ',26,0' | grep -v ',12,-1' > supreme_26q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',28,' | grep -v 'TestName' | grep -v ',28,0' | grep -v ',12,-1' > supreme_28q14d_results.txt
cat /var/log/qrack/measured_supreme_* | grep ',30,' | grep -v 'TestName' | grep -v ',30,0' | grep -v ',12,-1' > supreme_30q14d_results.txt
#
wc -l supreme_12q14d_results.txt
wc -l supreme_14q14d_results.txt
wc -l supreme_16q14d_results.txt
wc -l supreme_18q14d_results.txt
wc -l supreme_20q14d_results.txt
wc -l supreme_22q14d_results.txt
wc -l supreme_24q14d_results.txt
wc -l supreme_26q14d_results.txt
wc -l supreme_28q14d_results.txt
wc -l supreme_30q14d_results.txt
#
# QFT results
#
cat /var/log/qrack/measured_cosmos_* | grep ',27,' | grep -v 'TestName' | grep -v ',27,0' | grep -v ',27,-1' > cosmos_27q_results.txt
#
wc -l cosmos_27q_results.txt
#
