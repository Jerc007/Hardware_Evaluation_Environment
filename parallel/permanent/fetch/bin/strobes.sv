// ZOIX MODULE FOR FAULT INJECTION AND STROBING

`timescale 1ns / 1ns

module strobe;

	// Inject faults
	initial begin

		$display("ZOIX INJECTION");
		$fs_inject;  //     .. by default
		$fs_delete;
		$fs_add(pipeline_fetch);
	
	end 
 	
	initial begin
	
		#42209;								// XXX_1
			
		for ( int j=42209; j<49279 ;j = j+2) begin			// XXX_2

			#1;
 	
			$fs_strobe(pipeline_fetch.mem_addr_out);
			$fs_strobe(pipeline_fetch.program_cntr_out);
			$fs_strobe(pipeline_fetch.warp_id_out);
			$fs_strobe(pipeline_fetch.warp_lane_id_out);
			$fs_strobe(pipeline_fetch.cta_id_out);
			$fs_strobe(pipeline_fetch.initial_mask_out);
			$fs_strobe(pipeline_fetch.current_mask_out);
			$fs_strobe(pipeline_fetch.shmem_base_addr_out);
			$fs_strobe(pipeline_fetch.gprs_size_out);	
			$fs_strobe(pipeline_fetch.gprs_base_addr_out);
			$fs_strobe(pipeline_fetch.next_pc_out);
			$fs_strobe(pipeline_fetch.instruction_out);
		

			#1;
	   
		end

	end

endmodule
