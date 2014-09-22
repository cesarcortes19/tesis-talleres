package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * Created by Cesar on 20/09/2014.
 */
@Entity
@Table(name = "pagos")
@DynamicUpdate
public class PagosModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario", nullable = true)
    private UserModel userModel;
    @Column(name = "tipo_pago", nullable = false)
    private PagoType tipoPago;
    @Column(name = "numero_comprobante", nullable = false)
    private String numeroComprobante;
    @Column(name = "meses_pagos", nullable = false)
    private double mesesPagos;
    @Column(name = "monto_ingresado", nullable = false)
    private double montoIngresado;
    @Column(name = "monto_calculado_por_aplicacion", nullable = false)
    private double montoCalculado;
    @Column(name = "status_transaccion", nullable = false)
    private StatusType status;
    @Column(name = "log_transacion", nullable = false)
    private String logTransaccion;

    public enum PagoType {TRANSFERENCIA, DEPOSITO}
    public enum StatusType {PENDIENTE, PAGO, RECHAZADO}

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public PagoType getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(PagoType tipoPago) {
        this.tipoPago = tipoPago;
    }

    public String getNumeroComprobante() {
        return numeroComprobante;
    }

    public void setNumeroComprobante(String numeroComprobante) {
        this.numeroComprobante = numeroComprobante;
    }

    public double getMesesPagos() {
        return mesesPagos;
    }

    public void setMesesPagos(double mesesPagos) {
        this.mesesPagos = mesesPagos;
    }

    public double getMontoIngresado() {
        return montoIngresado;
    }

    public void setMontoIngresado(double montoIngresado) {
        this.montoIngresado = montoIngresado;
    }

    public double getMontoCalculado() {
        return montoCalculado;
    }

    public void setMontoCalculado(double montoCalculado) {
        this.montoCalculado = montoCalculado;
    }

    public String getLogTransaccion() {
        return logTransaccion;
    }

    public void setLogTransaccion(String logTransaccion) {
        this.logTransaccion = logTransaccion;
    }

    public StatusType getStatus() {
        return status;
    }

    public void setStatus(StatusType status) {
        this.status = status;
    }
}
