import telepot
import sys, time, random, urllib3
from pprint import pprint
from bot_privacy import TOKEN, DEVELOPER_ID, members, bannable, groups, ADMIN_ID, BOT_ID

file = open("data.txt","a")
groups_file = open("groups.txt","a")
members_file = open("members.txt", "a")

bannable_global = 0
groups_info = {}
users = {}

info = ('''
    Questo bot è stato sviluppato da Mylak, a partire da giugno 2020, in Python 3.7.3, con la libreria telepot.
    Il codice sorgente è reperibile tramite il comando /sourcecode
    Ecco la lista dei comandi:

    /bannable - mostra il numero totale di parole bandite rilevate
    /report - segnala un utente al developer (me)
    /ban - banna una persona dal gruppo
    /mute - muta una persona per sempre
    /unmute - unmuta una persona
    /karma - il contrario di warn
    /warn - da un'ammonizione ad un utente
    /random - mostra un numero random da 1 a 100
    /sourcecode - mostra il codice sorgente del bot (seguitemi su github plis)
    /suggest - comando per suggerire un nuovo comando al developer (me)
    /info - informazioni sull utentw
''')

# PYTHONANYWHERE THINGS:
proxy_url = "http://proxy.server:3128"
telepot.api._pools = {
    'default': urllib3.ProxyManager(proxy_url=proxy_url, num_pools=3, maxsize=10, retries=False, timeout=30),
}
telepot.api._onetime_pool_spec = (
urllib3.ProxyManager, dict(proxy_url=proxy_url, num_pools=1, maxsize=1, retries=False, timeout=30))
# END PYTHONANYWHERE THINGS:

