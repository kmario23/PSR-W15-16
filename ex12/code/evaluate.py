#! /usr/bin/env python

import re
import numpy as np

def filterBasedOnLogical(iterable,idx_logical):
    numel = len(iterable)
    idx_fltrd = filter(lambda idx: idx_logical[idx],range(0,numel))
    return tuple(map(lambda idx: iterable[idx],idx_fltrd))


def parse_sentences(file):
    rex = re.compile('\s')
    with open(file,'r') as f:
        tokens = tuple( tuple(rex.split(line)) for line in f.read().split('\n') );
    sentenceMark = np.fromiter(
        ( len(line)==1 and len(line[0])==0 for line in tokens),
        'bool')
    sentenceIndex = np.cumsum(sentenceMark)
    sentenceIndex = sentenceIndex[np.logical_not(sentenceMark)]
    
    tokens = filterBasedOnLogical(tokens,np.logical_not(sentenceMark))
    
    numberOfTokensPerLine = np.fromiter( (len(line) for line in tokens),'float')
    numberOfTokens = int(numberOfTokensPerLine[0])
    assert(np.all(numberOfTokens == numberOfTokensPerLine))
    return tokens,sentenceIndex,numberOfTokens

def evaluate(tokens,sentenceIndex,numberOfTokens):
    Ypred = tuple(line[numberOfTokens-1] for line in tokens)
    Y     = tuple(line[numberOfTokens-2] for line in tokens)
    np_idl_nonPOS = np.fromiter((token == 'O' for token in  Y), 'bool')
    np_idl_untagged = np.fromiter((token == 'O' for token in  Ypred), 'bool')
    np_idl_same = np.fromiter((Y[idx]==Ypred[idx] for idx in range(0,len(Y))), 'bool')
    accuracy = np.mean(np_idl_same)
    precision = np.mean(np_idl_same[-np_idl_untagged])
    recall = np.mean(np_idl_same[-np_idl_nonPOS])
    F = 2/(1/precision + 1/recall) 
    return accuracy, precision, recall, F

if __name__ == "__main__":
    import sys
    
    args = sys.argv
    if args[1] == '-q':
        quiet = True
        del args[1]
    else:
        quiet = False
    
    if not quiet:
        print(' accuracy | precision |  recall  |  F-score | file')
    for file in args[1:]:
        tokens,sentenceIndex,numberOfTokens = parse_sentences(file)
    
        accuracy, precision, recall, F = evaluate(tokens,sentenceIndex,numberOfTokens)
        if quiet:
            print('{0:.9f}|{1:s}'.format(F, file))
        else:
            print('{0:^10.6f}|{1:^11.6f}|{2:^10.6f}|{3:^10.6f}| {4:^10s}'.format(accuracy, precision, recall, F, file))
    