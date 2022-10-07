import wptools
import sys

def get_infobox(title):
    soup = wptools.page(title).get_parse()
    infobox = soup.data['infobox']
    return infobox

if __name__ == "__main__":
    print(get_infobox(sys.argv[1]))