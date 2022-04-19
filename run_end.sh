for seed in 13 21 42 87 100
do
    for bs in 2 4 8
    do
        for lr in 1e-5 2e-5 5e-5
        do
            TAG=LM-BFF \
            TYPE=prompt-demo \
            TASK=SST-2 \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=bert-base-uncased \
            bash run_experiment.sh "--template_path auto_template/SST-2/8-$seed.sort.txt --template_id 0 --demo_filter --demo_filter_model sbert-bert-base"
        done
    done
done

python tools/gather_result.py --condition "{'tag': 'LM-BFF', 'task_name': 'sst-2', 'few_shot_type': 'prompt-demo'}"