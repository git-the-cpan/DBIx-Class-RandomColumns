package TestDB::Bar;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(qw/RandomColumns Core/);

__PACKAGE__->table('bar');

__PACKAGE__->add_columns(
    id => {
	data_type => 'varchar',
	is_nullable => 0,
	size => 20,
	is_random => 1,
    },
    string1 => {
	data_type => 'varchar',
	is_nullable => 0,
	size => 32,
	is_random => 1,
    },
    number1 => {
	data_type => 'int',
	is_nullable => 0,
	size => 10,
	extra => {unsigned => 1},
	is_random => {set => [0,1]},
    },
    number2 => {
	data_type => 'int',
	is_nullable => 0,
	size => 10,
	extra => {unsigned => 1},
	is_random => 1,
    },
    string3 => {
	data_type => 'varchar',
	is_nullable => 0,
	size => 10,
	is_random => {size => 3, set => [0..9], check => 1},
    },
    string4 => {
	data_type => 'varchar',
	is_nullable => 0,
	size => 32,
	is_random => 1,
    },
    string5 => {
	data_type => 'varchar',
	is_nullable => 1,
	size => 32,
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['string5']);

1;