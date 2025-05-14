IDENTIFICATION DIVISION.
PROGRAM-ID. IMC.

DATA DIVISION.
WORKING-STORAGE SECTION.
    01 DECISAO       PIC X(1) VALUE SPACE.
    01 CENTO         PIC 9(3)V99 VALUE 100.00.
    01 INDIVIDUO.
        02 NOME       PIC X(20).
        02 IDADE      PIC 9(3).
        02 PESO       PIC 9(3).
        02 ALTURA_CM  PIC 9(3).
        02 IMC        PIC 9(2)V99 VALUE 0.00.
    01 ALTURA_M2     PIC 9(4)V99 VALUE 0.00.

PROCEDURE DIVISION.
    PERFORM UNTIL DECISAO = 's' OR DECISAO = 'S'
        DISPLAY "DIGITE O NOME: "
        ACCEPT NOME
        DISPLAY "DIGITE A IDADE: "
        ACCEPT IDADE
        DISPLAY "DIGITE O PESO (EM KG): "
        ACCEPT PESO
        DISPLAY "DIGITE A ALTURA (EM CM): "
        ACCEPT ALTURA_CM
        COMPUTE ALTURA_M2 = (ALTURA_CM / CENTO) ** 2
        COMPUTE IMC = PESO / ALTURA_M2
        DISPLAY "IMC DE ", NOME, ": ", IMC, " KG/M2"
        IF IMC < 18.5
            DISPLAY "MAGREZA"
        ELSE
            IF IMC < 25
                DISPLAY "NORMAL"
            ELSE
                IF IMC < 30
                    DISPLAY "SOBREPESO"
                ELSE
                    DISPLAY "OBESIDADE"
                END-IF
            END-IF
        END-IF
        DISPLAY "DIGITE 's' PARA SAIR, OU OUTRA TECLA PARA CONTINUAR: "
        ACCEPT DECISAO
    END-PERFORM.
    STOP RUN.