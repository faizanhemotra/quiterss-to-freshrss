"""Python function to create hash for FreshRSS database.
Derived from the following issue: https://github.com/FreshRSS/FreshRSS/issues/3141"""


from dataclasses import dataclass
from hashlib import md5


@dataclass
class Entry:
    """A class for storing information about a feed entry."""
    link: str
    title: str
    author: str
    content: str
    tags: str

def create_hash(entry: Entry) -> bytes:
    """
    Create a hash for an entry.

    Parameters
    ----------
    entry : Entry
        The entry to hash.

    Returns
    -------
    bytes
        The resulting hash.
    """
    hash_str = entry.link + entry.title + entry.author + entry.content + entry.tags
    return md5(hash_str.encode('utf-8')).digest()