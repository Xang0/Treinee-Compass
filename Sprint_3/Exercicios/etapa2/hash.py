import hashlib

def hash(palavra):

    return hashlib.sha1(palavra.encode('utf-8')).hexdigest()

if __name__ == "__main__":
    palavra = input("Digite uma palavra: ")

    print(f"O hash da palavra {palavra} é {hash(palavra)}")