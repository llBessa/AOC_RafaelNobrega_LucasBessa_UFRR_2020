Library Ieee;
Use Ieee.std_logic_1164.All;

Entity Extensor_2_8 Is 
		Port (
				in_port  : in Std_Logic_Vector (1 downto 0);
				out_port : out Std_Logic_Vector (7 downto 0)
		);

end Extensor_2_8;

Architecture Behavior Of Extensor_2_8 Is 
Begin 
		Process (in_port)
		Begin 
		
			Out_port <= ("000000") & in_port;
			
		End Process;
End Behavior;