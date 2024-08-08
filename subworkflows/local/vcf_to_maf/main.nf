//
// convert vcf to maf
//

include { VCF2MAF } from '../../../modules/nf-core/vcf2maf/main'

workflow VCF_TO_MAF {
    take:
    ch_vcf                      // channel: [ val(meta), path(vcf), [path(custom_file1), path(custom_file2)... (optionnal)]]
    fasta                       // channel: [ val(meta2), path(fasta) ] (optional)

    main:
    VCF2MAF(
        ch_vcf,
        fasta,
        Channel.empty()
    )

    emit:
    maf = VCF2MAF.out.maf // channel: [ val(meta), path(maf) ]
    versions = VCF2MAF.out.versions // channel: [ versions.yml ]
}