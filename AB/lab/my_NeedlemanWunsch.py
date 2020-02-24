string_1 = input('Insert string 1: ')
string_2 = input('Insert string 2: ')

match = 1
mismatch = -1
gap = -2


boolean_modify = input('Do you want to modify the std weights: [Y|N] ')
if (boolean_modify == 'Y' or boolean_modify == 'y'):
	match = float(input('Insert match: '))
	mismatch = float(input('Insert mismatch: '))
	gap = float(input('Insert gap: '))

def NeedlemanWunsch(seq1, seq2, match, mismatch, gap):
	M = [seq1.length + 2, seq2.length + 2]
	M [0,0] = 0
	M [1,0] = "-"
	M [0,1] = "-"
	for i in range(0, seq1.length):
		M [i+2, 0] = seq1[i]

	for i in range(0, seq2.length):
		M [0, i+2] = seq2[i]