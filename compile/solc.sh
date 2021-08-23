#!/usr/bin/env bash
set -e


yarn

# Remove existing files.
rm -f dist/*.sol

for contract_path in ./contracts/*.sol ./contracts/test/*.sol
do
  filename=$(basename -- "$contract_path")
  # Get contract name without extension and without directories.
  contract_name="${filename%.*}"
  npx hardhat flatten "${contract_path}" > "dist/${contract_name}.full.sol"
  # Fix for https://github.com/nomiclabs/truffle-flattener/issues/55
  sed -i '/^\/\/ SPDX-License-Identifier:/d' "dist/${contract_name}.full.sol"
  npx solcjs --bin --abi --optimize "dist/${contract_name}.full.sol" -o "dist"
  mv "dist/dist_${contract_name}_full_sol_${contract_name}.abi" "../res/${contract_name}.full.abi"
  mv "dist/dist_${contract_name}_full_sol_${contract_name}.bin" "../res/${contract_name}.full.bin"
  rm -f dist/*_sol_*
done
