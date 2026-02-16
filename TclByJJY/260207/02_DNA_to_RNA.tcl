proc to-rna {dna} {
#    throw {NOT_IMPLEMENTED} "Implement this procedure."

    return [string map {G C C G T A A U} $dna]
}
