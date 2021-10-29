openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c "program $1 verify reset exit" 


