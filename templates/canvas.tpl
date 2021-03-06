<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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


<link rel="stylesheet" type="text/css" href="{$host_url}/style/canvas.css" />
<br /><br /><br /><br />

<div class="center">
    <fb:tabs>
        <fb:tab-item href='index.php' title='Home' selected='true'/>
         <fb:tab-item href='invite.php' title='Invite Friends' selected='false'/>
	<fb:tab-item href='about.php' title='About' selected='false' />
    </fb:tabs>

    <br />
    <img src="{$host_url}/images/visitme_logo.jpg" alt="visitme_logo" />
    <br /><br />
</div>

{if $search}
	<div class="center">
		<span class="warning">Your current location or hometown is not set yet. Your friend(s) will not be able to find you.</span> <br />
		<a href="http://www.facebook.com/profile.php?ref=profile&id={$uid1}#/profile.php?v=info&ref=profile&id={$uid1}" target="showframe">
			Please set your current location or hometown under "Info" tab, "Contact Information" section...
		</a>
	</div>
{else}
	<div class="center">
		<form action="http://apps.facebook.com/{$app_name}/" id="searchForm" method="post">
			Search friend: <fb:friend-selector uid="#request.userID#" name="uid" idname="friend_sel" />
			<input type="submit" value="Go!" />
		</form>
	</div>
{/if}


<br /><br />
 
{if $uid2 != null}
    <div class="center">
         <img src="http://maps.google.com/maps/api/staticmap?size=520x92&markers=color:blue|label:O|{$userLat},{$userLong}&markers=color:green|label:D|{$targetLat},{$targetLong}&path=color:orange|weight:3|{$userLat},{$userLong}|{$targetLat},{$targetLong}&sensor=false&key={$google_map_api_key}" />
    </div>

    <br /><br />

    <table class="userBox center">
        <caption class="userBoxTitle">You can visit <fb:name uid="{$uid2}"/> for...</caption>
        <tr>
            <td class="profilePicBox">
                <fb:profile-pic uid="{$uid1}" linked="true" size="normal" width="90" height="90" />
            </td>
            <td>
                {if $targetLocation == NULL}
			<div>
                            <span class="warning">Flight information is unavailable!</span> <br />
                            <span><fb:name uid="{$uid2}" />'s profile does not have current location or hometown set.</span>
			</div>

                {elseif $nearby}
			<div>You are close enough to drive to <fb:name uid="{$uid2}"/>. Would you like to <a href="http://www.kayak.com/cars">rent a car</a>?</div>

		{elseif $flight1_cost != NULL}
                        <table class="flightInfoBox">
                            <tr>
                                <td width="130">&nbsp; &nbsp;<a class="flightCost" href="{$flight1_buzz}" target="_blank">${$flight1_cost}*</a> </td>
                                <td width="120"><span class="flightPath">{$userAirportCode} <img src="{$host_url}/images/airplane.jpg" alt="airplane" /> {$targetAirportCode} <br />  {$targetAirportCode} <img src="{$host_url}/images/airplane.jpg" alt="airplane" /> {$userAirportCode}</span></td>
                                <td><img src="{$host_url}/images/hotel.jpg" alt="hotel" /> <a href="http://www.kayak.com/s/search/hotel?crc={$targetCity},{if $targetStateCode != NULL}{$targetStateCode},{/if}{$targetCountryCode}&do=y" class="hotelLink" target="_blank">Hotels in {$targetCity}</a></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="8" class="flightDescription">{$flight1_description}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="shareBox">
                                    <fb:share-button class='meta'>
                                        <meta name='title' content='Round-trip fare from {$userAirportCode} to {$targetAirportCode} is ${$flight1_cost}.'/>
                                        <meta name='description' content="{$app_name} is a Facebook application that helps you to find the lowest fare to fly to/from your friend's city." />
                                        <link rel='target_url' href='http://apps.facebook.com/{$app_name}/'/>
                                      </fb:share-button>
                                </td>
                            </tr>
                        </table>

                {else}
                        <span class="warning">Flight information from {$userCity}, {$userState}, {$userCountry} to {$targetCity}, {$targetState}, {$targetCountry} is unavailable.</span>
		{/if}
             </td>
        </tr>
    </table>
  
    <br /><br />
	
    <table class="userBox center">
        <caption class="userBoxTitle"><fb:name uid="{$uid2}"/> can visit you for...</caption>
        <tr>
            <td>
                <fb:profile-pic uid="{$uid2}" linked="true" size="normal" width="90" height="90" />
            </td>
            <td>
		{if $targetLocation == NULL}
                        <div></div>

                {elseif $nearby}
                        <div></div>

		{elseif $flight2_cost != NULL}
			<table class="flightInfoBox">
                            <tr>
                                <td width="130">&nbsp; &nbsp;<a class="flightCost" href="{$flight1_buzz}" target="_blank">${$flight2_cost}*</a> </td>
                                <td width="120"><span class="flightPath">{$targetAirportCode} <img src="{$host_url}/images/airplane.jpg" alt="airplane" /> {$userAirportCode} <br /> {$userAirportCode} <img src="{$host_url}/images/airplane.jpg" alt="airplane" /> {$targetAirportCode} </span></td>
                                <td><img src="{$host_url}/images/hotel.jpg" alt="hotel" /> <a href="http://www.kayak.com/s/search/hotel?crc={$userCity},{if $userStateCode != NULL}{$userStateCode},{/if}{$userCountryCode}&do=y" style="font-family:tahoma;font-size:12px;" target="_blank">Hotels in {$userCity}</a></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="8" class="flightDescription">{$flight2_description}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="shareBox">
                                    <fb:share-button class='meta'>
                                        <meta name='title' content='Round-trip fare from {$targetAirportCode} to {$userAirportCode} is ${$flight2_cost}.'/>
                                        <meta name='description' content="{$app_name} is a Facebook application that helps you to find the lowest fare to fly to/from your friend's city." />
                                        <link rel='target_url' href='http://apps.facebook.com/{$app_name}/'/>
                                    </fb:share-button>
                                </td>
                            </tr>
                         </table>

                {else}
                        <span class="warning">Flight information from {$targetCity}, {$targetState}, {$targetCountry} to {$userCity}, {$userState}, {$userCountry} is unavailable.</span>
		{/if}
             </td>
        </tr>
    </table>
       

    <br /><br />

    {if not $nearby}
        <p class="disclaimer">
            *The fares displayed include all taxes and fees for economy class
            travel and were found by Kayak users in the last 48 hours. Seats are
            limited and may not be available on all flights and days. Fares are
            subject to change and may not be available on all flights or dates of
            travel. Some carriers charge additional fees for extra checked bags.
            Please check the carriers' sites.
        </p>
    {/if}
      
{/if}