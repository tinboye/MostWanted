/*
*
*  ExileClient_MostWanted_network_addBountyResponse.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_money","_respect","_moneyCost","_respectCost","_display"];
_money = parseNumber(_this select 0);
_respect = parseNumber(_this select 1);
_moneyCost = _money - ExileClientPlayerMoney;
_respectCost = _respect - ExileClientPlayerScore;
ExileClientPlayerMoney = _money;
ExileClientPlayerScore = _respect;
["Success",[format["Bounty successfully set! -%1 poptabs -%2 respect",_moneyCost,_respectCost]]] call ExileClient_gui_notification_event_addNotification;
_display = uiNameSpace getVariable ["MostWantedDialog",displayNull];
if !(isNull _display) then
{
    ctrlEnable [2400,true];
    call ExileClient_MostWanted_Dialog_UpdatePlayerStats;
};
