task=SST-2
for mapping_id in $(seq 0 10)
do
    for seed in 13 21 42 87 100
    do
        # To save time, we fix these hyper-parameters
        bs=128
        lr=1e-5

        # Since we only use dev performance here, use --no_predict to skip testing
        TAG=exp-mapping \
        TYPE=prompt \
        TASK=$task \
        BS=$bs \
        LR=$lr \
        SEED=$seed \
        MODEL=bert-base-uncased \
        bash run_experiment.sh "--mapping_path /data/dheeraj/LM-BFF/my_auto_label_mapping/manual_template/$task/8-$seed.txt --mapping_id $mapping_id --no_predict"
    done
done