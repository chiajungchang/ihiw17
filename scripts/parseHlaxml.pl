#!/usr/bin/perl -w
use strict;
use warnings;
use XML::Simple;
use Data::Dumper;

my $inXml="hla.xml";

my $hax = XMLin($inXml,ForceArray => ['allele']) or die "cannot parse $inXml: $!";
my $hao={};
my $alleles=$hax->{allele};
my $allele;
my $i=0;
foreach $allele (%{$alleles}){
        my $id=$alleles->{$allele}->{id};
        my $version = $alleles->{$allele}->{releaseversions}->{currentrelease};
        my $seq=$alleles->{$allele}->{sequence}->{feature};
        my $feature;
        foreach $feature (keys %{$seq}){
                next if($feature eq 'Translation');
                print "$allele\t$id\t$version\t$feature\t";
                print $seq->{$feature}->{id}."\t";
                print $seq->{$feature}->{SequenceCoordinates}->{start}."\t";
                print $seq->{$feature}->{SequenceCoordinates}->{end}."\n";
        }
}
