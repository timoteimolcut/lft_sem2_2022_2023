


counter = 0
for i in range(26):
    for j in range(26):
        for k1 in range(4):
            for k2 in range(4):
                for k3 in range(4):
                    for o in ['+', '-', '*', '/']:
                        for n in range(10):
                            print(i, j, '=', k1, k2, k3, o, n)
                            counter += 1

print(counter)