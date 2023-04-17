// ZOIX MODULE FOR FAULT INJECTION AND STROBING

`timescale 1ns / 1ns


module strobe;

	// Inject faults
	initial begin

		$display("ZOIX INJECTION");
		$fs_inject;  //     .. by default
		$fs_delete;
		$fs_add(pipeline_decode);
	
	end 

	initial begin
		#42209;					// XXX_1
			
		for ( int j=42209; j<49279 ;j = j+2) begin			// XXX_2

			#1;

			$fs_strobe(pipeline_decode.program_cntr_out);
			$fs_strobe(pipeline_decode.warp_id_out);
			$fs_strobe(pipeline_decode.warp_lane_id_out);
			$fs_strobe(pipeline_decode.cta_id_out);
			$fs_strobe(pipeline_decode.initial_mask_out);	
			$fs_strobe(pipeline_decode.current_mask_out);
			$fs_strobe(pipeline_decode.shmem_base_addr_out);
			$fs_strobe(pipeline_decode.gprs_size_out);
			$fs_strobe(pipeline_decode.gprs_base_addr_out);
			$fs_strobe(pipeline_decode.next_pc_out);	
			$fs_strobe(pipeline_decode.instr_opcode_out);
			$fs_strobe(pipeline_decode.instr_subop_out);
			$fs_strobe(pipeline_decode.alu_opcode_out);
			$fs_strobe(pipeline_decode.mov_opcode_out);
			$fs_strobe(pipeline_decode.flow_opcode_out);	
			$fs_strobe(pipeline_decode.instr_marker_out);
			$fs_strobe(pipeline_decode.pred_reg_out);
			$fs_strobe(pipeline_decode.pred_cond_out);
			$fs_strobe(pipeline_decode.set_pred_reg_out);
			$fs_strobe(pipeline_decode.abs_saturate_out);
			$fs_strobe(pipeline_decode.cvt_round_out);
			$fs_strobe(pipeline_decode.cvt_type_out);
			$fs_strobe(pipeline_decode.condition_out);
			$fs_strobe(pipeline_decode.addr_lo_out);
			$fs_strobe(pipeline_decode.addr_reg_out);
			$fs_strobe(pipeline_decode.mov_size_out);
			$fs_strobe(pipeline_decode.mem_type_out);
			$fs_strobe(pipeline_decode.sm_type_out);
			$fs_strobe(pipeline_decode.imm_hi_out);
			$fs_strobe(pipeline_decode.src1_mem_type_out);
			$fs_strobe(pipeline_decode.src2_mem_type_out);
			$fs_strobe(pipeline_decode.src3_mem_type_out);
			$fs_strobe(pipeline_decode.dest_mem_type_out);
			$fs_strobe(pipeline_decode.src1_mem_opcode_out);
			$fs_strobe(pipeline_decode.src2_mem_opcode_out);
			$fs_strobe(pipeline_decode.src3_mem_opcode_out);
			$fs_strobe(pipeline_decode.dest_mem_opcode_out);
			$fs_strobe(pipeline_decode.target_addr_out);
			$fs_strobe(pipeline_decode.src1_data_type_out);
			$fs_strobe(pipeline_decode.src2_data_type_out);
			$fs_strobe(pipeline_decode.src3_data_type_out);
			$fs_strobe(pipeline_decode.dest_data_type_out);
			$fs_strobe(pipeline_decode.src1_out);
			$fs_strobe(pipeline_decode.src2_out);
			$fs_strobe(pipeline_decode.src3_out);
			$fs_strobe(pipeline_decode.dest_out);

			#1;

		end

	end

endmodule
