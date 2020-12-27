LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY UART_R IS
    PORT (
        CLK, UART_RX : IN STD_LOGIC;
        VALID, DATA : OUT STD_LOGIC
    );
END UART_R;
ARCHITECTURE rtl OF samp IS
    COMPONENT main IS
        PORT (
            clk, uart_rx, baud_in : IN STD_LOGIC;
            rec_out : OUT STD_LOGIC
        );
    END COMPONENT main;
    COMPONENT samp IS
        PORT (
            CLK, UART_RX : IN STD_LOGIC;
            BAUD_OUT : OUT STD_LOGIC
        );
    END COMPONENT samp;
    SIGNAL BAUD : STD_LOGIC;
BEGIN -- architecture rtl
    main : main
    PORT MAP(
        CLK => clk,
        UART_RX => uart_rx,
        BAUD => baud_in,
        rec_out => DATA
    );
    samp : samp
    PORT MAP(
        CLK => CLK,
        UART_RX => UART_RX,
        BAUD_OUT => BAUD
    );
END ARCHITECTURE rtl;
