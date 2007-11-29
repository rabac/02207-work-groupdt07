------------------------------------------------------------------------
-- Project      : 8404129 Hardware Description Languages
-- Group number : 32
-- Group        : Markku Eerola 177065
--                markku.eerola@tut.fi
--                Vesa Salander 168075
--                vesa.salander@tut.fi
-- Date         : 22.10.2004
-- File         : ctrl_fsm.vhdl
-- Design       : a state machine, v 1.11
------------------------------------------------------------------------
-- Description  : Implementation of the state machine specified in the
--                exercise specification. Fixed it to have two processes
--                instead of one. Removed the unnecessary IF - THEN.
------------------------------------------------------------------------
-- $Log$
------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY CTRL_FSM IS

   GENERIC (
      busw_g : INTEGER := 4 -- bus width
      );

   PORT (
      clk : IN STD_LOGIC; -- clock signal
      rst_n : IN STD_LOGIC; -- reset, active low
      data_in : IN STD_LOGIC_VECTOR(busw_g-1 DOWNTO 0); -- data in
      alu_ctrl_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- alu control
      pc_ctrl_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) -- pc control
      );


END CTRL_FSM;

ARCHITECTURE RTL OF CTRL_FSM IS

-- !! Important !! --

   -- enumerated data type states describes the states of the state
   -- machine
   TYPE states IS (init, fetch, add, sub, jmp, wait_s);

   -- attribute enum_encoding can be used to specify the state machine
   -- encoding
   ATTRIBUTE ENUM_ENCODING : STRING;

   -- specify one hot state encoding
   ATTRIBUTE ENUM_ENCODING OF states : 
      --       INIT   FETCH  ADD    SUB    JMP    WAIT_S
      TYPE IS "000001 000010 000100 001000 010000 100000";

   -- intermediate signal current_state holds the current state of the
   -- state machine
   SIGNAL current_state : states;

   -- interm. signal next_state represents the calculated next state of
   -- the state machine
   SIGNAL next_state    : states;

-- !! End of Important !! --

BEGIN  -- RTL

   -- the clocked process
   clocked : PROCESS(clk, rst_n)

   BEGIN -- the clocked process

      IF (rst_n = '0') THEN

         current_state <= init;

      ELSIF rising_edge(clk) THEN

         current_state <= next_state;
         
      END IF;

   END PROCESS clocked;
   
   combinatorial : PROCESS(current_state, data_in)

   BEGIN -- the combinatorial process
      
      -- the case-structure for the state machine
      CASE current_state IS

         -- initial state
         WHEN init =>

            pc_ctrl_out <= "01";
            alu_ctrl_out <= "00";
            next_state <= fetch;

            -- fetching data from data_in and acting to it
         WHEN fetch =>

            pc_ctrl_out <= "00";
            alu_ctrl_out <= "00";

            IF (data_in = "0000") THEN

               next_state <= init;

            ELSIF (data_in = "0001") THEN

               next_state <= add;

            ELSIF (data_in = "0010") THEN

               next_state <= sub;

            ELSIF (data_in = "0011") THEN

               next_state <= jmp;

            ELSE

               next_state <= init;

            END IF;

            -- adding
         WHEN add =>

            pc_ctrl_out <= "01";
            alu_ctrl_out <= "01";
            next_state <= init;

            -- substracting
         WHEN sub =>

            pc_ctrl_out <= "01";
            alu_ctrl_out <= "10";
            next_state <= init;

            -- jumping
         WHEN jmp =>

            pc_ctrl_out <= "10";
            alu_ctrl_out <= "00";
            next_state <= wait_s;

            -- waiting
         WHEN wait_s =>

            pc_ctrl_out <= "10";
            alu_ctrl_out <= "00";
            next_state <= init;

            -- any other
         WHEN OTHERS =>

            pc_ctrl_out <= "00";
            alu_ctrl_out <= "00";
            next_state <= init;

            -- case closed
      END CASE;
      
   END PROCESS combinatorial;

END RTL;
