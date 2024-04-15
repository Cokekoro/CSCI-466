Singer:
The requester.
Has an internal ID associated with them, created by the singer and required to be unique.
Name of the requester

DJ:
The DJ
ID, created by DJ required to be unique.
DJ’s name, maybe not necessary to store.

Song:
Song to be requested/Songs in the database
ID, internal ID, perhaps composed of title and version number / filename
Title of the song
Artist Name
Version of the song
File Name for the given version

Contributor:
Each individual contributes to a song.
Name of contributor
ID, internal ID for differentiation

Queues:
The relationship connecting singer, DJ, and song.
Singer queues a song with the DJ.
Priority- in the priority queue, true or false

Contributes:
Relationship between contributors and songs.
Contribution - what was contributed; sung, wrote, guitar, bass, drums, etc.
