# Copyright (c) 2013, Patrick Uiterwijk <puiterwijk@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Patrick Uiterwijk nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL Patrick Uiterwijk BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Priority queue
from heapq import *


UNDEFINED = -1

class point:
    pass

def OPTICS(db, eps, minPts):
    unprocessed = db
    for p in db:
        p.reachability_distance = UNDEFINED
    while not len(unprocessed) == 0:
        p = unprocessed.pop(0)
        N = getNeighbors(db, p, eps)
        result.append(p)
        Seeds = []
        if (core_distance(p, eps, minPts) != UNDEFINED):
            update(N, p, Seeds, eps, minPts, unprocessed)
            while len(Seeds) != 0:
                q = heappop(Seeds)
                Nacc = getNeighbors(db, q, eps)
                unprocessed.remove(q)
                result.append(q)
                if (core_distance(p, eps, minPts) != UNDEFINED):
                    update(Nacc, q, Seeds, eps, minPts, unprocessed)

def update(N, p, Seeds, eps, minPts, unprocessed):
    coredist = core_distance(p, eps, minPts)
    for o in N:
        if o in unprocessed:
            new_reach_dist = max(coredist, dist(p, o))
            if o.reachability_distance == UNDEFINED:
                o.reachability_distance = new_reach_dist
                heappush(Seeds, (new_reach_dist, o))
            else:
                if new_reach_dist < o.reachability_distance:
                    o.reachability_distance = new_reach_dist
                    Seeds.remove(o)
                    heappush(Seeds, (new_reach_dist, o))
