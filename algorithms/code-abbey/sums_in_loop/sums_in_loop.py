for line in open('input.txt'):
    line = line.split()
    try:
        print(int(line[0]) + int(line[1]), end=' ')
    except:
        pass
