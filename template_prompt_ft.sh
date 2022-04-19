task=SST-2
for template_id in $(seq 0 10)
do
    for seed in 13 21 42 87 100
    do
        # To save time, we fix these hyper-parameters
        bs=128
        lr=1e-5

        # Since we only use dev performance here, use --no_predict to skip testing
        TAG=exp-template \
        TYPE=prompt \
        TASK=$task \
        BS=$bs \
        LR=$lr \
        SEED=$seed \
        MODEL=bert-base-uncased \
        bash run_experiment.sh "--template_path /data/dheeraj/LM-BFF/my_auto_template/$task/8-$seed.txt --template_id $template_id --no_predict"
    done
done