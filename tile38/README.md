tile38
======

[Tile38][1] is an open source (MIT licensed), in-memory geolocation data store,
spatial index, and realtime geofence. It supports a variety of object types
including lat/lon points, bounding boxes, XYZ tiles, Geohashes, and GeoJSON.

```bash
$ docker-compose up -d
$ docker-compose exec tile38 tile38-cli
### add a couple of points named 'truck1' and 'truck2' to a collection named 'fleet'.
>>> SET fleet truck1 point 33.5123 -112.2693   # on the Loop 101 in Phoenix
>>> SET fleet truck2 point 33.4626 -112.1695   # on the I-10 in Phoenix
### search the 'fleet' collection.
>>> SCAN fleet                                 # returns both trucks in 'fleet'
>>> nearby fleet point 33.462 -112.268 6000    # search 6 kilometers around a point. returns one truck.
### key value operations
>>> GET fleet truck1                           # returns 'truck1'
>>> DEL fleet truck2                           # deletes 'truck2'
>>> DROP fleet                                 # removes all 
### creates a webhook which points to a geofenced search
>>> SETHOOK warehouse http://example.com/webhook NEARBY fleet FENCE POINT 33.5123 -112.2693 500
```

[1]: https://github.com/tidwall/tile38
