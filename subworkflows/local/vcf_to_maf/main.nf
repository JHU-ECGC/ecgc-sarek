//
// convert vcf to maf
//

include { VCF2MAF } from '../../../modules/nf-core/vcf2maf/main'

workflow VCF_TO_MAF {
    take:
    ch_vcf                      // channel: [ val(meta), path(vcf) ]
    fasta                       // channel: [ val(meta2), path(fasta) ]
    vep_cache                   // empty if we don't want vep

    main:
    VCF2MAF(ch_vcf, fasta, vep_cache)

    emit:
    maf = VCF2MAF.out.maf // channel: [ val(meta), path(maf) ]
    versions = VCF2MAF.out.versions // channel: [ versions.yml ]
}