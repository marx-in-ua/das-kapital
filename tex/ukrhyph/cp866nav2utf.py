import fileinput
chars = {
    'є': 'ґ',
    'ї': 'є',
    'ў': 'і',
    '∙': 'ї'
}
for line in fileinput.input(openhook=fileinput.hook_encoded("cp866")):
    if line[0] in "%\}":
        continue
    conv = ""
    for char in line.strip():
        if char in chars:
            conv += chars[char]
        else:
            conv += char
    print(conv)