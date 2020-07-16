""" Chunk-based reader for Fasta sequence. """
with open('../data/O13340.fas', 'r') as f:
    seq = "".join(line.rstrip() for line in f)

# use 128 bytes chunks
bsize = 128
read = 0
result = []

with open('../data/O13340.fas', 'r') as f:
    for chunk in iter(lambda: f.read(bsize), ''):
        result.append(chunk)
        read += len(chunk)
        print(read)

# iteration is probably faster than map there
out = ''.join([r.replace('\n', '') for r in result])

assert out == seq