def on_chat_message(msg):
    content_type, chat_type, chat_id = telepot.glance(msg)
    #pprint(msg)

    #Text Messages
    if content_type == "text":
        text = msg["text"]
        msg_username = msg["from"]["username"]
        msg_user_id = str(msg["from"]["id"])
        members_file = open("members.txt", "a")
        if not msg_username in members:
            members_file.write(msg_username + ":" + msg_user_id + "\n")

        file = open("data.txt", "a")
        if msg["chat"]["type"] == "supergroup" or msg["chat"]["type"] == "group":
            title = msg["chat"]["title"]
            groups[title] = chat_id
            file.write("Nel gruppo: " + title + "(id=" + str(chat_id) + ")" + " Ã¨ stato scritto da ")
            file.write(msg_username + "(id=" + msg_user_id + "): " + text + "\n")
        elif msg["chat"]["type"] == "private":
            file.write(msg_username + "(id=" + msg_user_id + "): " + text + "\n")
        file.close()

        members[msg_username] = msg_user_id
        with open("members.txt") as member:
            for line in member:
                file_username, file_user_id = line.strip().split(":")
                members[file_username] = file_user_id

        #Bannable Counter
        for i in range(len(bannable[0])):
            for j in range(len(bannable[1])):
                if bannable[0][i] in text.lower() and bannable[1][j] in text.lower():
                    global bannable_global
                    bannable_global += 1

        #Comandi
        if "/" in text:
            if text == "/start":
                bot.sendMessage(chat_id, info)
            elif text == "/info":
                if not msg_username in users[warnings]:
                    users[warnings[msg_username]] = 0
                if not msg_username in users[karmas]:
                    users[karmas[msg_username]] = 0
                bot.sendMessage(chat_id, "Il tuo username è: @" +
                msg_username +
                "Il tuo user_id è: " +
                str(msg_user_id) +
                " Hai" + str(users[warnings[msg_username]]) + " ammonizioni e " 
                + str(users[karmas[msg_username]]) + " di karma."
                )
            elif text == "/bannable":
                bot.sendMessage(chat_id, "Il numero totale di parole bandite è: " + str(bannable_global))
            elif "/report" in text:
                if "@" in text:
                    user = text.split('@', 1)[1]
                    bot.sendMessage(DEVELOPER_ID, "Utente @" + user + " reportato da parte di @" + msg_username)
                else:
                    bot.sendMessage(chat_id, "Devi specificare un utente")
            elif "/ban" in text:
                if msg_user_id == ADMIN_ID:
                    if "@" in text:
                        user = text.split('@', 1)[1]
                        try:
                            bot.kickChatMember(chat_id, members[user])
                        except:
                            bot.sendMessage(chat_id, "Utente " + user + " non trovato.")
                else:
                    bot.sendMessage(chat_id, "Non puoi bannare membri dal gruppo.")
            elif "/mute" in text:
                if msg_user_id == ADMIN_ID:
                    if "@" in text:
                        user = text.split('@', 1)[1]
                        try:
                            bot.restrictChatMember(chat_id, members[user],
                            until_date=None,
                            can_send_messages=False,
                            can_send_media_messages=False,
                            can_send_other_messages=False,
                            can_add_web_page_previews=False)
                            bot.sendMessage(chat_id, "Utente @" + user + " mutato.")
                        except:
                            bot.sendMessage(chat_id, "Utente @" + user + " non trovato.")
                else:
                    bot.sendMessage(chat_id, "Non puoi mutare dei membri.)
            elif "/unmute" in text:
                if msg_user_id == ADMIN_ID:
                    if "@" in text:
                        user = text.split('@', 1)[1]
                        try:
                            bot.restrictChatMember(chat_id, members[user],
                            until_date=None,
                            can_send_messages=True,
                            can_send_media_messages=True,
                            can_send_other_messages=True,
                            can_add_web_page_previews=True)
                            bot.sendMessage(chat_id, "Utente @" + user + " unmutato.")
                        except:
                            bot.sendMessage(chat_id, "Utente @" + user + " non trovato.")
                else:
                    bot.sendMessage(chat_id, "Non puoi unmutare dei membri.)
            elif "/karma" in text:
                if msg_user_id == ADMIN_ID:
                    if "@" in text:
                        user = text.split('@', 1)[1]
                        try:
                            if karmas in user:
                                if user in karmas:
                                    users[karmas[user]] += 1
                                else:
                                    users[karmas[user]] = 1
                            else:
                                users[karmas[user]] = 0
                            bot.sendMessage(chat_id, "Utente @" + user + " è stato premiato. Per un totale di " + str(users[karmas[user]]) + " di karma.")
                            if users[karmas[user]] == 5:
                                bot.promoteChatMember(chat_id, members[user],
                                 can_change_info=False,
                                 can_post_messages=True,
                                 can_edit_messages=True,
                                 can_delete_messages=False,
                                 can_invite_users=True,
                                 can_restrict_members=False,
                                 can_pin_messages=False,
                                 can_promote_members=False)
                        except:
                            bot.sendMessage(chat_id, "Utente @" + user + " non trovato.")
                    else:
                        bot.sendMessage(chat_id, "Devi specificare una persona col simbolo @")
                else:
                    bot.sendMessage(chat_id, "Non puoi premiare dei membri.")
            elif "/warn" in text:
                if msg_user_id == ADMIN_ID:
                    if "@" in text:
                        user = text.split('@', 1)[1]
                        try:
                            if warnings in users:
                                if user in warnings:
                                    users[warnings[user]] += 1
                                else:
                                    users[warnings[user]] = 1
                            else:
                                users[warnings[user]] = 0
                            bot.sendMessage(chat_id, "Utente @" + user + " ha un warn in più. Per un totale di " + str(warnings[user]))
                            if users[warnings[user]] == 5:
                                bot.kickChatMember(chat_id, members[user])
                        except:
                            bot.sendMessage(chat_id, "Utente @" + user + " non trovato.")
                    else:
                        bot.sendMessage(chat_id, "Devi specificare una persona col simbolo @")
                else:
                    bot.sendMessage(chat_id, "Non puoi dare ammonizioni a dei membri.")
            elif text == "/random":
                bot.sendMessage(chat_id, str(random.randint(0, 100)))
            elif text == "/sourcecode":
                bot.sendMessage(chat_id, "Ecco il codice sorgente di @Alambertobot: https://github.com/mylak005/Projects/blob/master/Python/alambertobot.py")
            elif "/suggest" in text:
                if "!" in text:
                    comando = text.split('!', 1)[1]
                    bot.sendMessage(chat_id, "Grazie per il suggerimento. Le faremo sapere se verrà  preso in considerazione.")
                    bot.sendMessage(DEVELOPER_ID, msg_username + "ha suggerito il comando !" + comando)
                else:
                    bot.sendMessage(chat_id, "La sintassi è errata. Prova con: /suggest !nomecomando - descrizione del comando")

    #Other
    if content_type == "new_chat_member":
        file = open("data.txt","a")
        groups_file = open("groups.txt", "a")
        if msg["new_chat_member"]["id"] == BOT_ID:
            file.write("Nuovo gruppo: " + msg["chat"]["title"] + "(id=" + str(chat_id) + ")" + "\n")
            groups_file.write(msg["chat"]["title"] + " : " + str(chat_id) + "\n")
        else:
            new_chat_member = msg["new_chat_member"]
            members[new_chat_member["username"]] = new_chat_member["id"]
            bot.sendMessage(chat_id, "Benvenuto/a @" + new_chat_member["username"] + "! \n Messaggio inviato da Alambertobot, programmato da Mylak.")
            file.write(members +  + "\n")
        file.close()
        groups_file.close()

    if content_type == "left_chat_member":
        file = open("data.txt","a")
        if msg["left_chat_member"]["id"] == BOT_ID:
            file.write("Alambertobot è stato tolto dal gruppo: " + msg["chat"]["title"] + "(id=" + str(chat_id) + ")" + "\n")
        else:
            new_chat_member = msg["left_chat_member"]
            bot.sendMessage(chat_id, "Addio @" + new_chat_member["username"] + "! \n Messaggio inviato da Alambertobot, programmato da Mylak.")
        file.close()

bot = telepot.Bot(TOKEN)
bot.message_loop(on_chat_message)
