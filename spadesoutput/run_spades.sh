set -e
true
true
/usr/libexec/spades/spades-hammer /home/muhammad_aqif/genomics/ncbi/spadesoutput/corrected/configs/config.info
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/compress_all.py --input_file /home/muhammad_aqif/genomics/ncbi/spadesoutput/corrected/corrected.yaml --ext_python_modules_home /usr/share/spades --max_threads 4 --output_dir /home/muhammad_aqif/genomics/ncbi/spadesoutput/corrected --gzip_output
true
true
/usr/libexec/spades/spades-core /home/muhammad_aqif/genomics/ncbi/spadesoutput/K21/configs/config.info /home/muhammad_aqif/genomics/ncbi/spadesoutput/K21/configs/careful_mode.info
/usr/libexec/spades/spades-core /home/muhammad_aqif/genomics/ncbi/spadesoutput/K33/configs/config.info /home/muhammad_aqif/genomics/ncbi/spadesoutput/K33/configs/careful_mode.info
/usr/libexec/spades/spades-core /home/muhammad_aqif/genomics/ncbi/spadesoutput/K55/configs/config.info /home/muhammad_aqif/genomics/ncbi/spadesoutput/K55/configs/careful_mode.info
/usr/libexec/spades/spades-core /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/configs/config.info /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/configs/careful_mode.info
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/copy_files.py /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/before_rr.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/before_rr.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/assembly_graph_after_simplification.gfa /home/muhammad_aqif/genomics/ncbi/spadesoutput/assembly_graph_after_simplification.gfa /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/final_contigs.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/contigs.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/first_pe_contigs.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/first_pe_contigs.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/strain_graph.gfa /home/muhammad_aqif/genomics/ncbi/spadesoutput/strain_graph.gfa /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/scaffolds.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/scaffolds.fasta /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/scaffolds.paths /home/muhammad_aqif/genomics/ncbi/spadesoutput/scaffolds.paths /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/assembly_graph_with_scaffolds.gfa /home/muhammad_aqif/genomics/ncbi/spadesoutput/assembly_graph_with_scaffolds.gfa /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/assembly_graph.fastg /home/muhammad_aqif/genomics/ncbi/spadesoutput/assembly_graph.fastg /home/muhammad_aqif/genomics/ncbi/spadesoutput/K77/final_contigs.paths /home/muhammad_aqif/genomics/ncbi/spadesoutput/contigs.paths
true
true
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/correction_iteration_script.py --corrected /home/muhammad_aqif/genomics/ncbi/spadesoutput/contigs.fasta --assembled /home/muhammad_aqif/genomics/ncbi/spadesoutput/misc/assembled_contigs.fasta --assembly_type contigs --output_dir /home/muhammad_aqif/genomics/ncbi/spadesoutput --bin_home /usr/libexec/spades
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/correction_iteration_script.py --corrected /home/muhammad_aqif/genomics/ncbi/spadesoutput/scaffolds.fasta --assembled /home/muhammad_aqif/genomics/ncbi/spadesoutput/misc/assembled_scaffolds.fasta --assembly_type scaffolds --output_dir /home/muhammad_aqif/genomics/ncbi/spadesoutput --bin_home /usr/libexec/spades
true
/usr/bin/python3 /usr/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /home/muhammad_aqif/genomics/ncbi/spadesoutput/scaffolds.fasta --misc_dir /home/muhammad_aqif/genomics/ncbi/spadesoutput/misc --threshold_for_breaking_scaffolds 3
true
