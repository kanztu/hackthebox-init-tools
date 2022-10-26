### Memery dump Window
    - Volatility
        - Require https://github.com/volatilityfoundation/volatility3.git
        - https://github.com/carlospolop/autoVolatility
    - More resources
        - https://book.hacktricks.xyz/generic-methodologies-and-resources/basic-forensic-methodology/memory-dump-analysis/volatility-examples
    - Usage
        ```bash
        volatility -f WIN-LQS146OE2S1-20201027-142607.raw --profile=$p [plugin]
        volatility -f WIN-LQS146OE2S1-20201027-142607.raw --profile=$p pslist # check processes
        volatility -f WIN-LQS146OE2S1-20201027-142607.raw --profile=$p consoles # check console logs
        ```