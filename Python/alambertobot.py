import telepot
import sys, time, random
import pytoolz as lib
from pprint import pprint
from bot_token import TOKEN

bestemmie = 0
warnings = {}
karmas = {}
members = {
'DioDelleMele': 914408072, 'Ariedo24': 1075014903, 'ilbarbi': 673245789
}
bannable = [
     ["dio","madonna","pio"],["no", "porco","puttana","bastardo","schifoso","ladro","boia","cane"]
]
ADMIN_ID = 700801649

def on_chat_message(msg):
    content_type, chat_type, chat_id = telepot.glance(msg)
    #pprint(msg)

    #Text Messages
    if content_type == "text":
        text = msg["text"]
        for i in range(len(bannable[0])):
            for j in range(len(bannable[1])):
                if bannable[0][i] in text.lower() and bannable[1][j] in text.lower():
                    global bestemmie
                    bestemmie += 1
                    bot.sendMessage(chat_id, "Niente bestemmie nella mia chat cristianaaaaa")

        if text == "/username":
            bot.sendMessage(chat_id, "Il tuo username è: @" + msg["from"]["username"])

        if text == "/user_id":
            bot.sendMessage(chat_id, "Il tuo user_id è: " + str(msg["from"]["id"]))

        if text == "/bestemmie":
            bot.sendMessage(chat_id, "Il numero totale di bestemmie è: " + str(bestemmie))

        if "/report" in text:
            if "@" in text:
                user = text.split('@', 1)[1]
                bot.sendMessage(ADMIN_ID, "Utente @" + user + " reportato da parte di @" + msg["from"]["username"])

        if "/ban" in text:
            if msg["from"]["id"] == ADMIN_ID:
                if "@" in text:
                    user = text.split('@', 1)[1]
                    try:
                        bot.kickChatMember(chat_id, members[user])
                    except:
                        bot.sendMessage(chat_id, "Utente " + user + " non trovato.")
            else:
                bot.sendMessage(chat_id, "Non puoi bannare membri dal gruppo. Non hai il potere della Bibbia.")

        if "/mute" in text:
            if msg["from"]["id"] == ADMIN_ID:
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
                bot.sendMessage(chat_id, "Non puoi mutare dei membri. Non hai il potere di Gesù sfi-gay.")

        if "/unmute" in text:
            if msg["from"]["id"] == ADMIN_ID:
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
                bot.sendMessage(chat_id, "Non puoi unmutare dei membri. Non decidere le sorti dei bambini pagani.")

        if text == "/datetime":
            bot.sendMessage(chat_id, "Sono le " + str(lib.hour()) + ":"
             + str(lib.minute()))

        if "/karma" in text:
            if msg["from"]["id"] == ADMIN_ID:
                if "@" in text:
                    user = text.split('@', 1)[1]
                    try:
                        if user in karmas:
                            karmas[user] += 1
                        else:
                            karmas[user] = 1
                        bot.sendMessage(chat_id, "Utente @" + user + " è stato premiato. Per un totale di " + str(karmas[user]) + " di karma.")
                        if karmas[user] == 5:
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
                bot.sendMessage(chat_id, "Non puoi premiare dei membri. Non sei un messager di Cristo. Vergonia")

        if "/warn" in text:
            if msg["from"]["id"] == ADMIN_ID:
                if "@" in text:
                    user = text.split('@', 1)[1]
                    try:
                        if user in warnings:
                            warnings[user] += 1
                        else:
                            warnings[user] = 1
                        bot.sendMessage(chat_id, "Utente @" + user + " ha un warn in più. Per un totale di " + str(warnings[user]))
                        if warnings[user] == 5:
                            bot.kickChatMember(chat_id, members[user])
                    except:
                        bot.sendMessage(chat_id, "Utente @" + user + " non trovato.")
            else:
                bot.sendMessage(chat_id, "Non puoi mutare dei membri. Non hai il potere di Gesù, sfi-gay.")

        if text == "/inneggia":
            for i in range(10):
                bot.sendMessage(
            chat_id, "VIVA IL DUCE! CHE CI CONDUCE! CAMERATA BENITO MUSSOLINI PRESENTE."
            )

        if text == "/random":
            bot.sendMessage(chat_id, str(random.randint(0, 100)))

        if text == "/porn":
            bot.sendMessage(chat_id, "NO PORNNNNNNNNNNNN\n instagram.com/p/CB_ZeejKCBA/?igshid=1qjmebknoevoo")

        if text == "/sourcecode":
            bot.sendMessage(chat_id, "Ecco il codice sorgente di @Alambertobot: attaualmente non disponibile.")

    #Other
    if content_type == "new_chat_member":
        text = msg["new_chat_member"]
        members[text["username"]] = text["id"]
        bot.sendMessage(chat_id, "Benvenuto/a @" + msg["new_chat_member"]["username"] + "! Messaggio inviato da Alambertobot, programmato da Mylak.")
        print(members)

bot = telepot.Bot(TOKEN)
bot.message_loop(on_chat_message)
