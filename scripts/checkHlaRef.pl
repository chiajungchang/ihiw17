#!/usr/bin/perl
use strict;

my $reftsv="hlaRefAllele.tsv";
my $genfa="hla_gen.fasta";
open(my $fhgenfa, '<', $genfa)
  or die "Could not open file '$genfa' $!";
open(my $fhreftsv, '<', $reftsv)
  or die "Could not open file '$reftsv' $!";
my %alleles;
while(<$fhgenfa>){
	chop;
	next unless(/^>/);
	my @t=split /\s+/;
	$alleles{$t[1]}=1;
}
close $fhgenfa;
while(<$fhreftsv>){
	chop;
	s/.*HLA-//;
	print "$_ doesn't have a sequence in hla_gen.fasta.\n" unless(exists $alleles{$_});
}
close $fhreftsv;

