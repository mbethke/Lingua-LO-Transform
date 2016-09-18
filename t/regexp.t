#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use feature qw/ unicode_strings say /;
use open qw/ :encoding(UTF-8) :std /;
use Test::More;
use Lingua::LO::Transform::Regexp;

my $re_short = "(?^ux: (?: (?:(?: ເ ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? (?: [່້໊໋]? [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | [ິີ] [່້໊໋]? [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | [ຶື] [່້໊໋]? ອ [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | າ? ະ | ົ [່້໊໋]? າ | ັ [່້໊໋]? [ກງຍດນມຢບວ] (?: [ຈສຊພຟລ] ໌)? | ັ? [່້໊໋]? ຽ ) ) |(?: ແ ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? (?: [່້໊໋]? [ວອຽ]? [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | ະ | ັ [່້໊໋]? [ກງຍດນມຢບວ] (?: [ຈສຊພຟລ] ໌)? ) ) |(?: ໂ ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? (?: [່້໊໋]? [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | ະ | ັ [່້໊໋]? [ຍດນມຢບ]? ) ) |ໄ ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [່້໊໋]? ວ? (?: [ຈສຊພຟລ] ໌)? | ໃ ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [່້໊໋]? ວ? | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [ຸູ] [່້໊໋]? [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [ິີຶື] [່້໊໋]? [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? ໍ [່້໊໋]? າ? (?: [ຈສຊພຟລ] ໌)? | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? ົ [່້໊໋]? (?: [ກງຍດນມຢບວ] (?: [ຈສຊພຟລ] ໌)? | ວ ະ ) | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? ັ [່້໊໋]? ວ? [ກງຍດນມຢບວ] (?: [ຈສຊພຟລ] ໌)? |ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [່້໊໋]? [ວອຽ] [ກງຍດນມຢບວ] (?: [ຈສຊພຟລ] ໌)? | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [່້໊໋]? ະ | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [່້໊໋]? າ [ກງຍດນມຢບວ]? (?: [ຈສຊພຟລ] ໌)? | ຫ? [ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ] [ຼຣວລ]? [່້໊໋]? ຳ (?: [ຈສຊພຟລ] ໌)? ) [ຯໆ]? | [໑໒໓໔໕໖໗໘໙໐]+ ) )";

my $re_is = Lingua::LO::Transform::Regexp::syllable_short;
is("$re_is", $re_short, "Basic regexp OK");
done_testing;
