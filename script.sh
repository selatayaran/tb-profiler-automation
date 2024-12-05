#!/bin/bash

# Passo 1
# Solicita o caminho das amostras ao usuário
echo "Digite o caminho das amostras:"
read amostras_caminho

# Cria a pasta fastq se não existir
mkdir -p fastq

# Copia as amostras para a pasta fastq
for arquivo in "$amostras_caminho"/*_R1.fastq.gz; do
    # Obtém o nome base do arquivo sem extensão
    base_nome=$(basename "$arquivo" _R1.fastq.gz)
    
    # Copia os arquivos R1 e R2 para a pasta fastq com novo nome
    cp "$arquivo" fastq/"${base_nome}_R1.fastq.gz"
    cp "$arquivo" fastq/"${base_nome}_R2.fastq.gz"
    
    echo "Amostra "$base_nome" movida com sucesso"
done

echo "Amostras movidas com sucesso"

# Remove "R" do nome dos arquivos
cd fastq || exit
for arquivo in *_R1.fastq.gz; do
    novo_nome=$(echo "$arquivo" | sed 's/_R1/_1/')
    mv "$arquivo" "$novo_nome"
done

for arquivo in *_R2.fastq.gz; do
    novo_nome=$(echo "$arquivo" | sed 's/_R2/_2/')
    mv "$arquivo" "$novo_nome"
done

echo "Remoção dos R's"

# Passo 2
cd ..
# Lista os arquivos na pasta fastq e filtra apenas os R1, removendo a extensão
ls fastq/ | grep _1.fastq.gz | sed 's/_1.fastq.gz//' > samples.txt

echo "Lista de amostras:"
cat samples.txt

# Passo 3
# Cria as pastas bam, vcf e results se não existirem
mkdir -p bam vcf results

# Passo 4
# Para cada amostra listada em samples.txt, executa tb-profiler profile paralelamente
cat samples.txt | parallel --bar -j 2 tb-profiler profile -1 fastq/{}_1.fastq.gz -2 fastq/{}_2.fastq.gz -p {} --txt

echo "Concluído TB-PROFILER!"

# Passo 5
# Executa tb-profiler collate para consolidar os resultados
tb-profiler collate
echo "Concluído TB-PROFILER COLLATE!"