<!--
Copyright 2010 GoPandas
This file is part of VisitME.

VisitME is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

VisitME is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with VisitME. If not, see http://www.gnu.org/licenses/.
-->


<link rel="stylesheet" type="text/css" href="http://www.umbcs.org/gopandas/visitme/style/styleMsg.css" />
<div class="textAlignCenter">
    <form action="http://apps.facebook.com/{$app_name}/" id="searchForm" method="post">
        Search friend: <fb:friend-selector uid="#request.userID#" name="uid" idname="friend_sel" />
        <input type="submit" value="Go!" />
    </form>
</div>
 <br /><br />