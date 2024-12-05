# TB-Profiler Automation

Este repositório contém um script em bash para automatizar o processamento de amostras de tuberculose utilizando o [TB-Profiler](https://github.com/jodyphelan/TBProfiler).

## Funcionalidades

- Processa amostras FASTQ e organiza em pastas específicas.
- Automatiza a execução do `tb-profiler` para análise genômica.
- Consolida os resultados gerados em um único relatório.

## Pré-requisitos

- **TB-Profiler**: Certifique-se de que o [TB-Profiler](https://github.com/jodyphelan/TBProfiler) está instalado e configurado em ambiente conda.
- **GNU Parallel**: O script utiliza `parallel` para processar várias amostras simultaneamente.
- Sistema operacional Linux ou MacOS com Bash.

## Como Usar

1. Clone este repositório:
    ```bash
    git clone https://github.com/selatayaran/tb-profiler-automation.git
    cd tb-profiler-automation
    ```

2. Dê permissão de execução ao script:
    ```bash
    chmod +x script.sh
    ```

3. Execute o script e forneça o caminho das amostras quando solicitado:
    ```bash
    ./script.sh
    ```

4. Os resultados serão salvos na pasta `results/`.

## Estrutura do Projeto

- **script.sh**: Script principal.
- **samples.txt**: Lista de amostras processadas.
- **fastq/**: Arquivos FASTQ processados.
- **bam/**: Arquivos BAM gerados.
- **vcf/**: Arquivos VCF gerados.
- **results/**: Resultados consolidados.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.
