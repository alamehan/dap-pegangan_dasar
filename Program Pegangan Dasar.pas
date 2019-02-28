Program PeganganDasar;

uses crt;

//=====[Deklarasi Kamus]=====//

const
        max = 10;
type
        arr = array[1..max] of integer;

var
        A : arr;
        n,i : integer;

        //=====[Procedure]=====//

        PROCEDURE insert(var A : arr; i : integer); {A sebagai Array yang akan diisi nilainya, dan i sebagai indeks Array}
        begin
                write('Masukkan nilai Array ke-',i,' = ');
                readln(A[i]); {Memberi nilai untuk indeks Array ke-i}
                readln;
        end;

        PROCEDURE view(var A : arr; i : integer);
        var
                b : integer;
        begin
                writeln('Seluruh elemen Array yang telah diberi nilai');
                writeln('============================================');
                writeln;
                for b:=1 to i do begin {Akan menampilkan nilai dari Array ke-1 sampai Array ke-i/akhir}
                        if (A[b] <> 0) then begin {Kondisi dimana jika nilai Array = 0 tidak akan ditampilkan / sudah di delete}
                                writeln('Nilai Array ke-',b,' = ',A[b]);
                        end;
                end;
                readln;
        end;

        PROCEDURE sort(A : arr; i : integer); {Procedure ini hanya menampilkan saja, tidak mengubah nilai Array aslinya di program utama}
        var
                c,d,e,imin,temp : integer;
        begin
                writeln('Hasil pengurutan Array dari nilai terkecil ke terbesar');
                writeln('======================================================');
                writeln;

                //=====[Metode Selection Sort]=====//

                for c:=1 to i-1 do begin
                        imin := c;

                        for d:=c+1 to i do begin
                                if A[d] < A[imin] then begin
                                        imin := d;
                                end;
                        end;

                //=====[Melakukan Pertukaran]=====//

                temp    := A[c];
                A[c]    := A[imin];
                A[imin] := temp;

                end;

                //=====[Menampilkan Hasil Pengurutan]=====//

                for e:=1 to i do begin
                        if (A[e] <> 0) then begin {Kondisi dimana jika nilai Array = 0 tidak akan ditampilkan / sudah di delete}
                                writeln('Nilai Array ke-',e,' = ',A[e]);
                        end;
                end;

                readln;
        end;

        PROCEDURE search(var A : arr; i : integer);
        var
                f,x,idx,m,z : integer;
                y : string;
        label
                kesana;
        begin
                write('Nilai yang akan dicari dalam Array = ');
                readln(x);

                //=====[Metode Sequential Search]=====//

                f:=1;
                while (f < i) and (A[f] <> x) do begin
                        f := f + 1;
                end;

                if (A[f] = x) and (x <> 0) then begin {Kondisi dimana jika user mencari nilai 0, akan selalu tidak ada}
                        idx := f;

                        //=====[Menampilkan Hasil yang dicari]=====//

                        writeln;
                        writeln('Nilai ',x,' terdapat dalam indeks Array ke-',idx);

                        //=====[Update & Delete]=====//

                        writeln('=========================================');
                        writeln;
                        writeln('1.Update nilai');
                        writeln('2.Delete nilai');
                        writeln('3.Kembali');
                        writeln;
                        kesana: {Tujuan goto kesana}
                        write  ('Pilih Menu ke = ');
                        readln (m);

                        //=====[Kondisi]=====//

                        if (m=1) then begin
                                writeln;
                                write('Masukan nilai baru untuk indeks Array ke-',idx,' = ');
                                readln(z);

                                A[idx] := z;

                                writeln('Anda telah mengganti nilai ',x,' dalam indeks Array ke-',idx,' Menjadi = ',A[idx]);
                                readln;
                        end

                        else if (m=2) then begin
                                writeln;
                                write('Yakin anda akan menghapus indeks Array ke-',idx,' ini (ya/tidak) ? ');
                                readln(y);

                                if y='ya' then begin
                                        A[idx] := 0;
                                        writeln('Anda telah menghapus indeks Array ke-',idx);
                                        readln;
                                end

                                else if y='tidak' then begin
                                        exit;
                                end

                                else begin
                                        writeln;
                                        goto kesana;
                                end;
                        end

                        else if (m=3) then begin
                                exit;
                        end

                        else begin
                                goto kesana; {Kembali meminta user memilih menu}
                        end;
                end

                else begin
                        writeln;
                        writeln('Mohon maaf nilai ',x,' tidak ada dalam Array');
                        readln;
                        exit;
                end;
        end;

label
        kesini; {Deklarasi label untuk GoTo}

//=====[Program Utama]=====//

begin
        i:= 0; {i awal = 0, untuk nanti masuk sebagai indeks Array}

        kesini: {Tujuan Goto kesini}
        clrscr;
        writeln('===== PROGRAM PEGANGAN DASAR =====');
        writeln('>>>>>>> Oleh: M.Raihan.R.A <<<<<<<');
        writeln;
        writeln('1.Insert');
        writeln('2.View');
        writeln('3.Sort');
        writeln('4.Search');
        writeln('5.Exit');
        writeln;
        write  ('Pilih Menu ke = ');
        readln (n);

        //=====[Kondisi]=====//

        if (n=1) then begin
                clrscr;
                i := i+1;       {Setiap insert data baru, i akan selalu bertambah sebagai indeks Array baru}
                insert(A,i);    {Memanggil procedure insert, untuk memasukan nilai kedalam Array}
                goto kesini;    {Kembali ke Menu utama}
        end

        else if (n=2) then begin
                clrscr;
                view(A,i);      {Memanggil procedure view, untuk menampilkan data-data yang sudah diinputkan}
                goto kesini;    {Kembali ke Menu utama}
        end

        else if (n=3) then begin
                clrscr;
                sort(A,i);      {Memanggil procedure sort, untuk mengurutkan data dari nilai terkecil ke terbesar}
                goto kesini;    {Kembali ke Menu utama}
        end

        else if (n=4) then begin
                clrscr;
                search(A,i);    {Memanggil procedure search, untuk mencari apakah nilai yang dicari ada dalam Array}
                goto kesini;    {Kembali ke Menu utama}
        end

        else if (n=5) then begin
                exit;           {Program akan keluar}
        end

        else begin
                goto kesini;    {Program akan meminta user untuk kembali menginputkan menu yg akan dipilih}
        end;

        readln;
end.
