
new_lines = []
with open("./bibliography.bib", mode="r+") as fread:
    lines = fread.readlines()

for line in lines:
    if "language = " in line:
        continue
    else:
        new_lines.append(line)

content = ''.join(new_lines)
print(content)
with open("./bibliography.bib", mode="w+") as fwrite:
    fwrite.write(content)
