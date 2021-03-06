#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use feature qw/ unicode_strings say /;
use open qw/ :encoding(UTF-8) :std /;
use Test::More;
use Lingua::LO::NLP::Data ':all';

my $re_short = '(?^ux: (?:(?:(?:ເຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?(?:[່້໊໋]?[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|[ິີ][່້໊໋]?[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|[ຶື][່້໊໋]?ອ[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|າ?ະ|ົ[່້໊໋]?າ|ັ[່້໊໋]?[ກງຍດນມຢບວ](?: [ຈສຊພຟລ] ໌)?|ັ?[່້໊໋]?ຽ))|(?:ແຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?(?:[່້໊໋]?[ວອຽ]?[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|ະ|ັ[່້໊໋]?[ກງຍດນມຢບວ](?: [ຈສຊພຟລ] ໌)?))|(?:ໂຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?(?:[່້໊໋]?[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|ະ|ັ[່້໊໋]?[ຍດນມຢບ]?))|ໄຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[່້໊໋]?ວ?(?: [ຈສຊພຟລ] ໌)?|ໃຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[່້໊໋]?ວ?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[ຸູ][່້໊໋]?[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[ິີຶື][່້໊໋]?[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?ໍ[່້໊໋]?າ?(?: [ຈສຊພຟລ] ໌)?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?ົ[່້໊໋]?(?:[ກງຍດນມຢບວ](?: [ຈສຊພຟລ] ໌)?|ວະ)|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?ັ[່້໊໋]?ວ?[ກງຍດນມຢບວ](?: [ຈສຊພຟລ] ໌)?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[່້໊໋]?[ວອຽ][ກງຍດນມຢບວ](?: [ຈສຊພຟລ] ໌)?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[່້໊໋]?ະ|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[່້໊໋]?າ[ກງຍດນມຢບວ]?(?: [ຈສຊພຟລ] ໌)?|ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ][ຼຣວລ]?[່້໊໋]?ຳ(?: [ຈສຊພຟລ] ໌)?)[ຯໆ]?|[໑໒໓໔໕໖໗໘໙໐]+) )';

sub is_re {
    my ($is, $should, $message) = @_;
    # fix up for Perl < 5.14
    if($^V < 5.014_000) {
        s/\(\?\S+?://g for $is, $should;   # makes malformed RE, but never mind
    }
    return is($is, $should, $message);
}


my $re_is = Lingua::LO::NLP::Data::get_sylre_basic;
is_re("$re_is", $re_short, "Basic regexp OK");
#$re_is = Lingua::LO::NLP::Data::get_sylre_full;
#is_re("$re_is", $re_full, "Full regexp OK");
done_testing;
