onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/clk_in
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/host_reset
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/reset_registers
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/config_reg_cs
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/config_reg_rw
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/config_reg_adr
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/config_reg_data_in
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/config_reg_data_out
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_blocks_per_core
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_num_gprs
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_shmem_size
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_parameter_size
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_dyn_shmem_size
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_block_x
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_block_y
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_block_z
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_grid_x
add wave -noupdate -group SMPCfg /tb_top_level/uGPGPU/uGPGPUConfiguration/kernel_grid_y
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_blocks_per_core_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_num_gprs_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_shmem_size_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_parameter_size_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_dyn_shmem_size_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_block_x_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_block_y_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_block_z_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_grid_x_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/kernel_grid_y_in
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/threads_per_block_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/num_blocks_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/shmem_base_addr_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/shmem_size_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/parameter_size_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/gprs_size_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/block_x_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/block_y_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/block_z_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/grid_x_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/grid_y_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/block_idx_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/shmem_params_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/cmem_params_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/smp_reset_out
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/block_scheduler_state_machine
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/grid_dimension
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/num_blocks
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/blocks_scheduled_cnt
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/threads_per_block_i
add wave -noupdate -expand -group BlockScheduler /tb_top_level/uGPGPU/uBlockScheduler/blocks_remaining
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/clk_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/host_reset
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_scheduler_reset
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_generator_en
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/pipeline_write_done
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/pipeline_stall_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/threads_per_block_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/num_blocks_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warps_per_block_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/shared_mem_base_addr_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/shared_mem_size_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/gprs_size_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/block_x_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/block_y_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/block_z_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/grid_x_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/grid_y_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/block_idx_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_id_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_lane_id_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/cta_id_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/initial_mask_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/current_mask_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/shmem_base_addr_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/gprs_base_addr_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/next_pc_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_state_in
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/program_cntr_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_id_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_lane_id_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/cta_id_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/initial_mask_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/current_mask_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/shmem_base_addr_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/gprs_size_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/gprs_base_addr_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/num_warps_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_generator_done
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/pipeline_stall_out
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/warp_scheduler_done
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/pipeline_warpunit_done
add wave -noupdate -group WarpUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/fetch_en
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/num_blocks_in
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warps_per_block_in
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/shmem_base_addr_in
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/shmem_size_in
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/gprs_size_in
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_pool_addr_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_pool_wr_en_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_pool_wr_data_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_state_addr_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_state_wr_en_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_state_wr_data_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/fence_regs_cta_id_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/num_warps_out
add wave -noupdate -group WarpGen /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_generator_state_machine
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/host_reset
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/reset
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/pipeline_stall_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/num_blocks_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/num_warps_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/gprs_size_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warps_done_mask_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_pool_addr_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_pool_wr_en_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_pool_wr_data_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_pool_rd_data_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_state_addr_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_state_wr_en_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_state_wr_data_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_state_rd_data_in
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/program_cntr_out
add wave -noupdate -expand -group WarpScheduler -color Red /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_id_out
add wave -noupdate -expand -group WarpScheduler -color Red /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_lane_id_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/cta_id_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/initial_mask_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/current_mask_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/shmem_base_addr_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/gprs_size_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/gprs_base_addr_out
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/done
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/pipeline_warpunit_done
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/fetch_en
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_scheduler_state_machine
add wave -noupdate -expand -group WarpScheduler /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_scheduler_next_state
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/clk_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/host_reset
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/reset
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/en
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_id_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_lane_id_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/cta_id_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/initial_mask_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/current_mask_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/shmem_base_addr_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/gprs_base_addr_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/next_pc_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_state_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warps_per_block_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_pool_addr_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_pool_wr_en_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_pool_wr_data_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_state_addr_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_state_wr_en_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_state_wr_data_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/fence_regs_fence_en_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/fence_regs_fence_en_ld
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/fence_regs_cta_id_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/fence_regs_fence_en_in
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warps_done_mask_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/pipeline_stall_out
add wave -noupdate -group WarpChecker /tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_checker_state_machine
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/reset
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/fetch_en
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/pass_en
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/pipeline_stall_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/program_cntr_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/warp_id_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/warp_lane_id_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/cta_id_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/initial_mask_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/current_mask_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/shmem_base_addr_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/gprs_size_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/gprs_base_addr_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_wr_data_a_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_addr_a_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_wr_en_a_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_rd_data_a_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_wr_data_b_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_addr_b_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_wr_en_b_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/mem_rd_data_b_in
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/program_cntr_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/warp_id_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/warp_lane_id_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/cta_id_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/initial_mask_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/current_mask_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/shmem_base_addr_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/gprs_size_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/gprs_base_addr_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/next_pc_out
add wave -noupdate -expand -group Fetch -color Yellow /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/instruction_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/pipeline_stall_out
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/pipeline_fetch_done
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/fetch_state_machine
add wave -noupdate -expand -group Fetch /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/long_instruction_en
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/reset
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/clk_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/pipeline_stall_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/pipeline_fetch_done
add wave -noupdate -group Decode -color Yellow /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/program_cntr_in
add wave -noupdate -group Decode -color Yellow /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/flow_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/warp_id_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/warp_lane_id_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/cta_id_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/initial_mask_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/current_mask_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/shmem_base_addr_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/gprs_size_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/gprs_base_addr_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/next_pc_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instruction_in
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/program_cntr_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/warp_id_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/warp_lane_id_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/cta_id_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/initial_mask_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/current_mask_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/shmem_base_addr_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/gprs_size_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/gprs_base_addr_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/next_pc_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_subop_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/alu_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/mov_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_marker_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_src1_shared_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_src2_const_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_src3_const_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/pred_reg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/pred_cond_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/set_pred_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/set_pred_reg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/output_reg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/write_pred_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/is_signed_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/w32_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/f64_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/saturate_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/abs_saturate_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/cvt_round_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/cvt_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/cvt_neg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/condition_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/addr_hi_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/addr_lo_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/addr_reg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/addr_incr_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/mov_size_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/alt_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/mem_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/sm_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/imm_hi_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/addr_imm_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src1_shared_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src1_mem_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src2_mem_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src3_mem_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/dest_mem_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src1_mem_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src2_mem_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src3_mem_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/dest_mem_opcode_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src1_neg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src2_neg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src3_neg_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/target_addr_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src1_data_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src2_data_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src3_data_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/dest_data_type_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src1_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src2_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/src3_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/dest_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/pipeline_stall_out
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/pipeline_dec_done
add wave -noupdate -group Decode /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/dec_state_machine
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/reset
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pipeline_dec_done
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pipeline_stall_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_id_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_lane_id_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cta_id_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/initial_mask_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/current_mask_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/shmem_base_addr_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_size_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_base_addr_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/next_pc_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instr_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instr_subop_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/alu_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/flow_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/mov_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instr_marker_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_reg_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_cond_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/set_pred_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/set_pred_reg_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/write_pred_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/is_signed_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/w32_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/f64_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/saturate_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/abs_saturate_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cvt_round_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cvt_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cvt_neg_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/condition_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_hi_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_lo_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_incr_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/mov_size_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/mem_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/sm_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/imm_hi_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_imm_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_mem_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src2_mem_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src3_mem_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_mem_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_mem_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src2_mem_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src3_mem_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_mem_opcode_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_neg_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src2_neg_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src3_neg_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/target_addr_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_data_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src2_data_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src3_data_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_data_type_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src2_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src3_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_base_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_reg_num_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_lane_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_wr_en_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_wr_data_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_regs_warp_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_regs_warp_lane_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_regs_reg_num_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_regs_wr_en_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_regs_wr_data_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_regs_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_regs_warp_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_regs_warp_lane_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_regs_reg_num_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_regs_wr_en_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_regs_wr_data_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_regs_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_req_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_ack_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_grant_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_stack_en
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_push_en
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_div_stack_empty
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/shmem_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/shmem_wr_en_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/shmem_wr_data_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/shmem_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cmem_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cmem_wr_en_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cmem_wr_data_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cmem_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gmem_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gmem_wr_en_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gmem_wr_data_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gmem_rd_data_in
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/warp_lane_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cta_id_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/initial_mask_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/current_mask_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/shmem_base_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_size_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/gprs_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instruction_mask_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/next_pc_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instr_opcode_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instr_subop_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/alu_opcode_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/flow_opcode_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/mov_opcode_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/instr_marker_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/set_pred_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/set_pred_reg_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/write_pred_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/is_full_normal_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/is_signed_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/w32_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/f64_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/saturate_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/abs_saturate_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cvt_round_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cvt_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/cvt_neg_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/condition_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_hi_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_lo_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_incr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/mov_size_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/mem_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/sm_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/addr_imm_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_mem_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_mem_opcode_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_neg_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src2_neg_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src3_neg_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/target_addr_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_data_type_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/src1_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/dest_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pred_flags_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/temp_vector_register_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pipeline_stall_out
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/pipeline_read_done
add wave -noupdate -group Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/read_state_machine
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/reset
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/clk_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/en
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/read_source_ops_state_machine
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/instr_opcode_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/alu_opcode_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/instr_marker_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/mask_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_reg_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_imm_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_reg_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/mov_size_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/sm_type_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/mem_type_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/imm_hi_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/src_mem_type_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/src_data_type_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/src_mem_opcode_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/dest_mem_type_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_req_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_ack_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_grant_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_reg_num_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_data_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_mask_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gprs_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_reg_num_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/addr_regs_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_reg_num_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/pred_regs_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_addr_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_rd_wr_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_sm_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_mask_out
add wave -noupdate -group ReadSrc1 -expand -subitemconfig {/tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_rd_data_in(0) -expand} /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/shmem_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_addr_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_rd_wr_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_sm_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_mask_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/cmem_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_addr_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_rd_wr_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_data_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_mask_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/gmem_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_reg_num_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_data_type_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_gprs_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_en_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_reg_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_rd_data_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/effaddr_addr_regs_rdy_in
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/data_out
add wave -noupdate -group ReadSrc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource1/rdy_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/reset
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/clk_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/en
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/read_source_ops_state_machine
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/instr_opcode_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/alu_opcode_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/instr_marker_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/mask_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_reg_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_imm_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_reg_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/mov_size_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/sm_type_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/mem_type_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/imm_hi_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/src_mem_type_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/src_data_type_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/src_mem_opcode_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/dest_mem_type_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_req_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_ack_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_grant_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_reg_num_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_data_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_mask_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gprs_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_reg_num_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/addr_regs_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_reg_num_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/pred_regs_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_addr_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_rd_wr_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_sm_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_mask_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/shmem_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_addr_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_rd_wr_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_sm_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_mask_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/cmem_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_addr_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_rd_wr_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_data_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_mask_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/gmem_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_reg_num_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_data_type_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_gprs_rdy_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_en_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_reg_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_rd_data_in
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/effaddr_addr_regs_rdy_in
add wave -noupdate -group ReadSrc2 -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/data_out
add wave -noupdate -group ReadSrc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource2/rdy_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/reset
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/clk_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/en
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/read_source_ops_state_machine
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/instr_opcode_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/alu_opcode_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/instr_marker_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/mask_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_reg_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_imm_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_reg_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/mov_size_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/sm_type_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/mem_type_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/imm_hi_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/src_mem_type_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/src_data_type_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/src_mem_opcode_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/dest_mem_type_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_req_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_ack_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_grant_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_reg_num_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_data_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_mask_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gprs_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_reg_num_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/addr_regs_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_reg_num_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/pred_regs_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_addr_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_rd_wr_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_sm_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_mask_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/shmem_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_addr_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_rd_wr_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_sm_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_mask_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/cmem_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_addr_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_rd_wr_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_data_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_mask_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/gmem_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_reg_num_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_data_type_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_gprs_rdy_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_en_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_reg_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_rd_data_in
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/effaddr_addr_regs_rdy_in
add wave -noupdate -group ReadSrc3 -expand -subitemconfig {/tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/data_out(7) -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/data_out(6) -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/data_out(5) -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/data_out(4) -expand} /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/data_out
add wave -noupdate -group ReadSrc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uReadSource3/rdy_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/reset
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/clk_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pipeline_read_done
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pipeline_stall_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_id_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_lane_id_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/cta_id_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/initial_mask_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/current_mask_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/shmem_base_addr_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gprs_size_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gprs_base_addr_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/instr_mask_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/next_pc_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/instr_opcode_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/instr_subop_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/alu_opcode_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/flow_opcode_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/mov_opcode_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/instr_marker_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/set_pred_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/set_pred_reg_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/write_pred_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/is_signed_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/w32_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/f64_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/saturate_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/abs_saturate_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/cvt_round_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/cvt_type_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/cvt_neg_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/set_cond_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_hi_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_lo_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_incr_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/mov_size_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/mem_type_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/sm_type_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_imm_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_mem_type_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_mem_opcode_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/src1_neg_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/src2_neg_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/src3_neg_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/target_addr_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_data_type_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/src1_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pred_flags_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/temp_vector_register_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_req_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_ack_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_grant_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_stack_en_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_wr_data_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_rd_data_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_push_en_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_stack_full_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_div_stack_empty_in
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_id_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_lane_id_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/cta_id_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/initial_mask_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/current_mask_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/shmem_base_addr_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gprs_size_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gprs_base_addr_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/instr_mask_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/next_pc_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/warp_state_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/instr_opcode_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/set_pred_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/set_pred_reg_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/write_pred_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_hi_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_lo_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_incr_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/mov_size_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/sm_type_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/addr_imm_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/src1_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_mem_type_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_mem_opcode_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_data_type_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/dest_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pred_flags_out
add wave -noupdate -group Execute -expand -subitemconfig {/tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/temp_vector_register_out(0) -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/temp_vector_register_out(0)(0) -expand} /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/temp_vector_register_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pipeline_execute_done
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pipeline_stall_out
add wave -noupdate -group Execute /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/pipeline_execute_state_machine
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/warp_id_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/warp_lane_id_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/initial_mask_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/current_mask_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/instr_mask_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/next_pc_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/target_address_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/warp_div_wr_data_out
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/warp_div_rd_data_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/warp_div_stack_full_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/warp_div_stack_empty_in
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/initial_mask_out
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/current_mask_out
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/instr_mask_out
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/next_pc_out
add wave -noupdate -group BranchUnit /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/uBranchExecuteUnit/branch_state_machine
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc0 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(0)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc1 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc2 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(2)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc3 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(3)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc4 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(4)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc5 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(5)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc6 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(6)/uScalarProcessor/result_out
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/alu_opcode_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/instr_subop_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/src1_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/src2_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/src3_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/src1_neg_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/src2_neg_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/src3_neg_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/carry_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/saturate_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/w32_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/is_signed_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/abs_saturate_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/cvt_neg_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/cvt_type_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/set_cond_in
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/carry_out
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/overflow_out
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/sign_out
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/zero_out
add wave -noupdate -group ScalarProc7 /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(7)/uScalarProcessor/result_out
add wave -noupdate -group SP0_AddSub /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/uIAddSubrtract/a_in
add wave -noupdate -group SP0_AddSub /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/uIAddSubrtract/b_in
add wave -noupdate -group SP0_AddSub /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineExecute/gScalarProcessor(1)/uScalarProcessor/uIAddSubrtract/result_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/reset
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pipeline_execute_done
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pipeline_stall_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/warp_id_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/warp_lane_id_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/cta_id_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/initial_mask_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/current_mask_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/shmem_base_addr_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_base_addr_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/next_pc_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/warp_state_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/instr_opcode_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/temp_vector_register_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/dest_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/instruction_mask_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/instruction_flags_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/dest_data_type_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/dest_mem_type_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/dest_mem_opcode_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_hi_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_lo_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_imm_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_inc_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/mov_size_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/write_pred_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/set_pred_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/set_pred_reg_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/sm_type_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_base_addr_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_reg_num_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_lane_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_wr_en_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_wr_data_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_rd_data_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pred_regs_warp_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pred_regs_warp_lane_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pred_regs_reg_num_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pred_regs_wr_en_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pred_regs_wr_data_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pred_regs_rd_data_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_regs_warp_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_regs_warp_lane_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_regs_reg_num_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_regs_wr_en_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_regs_wr_data_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/addr_regs_rd_data_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/shmem_addr_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/shmem_wr_en_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/shmem_wr_data_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/shmem_rd_data_in
add wave -noupdate -group Write -color Red /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gmem_addr_out
add wave -noupdate -group Write -color Red /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gmem_wr_en_out
add wave -noupdate -group Write -color Red /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gmem_wr_data_out
add wave -noupdate -group Write -color Red /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gmem_rd_data_in
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/warp_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/warp_lane_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/cta_id_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/initial_mask_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/current_mask_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/shmem_base_addr_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/gprs_addr_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/next_pc_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/warp_state_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pipeline_stall_out
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/pipeline_write_done
add wave -noupdate -group Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/write_state_machine
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/reset
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/clk_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/en
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/mask_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/rd_wr_type_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/sm_type_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_lo_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_hi_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_imm_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_req_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_ack_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_grant_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_en_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_reg_num_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_data_type_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_rd_data_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/gprs_rdy_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_req_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_ack_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_grant_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_en_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_reg_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_rd_data_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/addr_regs_rdy_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/cmem_addr_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/cmem_wr_en_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/cmem_wr_data_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/cmem_rd_data_in
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/data_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/rdy_out
add wave -noupdate -group ConstMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uConstantMemoryController/constant_memory_cntrl_state_machine
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/reset
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/clk_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/en
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/data_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/mask_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/rd_wr_type_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/data_type_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_lo_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_hi_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_imm_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_req_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_ack_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_grant_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_en_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_reg_num_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_data_type_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_rd_data_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gprs_rdy_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_req_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_ack_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_grant_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_en_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_reg_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_rd_data_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_regs_rdy_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_addr_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_wr_en_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_wr_data_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_rd_data_in
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/data_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/rdy_out
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_hi_i_3
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_reg_i
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_addr_i
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_size_i
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_wr_en_i
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_en
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/effective_addr_en
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_o
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/addr_inc
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/effective_addr_rdy_o
add wave -noupdate -group GMemCtrl -expand -subitemconfig {/tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_rd_data(0) -expand} /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_rd_data
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/shift_i
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_size
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_rd_data_o
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_wr_data_i
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_rd_wr_done_o
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/gmem_regs
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/global_mem_rd_wr_cntr
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/global_mem_regs_cntr
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/next_read_write_state
add wave -noupdate -group GMemCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/global_memory_cntrl_state_machine
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/reg_in
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/addr_reg_in
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/shift_in
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/gprs_reg_num_out
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/gprs_rd_data_in
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/addr_regs_reg_out
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/addr_regs_rd_data_in
add wave -noupdate -group GMem_EffAddr -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/addr_out
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/effective_addr_state_machine
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/offset_reg
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/reg_shifted
add wave -noupdate -group GMem_EffAddr /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uGlobalMemoryController/uEffectiveAddress/addr_reg_num_i
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/clk_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/en
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/lane_id_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/base_addr_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/reg_num_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/data_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/data_type_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/mask_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/rd_wr_en_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/gprs_wr_en_out
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/gprs_base_addr_out
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/gprs_lane_id_out
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/gprs_reg_num_out
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/gprs_wr_data_out
add wave -noupdate -group VecRF_Read -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/gprs_rd_data_in
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/data_out
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/reg_num_i
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/reg_num_shifted
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/data_wr_shifted
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/data_rd_shifted
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/reg_hi_en
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/reg_size
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/reg_rd_wr_cnt
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/read_word_done
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/rdy_out
add wave -noupdate -group VecRF_Read /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineRead/uVectorRegisterFileController/regs_controller_state_machine
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reset
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/en
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/lane_id_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/base_addr_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/data_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/data_type_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/mask_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/rd_wr_en_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/gprs_base_addr_out
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/gprs_reg_num_out
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/gprs_lane_id_out
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reg_num_in
add wave -noupdate -group VecRF_Write -color Yellow /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/gprs_wr_en_out
add wave -noupdate -group VecRF_Write -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/gprs_wr_data_out
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/gprs_rd_data_in
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/data_out
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/rdy_out
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reg_num_i
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reg_num_shifted
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/data_wr_shifted
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/data_rd_shifted
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reg_hi_en
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reg_size
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/reg_rd_wr_cnt
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/read_word_done
add wave -noupdate -group VecRF_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uVectorRegisterFileController/regs_controller_state_machine
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/en
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/data_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/mask_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/rd_wr_type_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/data_type_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_lo_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_hi_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_imm_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_req_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_ack_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_grant_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_en_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_reg_num_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_data_type_out
add wave -noupdate -group GMEM_EffAddr_Write -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_rd_data_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gprs_rdy_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_req_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_ack_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_grant_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_en_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_reg_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_rd_data_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_regs_rdy_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_addr_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_wr_en_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_wr_data_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_rd_data_in
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/data_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/rdy_out
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/global_memory_cntrl_state_machine
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_hi_i_3
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_reg_i
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_addr_i
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_size_i
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_wr_en_i
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_en
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/effective_addr_en
add wave -noupdate -group GMEM_EffAddr_Write -expand /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_o
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/addr_inc
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/effective_addr_rdy_o
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_rd_data
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/shift_i
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_size
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_rd_data_o
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_wr_data_i
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_rd_wr_done_o
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/gmem_regs
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/global_mem_rd_wr_cntr
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/global_mem_regs_cntr
add wave -noupdate -group GMEM_EffAddr_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uGlobalMemoryController/next_read_write_state
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/warp_id_in
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/lane_id_in
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/reg_num_in
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/data_in
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/mask_in
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/addr_regs_warp_id_out
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/addr_regs_warp_lane_id_out
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/addr_regs_reg_num_out
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/addr_regs_wr_en_out
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/addr_regs_wr_data_out
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/addr_regs_rd_data_in
add wave -noupdate -group AddrRegCtrl_Write /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineWrite/uAddressRegisterController/data_out
add wave -noupdate -group ShMem /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSharedMemory/addr_a
add wave -noupdate -group ShMem /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSharedMemory/din_a
add wave -noupdate -group ShMem /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSharedMemory/addr_b
add wave -noupdate -group ShMem /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSharedMemory/din_b
add wave -noupdate -group ShMem /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSharedMemory/dout_a
add wave -noupdate -group ShMem /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSharedMemory/dout_b
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/SHMEM_ADDR_SIZE
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/host_reset
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/smp_run_en
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/warp_generator_done
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/warp_scheduler_done
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/threads_per_block_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/num_blocks_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/shmem_base_addr_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/shmem_size_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/parameter_size_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gprs_size_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/block_x_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/block_y_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/block_z_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/grid_x_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/grid_y_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/block_idx_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gpgpu_config_reg_cs_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gpgpu_config_reg_rw_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gpgpu_config_reg_adr_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gpgpu_config_reg_rd_data_in
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/shmem_addr_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/shmem_wr_en_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/shmem_wr_data_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gprs_base_addr_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gprs_reg_num_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gprs_lane_id_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gprs_wr_en_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/gprs_wr_data_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/warps_per_block_out
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/smp_configuration_en
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/warp_generator_en
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/smp_done
add wave -noupdate -expand -group SMPCtrl /tb_top_level/uGPGPU/uStreamingMultiProcessor/uSMPController/smp_cntlr_state_machine
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9206805 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 181
configure wave -valuecolwidth 160
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {42716599 ns}
