#importando biblioteca e aplicando as mesmas
import pyautogui as py
import time as t 
import pyperclip

#abrir navegador
t.sleep(5)
py.press('winleft')
t.sleep(3)
py.write('chrome')
t.sleep(3)
py.press('enter')
t.sleep(3)
py.hotkey('ctrl','n')
t.sleep(3)

#digitar site clima tempo
py.write('Dolar hoje')
py.press('enter')
t.sleep(10)

#Selecionar e copiar as informações da página de clima
t.sleep(2)
py.hotkey('ctrl', 'a') # Seleciona tudo na página
t.sleep(1)
py.hotkey('ctrl', 'c') # Copia para a área de transferência
t.sleep(2)

# Nota: Você pode precisar ajustar a coordenada (x, y) conforme sua tela.
py.click(131, 307, clicks=3) 
py.hotkey('ctrl', 'c')
t.sleep(1)

valor_dolar = pyperclip.paste()

#ENVIAR E-MAIL ---
# Abre o outlook
py.hotkey('ctrl', 't')
py.write('https://outlook.office.com/mail/inbox')
py.press('enter')
t.sleep(10)
py.write('lima.ste@outlook.com', interval=0.05)
py.press('enter')
t.sleep(15)
py.write('ste2020@', interval=0.05)
py.press('enter')
t.sleep(10)

# Inicia novo e-mail (Atalho 'n')
py.press('n')
t.sleep(3)

# Destinatário
py.write("dobby.fofo19@gmail.com", interval=0.05)
py.press('enter')
t.sleep(10)

# Assunto
py.press('tab')
py.write('Relatorio: Cotacao do Dolar')
t.sleep(1)

# Corpo do e-mail
py.press('tab')
mensagem = f"Ola! A cotacao atual do dolar encontrada foi: {valor_dolar}"
py.write(mensagem)

# Enviar (Ctrl + Enter)
t.sleep(2)
py.hotkey('ctrl', 'enter')

print(f"E-mail enviado com a cotação: {valor_dolar}")

