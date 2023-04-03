import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import {searchCliente, createfacturar, historialFacturas } from 'src/app/models/modelos';
import { FormControl } from '@angular/forms';
import { debounce, debounceTime } from 'rxjs';
import { query } from '@angular/animations';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import pdfMake from 'pdfmake/build/pdfMake';
import pdfFonts from 'pdfmake/build/vfs_fonts';
pdfMake.vfs = pdfFonts.pdfMake.vfs;


@Component({
  selector: 'app-facturar',
  templateUrl: './facturar.component.html',
  styleUrls: ['./facturar.component.css']
})
export class FacturarComponent implements OnInit{
  c_facturar:createfacturar = new createfacturar();
  dataTable:any = [];
  control = new FormControl();
  s_cliente:searchCliente = new searchCliente();
  public clientes: Array<any> = []

  constructor(
    private apiService: ApiService,
    public modal: NgbModal
  ){}

  ngOnInit(): void {
      this.ObserverChangeSearch();
  }

  event(){
    this.apiService.allClientes
  }

  onDataTable(){
    this.apiService.getFacturas().subscribe(res => {
      this.dataTable = res;
      console.log(res)
    })
  }

  clear(){
    this.c_facturar.Monto_Solicitado = 0;
    this.c_facturar.Tasa = 0;
    this.c_facturar.Cuotas = 0;
    this.c_facturar.Monto_Pagar = 0;
    this.c_facturar.Cuotas_Mensuales = 0;
    this.c_facturar.Capital = 0;
    this.c_facturar.Interes = 0;
  }

  onAddFacturas(c_facturar:createfacturar):void{
    this.apiService.addFacturas(c_facturar).subscribe(res => {
      if(res){
        console.log(c_facturar, res)
        alert("Factura añadida")
        this.clear();
        this.onDataTable();
      } else {
        alert("Error")
      }
    })
  }

  ObserverChangeSearch(){
    this.control.valueChanges
    .pipe(
      debounceTime(500)
    )
    .subscribe(query => {
      console.log(query);

      this.apiService.searchClientedetail(query).subscribe(
        (res:any) => {
          this.clientes = res;
        },
        (object) => {
          console.log(object);
        }
      )
    });
  }

  onSetData(select:any){
    this.s_cliente.ID_USUARIO = select.ID_USUARIO;
    this.s_cliente.Nombre_Apellido = select.Nombre_Apellido;
    this.s_cliente.Cedula = select.Cedula;
    this.s_cliente.Telefono = select.Telefono;
    //Facturar
    this.c_facturar.Usuario_ID = this.s_cliente.ID_USUARIO;
    this.c_facturar.Nombre_Apellido = this.s_cliente.Nombre_Apellido;
    this.c_facturar.Telefono = this.s_cliente.Telefono;
    this.c_facturar.Cedula = this.s_cliente.Cedula;
  }



  calculos(){
    this.c_facturar.Monto_Pagar = (this.c_facturar.Monto_Solicitado*this.c_facturar.Tasa/this.c_facturar.Cuotas);
    this.c_facturar.Cuotas_Mensuales = (this.c_facturar.Monto_Pagar*this.c_facturar.Tasa/this.c_facturar.Cuotas);
    this.c_facturar.Capital = (this.c_facturar.Monto_Solicitado/this.c_facturar.Cuotas);
    this.c_facturar.Interes = (this.c_facturar.Cuotas_Mensuales-this.c_facturar.Capital);
  }

  /*Generando PDF */
  /*createPdf(){
    const pdfDefinition: any = {
      content: [
        {
          text:'Grupos FYCAS',
          style: 'header',
          alignment:'center'
        },
        {
          text:'Factura para el Señor/a: ' + this.s_cliente.Nombre_Apellido,
          style: 'subheader',
        },
      ],
      styles: {
        header: {
          fontSize: 20,
          bold: true,
          aligment: 'justify'
        },
        subheader: {
          fontSize: 12,
          alignment: 'right'
        }
      }
    }

    const pdf = pdfMake.createPdf(pdfDefinition);
    pdf.open();
  }*/

}
