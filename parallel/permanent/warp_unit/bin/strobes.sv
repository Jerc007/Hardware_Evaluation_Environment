// ZOIX MODULE FOR FAULT INJECTION AND STROBING

`timescale 1ns / 1ns


module strobe;

	// Inject faults
	initial begin

		$display("ZOIX INJECTION");
		$fs_inject;  //     .. by default
		$fs_delete;
		$fs_add(warp_unit);
	
	end 


	initial begin
		#42209;								// XXX_1
			
		for ( int j=42209; j<49279 ;j = j+2) begin			// XXX_2

			#1;

			$fs_strobe(warp_unit.program_cntr_out);
			$fs_strobe(warp_unit.warp_id_out);
			$fs_strobe(warp_unit.warp_lane_id_out);
			$fs_strobe(warp_unit.cta_id_out);
			$fs_strobe(warp_unit.current_mask_out);
			$fs_strobe(warp_unit.shmem_base_addr_out);
			$fs_strobe(warp_unit.gprs_size_out);
			$fs_strobe(warp_unit.gprs_base_addr_out);
			$fs_strobe(warp_unit.num_warps_out);

			#1;
	   
		end

	end

endmodule
