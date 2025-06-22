# マッチング中のtick処理

function sui:game/_common/matching/show_game_title
function sui:game/_common/matching/update_score_title

execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]
execute store result score #can_start sui.participants if score #current_count sui.participants >= MIN_PLAYERS sui.configs
