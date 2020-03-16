import sys
import numpy as np

seq1 = sys.argv[1]
seq2 = sys.argv[2]

inital_gap = sys.argv[3]
if (initial_gap == 'Y' or initial_gap == 'y')
	initial_gap = True
else 
	initial_gap = False

boolean_modify = input('Do you want to modify the std weights: [Y|N] ')
if (boolean_modify == 'Y' or boolean_modify == 'y'):
	match = float(input('Insert match: '))
	mismatch = float(input('Insert mismatch: '))
	gap = float(input('Insert gap: '))

class Direction: 
    left=1 
    up=2
    leftUp=3

def NeedlemanWunsch(seq1, seq2, match, mismatch, gap, initial_gap):
	S = np.zeros((len(seq1), len(seq2))) # score_matrix 
	D = np.zeros((len(seq1), len(seq2))) # direction_matrix
	
	if (initial_gap):
		# init first row
		for i in range(1, len(seq1)):
	    	M[i][0] = M[i-1][0] + gap
		# init first column
		for j in range(1, len(seq2)):
		    M[0][j] = M[0][j-1] + gap

	# algorithm
	for i in range(1, len(seq1)):
	    for j in range(1, len(seq2)):
	        if seq1[i] == seq2[j]:
	            match_value = match
	        else:
	            match_value = mismatch
	        
	        # match or mismatch, gap1, gap2
	        arr = [] 
	        arr.append(M[i-1][j-1] + matchCase) 
	        arr.append(M[i-1][j] + gap)
	        arr.append(M[i][j-1] + gap)
	        
	